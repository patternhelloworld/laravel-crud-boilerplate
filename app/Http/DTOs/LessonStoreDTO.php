<?php

namespace App\Http\DTOs;

use App\Http\Requests\LessonStoreRequest;
use Spatie\DataTransferObject\DataTransferObject;

class LessonStoreDTO extends DataTransferObject
{
    public $student_id;
    public $course_id;

    public static function fromRequest(LessonStoreRequest $request): LessonStoreDTO
    {
        return new static([
            'student_id' => $request->input('student_id'),
            'course_id' => $request->input('course_id'),
        ]);
    }

    /**
     * @return mixed
     */
    public function getStudentId()
    {
        return $this->student_id;
    }

    /**
     * @return mixed
     */
    public function getCourseId()
    {
        return $this->course_id;
    }




}