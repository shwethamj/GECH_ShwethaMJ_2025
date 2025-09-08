<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use App\Models\User;

class SendUserCredentials extends Mailable
{
    use Queueable, SerializesModels;

    public $username;
    public $email;
    public $visible_password;

    public function __construct($username, $email, $password)
    {
        $this->username = $username;
        $this->email = $email;
        $this->visible_password = $password;
    }

    public function build()
    {
        return $this->subject('Your Credentials')->view('emails.user-credentials');
    }
}