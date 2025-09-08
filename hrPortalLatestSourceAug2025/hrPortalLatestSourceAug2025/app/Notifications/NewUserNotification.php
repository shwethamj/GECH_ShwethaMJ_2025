<?php

namespace App\Notifications;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Notifications\Messages\MailMessage;
use Illuminate\Notifications\Notification;

class NewUserNotification extends Notification
{
    use Queueable;

    public $user;

    /**
     * Create a new notification instance.
     *
     * @return void
     */
    public function __construct($user)
    {
        $this->user = $user;
    }

    /**
     * Get the notification's delivery channels.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function via($notifiable)
    {
        return ['mail','database'];
    }

    /**
     * Get the mail representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return \Illuminate\Notifications\Messages\MailMessage
     */
    public function toMail($notifiable)
    {
        $url = route('users',['id' => $this->user['id']]);
        return (new MailMessage)
                    ->subject('New User Created') //add subject line
                    ->greeting('Hello!') //add greeting
                    ->line('A new user has been created in our HR Portal') //modify the content
                    ->line($this->user['name'].' created an account with the following details: ')
                    ->line('Username: '. $this->user['username']) //add line break
                    ->line('Email: '. $this->user['email']) //add line break
                    // ->action('View User', $url) //modify the action button text
                    ->line('Thank you for using our HR Portal!'); //modify the closing message
                    
    }


    /**
     * Get the array representation of the notification.
     *
     * @param  mixed  $notifiable
     * @return array
     */
    public function toArray($notifiable)
    {
        return [
            'user_id' => $this->user['id'],
        ];
    }
}
