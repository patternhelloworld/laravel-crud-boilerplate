<?php

namespace App\Http\Controllers\Api;


use App\Exceptions\database\ForeignKeyException;
use App\Exceptions\database\RowNotFoundException;
use App\Http\Controllers\Controller;
use App\Http\DTOs\LessonStoreDTO;
use App\Http\Requests\LessonStoreRequest;
use App\Models\Enrollment;
use App\Models\Lesson;

class LessonController extends Controller
{

    /**
     *
         * Store a lesson & End it.
         * [CourseController 의 delete 참조] 다른 곳의 USER 또는 COURSE 를 비활성화 하는 코드에서 Transaction 을 사용하여
         * Enrollment, Lesson 테이블 까지 deleted_at 을 표시하는 일관성을 보장해야 한다.

     * @param LessonStoreRequest $request
     * @return \Illuminate\Http\JsonResponse
     * @throws ForeignKeyException
     * @throws \Throwable
     */
    public function store(LessonStoreRequest $request)
    {
        $lessonStoreDTO = LessonStoreDTO::fromRequest($request);

        $enrollment = Enrollment::getOne($lessonStoreDTO->getCourseId(), $lessonStoreDTO->getStudentId());
        if(!$enrollment){
            throw new RowNotFoundException("Couldn't find the enrollment. (Course ID : " . $lessonStoreDTO->getCourseId() . ", Student ID : " . $lessonStoreDTO->getStudentId() . ")");
        }

        Lesson::create([
            'enrollment_id' => $enrollment->id,
            'status' => $lessonStoreDTO->getStatus(),
            'result' => $lessonStoreDTO->getResult(),
            'recording' => $lessonStoreDTO->getRecording()
        ]);

        // 이메일 발송의 경우 laravel-queue 를 사용하여 구현. (Dockerfile 에서 supervisor 를 설치하여 이를 관리 (동시에 몇 개를 실행해야 할 지, 실패 시 재시도 횟수 등) 해야 함.)

        return response()->json(null, 201);
    }

}
