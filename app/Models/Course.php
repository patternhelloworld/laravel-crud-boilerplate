<?php

namespace App\Models;

use Database\Factories\ArticleFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Contracts\Pagination\Paginator;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Course extends Model
{
    // use soft delete instead of permanent delete
    use SoftDeletes;
    use HasFactory;

    /**
     * The table associated with the model.
     *
     * @var string
     */
    protected $table = 'courses';

    protected $fillable = ['students_id', 'course_id', ];

    /**
     * The attributes that should be mutated to dates.
     *
     * @var array
     */
    protected $dates = ['deleted_at'];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [

    ];

    /**
     * Load all for admin and paginate
     *
     * @return Paginator
     */
    public static function loadAll(): Paginator
    {
        return static::latest()
            ->paginate();
    }


    public function tutor(): BelongsTo
    {
        return $this->belongsTo(User::class, 'tutor_id');
    }

    public function enrollments(): \Illuminate\Database\Eloquent\Relations\HasMany
    {
        return $this->hasMany(Enrollment::class, 'course_id');
    }


    public static function getAvailableCourses(string $language = null, string $type = null)
    {
        $query = self::query()->where('available', true);

        if ($language) {
            $query->where('language', $language);
        }

        if ($type) {
            $query->where('type', $type);
        }

        return $query->latest()->paginate();
    }

    public static function getAvailableOne(string $id = null)
    {
        $now = now();

        return self::query()->where('available_from', '<=', $now)
            ->where('available_until', '>=', $now)->find($id);

    }
}
