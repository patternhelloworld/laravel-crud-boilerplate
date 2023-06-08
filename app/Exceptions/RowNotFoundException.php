<?php

namespace App\Exceptions;

use Exception;

class RowNotFoundException extends Exception
{
    public function __construct($message = null)
    {
        $message = $message ?: 'Row NOT found on DB.';
        parent::__construct($message, 404);
    }

}