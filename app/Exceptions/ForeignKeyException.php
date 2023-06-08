<?php

namespace App\Exceptions;

use Exception;

class ForeignKeyException extends Exception
{
    public function __construct($message = null)
    {
        $message = $message ?: 'Foreign key constraint violation.';
        parent::__construct($message, 422);
    }

}