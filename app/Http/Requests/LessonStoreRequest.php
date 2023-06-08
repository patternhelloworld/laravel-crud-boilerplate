<?php

namespace App\Http\Requests;

use App\Http\Rules\CourseValidity;
use App\Http\Rules\StudentUserId;
use App\Http\Rules\TutorUserId;
use Illuminate\Foundation\Http\FormRequest;

class LessonStoreRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'student_id'  => ['required', new StudentUserId],
            'course_id'  => ['required',  new CourseValidity],
        ];
    }
}
