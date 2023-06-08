<?php

namespace App\Http\Controllers\Api;


use App\Exceptions\ForeignKeyException;
use App\Exceptions\RowNotFoundException;
use App\Http\DTOs\LessonStoreDTO;
use App\Http\Requests\LessonStoreRequest;

use App\Http\Controllers\Controller;
use App\Models\Course;
use App\Models\Enrollment;
use App\Models\Lesson;
use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\DB;

class LessonController extends Controller
{

    /**
     *
         * Store a newly created lesson.
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
        ]);

        return response()->json(null, 201);
    }

}
