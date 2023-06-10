<?php

declare(strict_types=1);

namespace App\Rules;

use App\Models\Comment as CommentModel;
use Illuminate\Contracts\Validation\Rule;
use Illuminate\Support\Facades\Date;

class Comment implements Rule
{
    /**
     * @var string
     */
    private $message;

    /**
     * Determine if the validation rule passes.
     *
     * @param string $attribute
     * @param mixed  $value
     *
     * @return bool
     */
    public function passes($attribute, $value)
    {
        if (in_array($value, ['test', '测试'])) {
            $this->message = translate('Nhận xét không có nghĩa');

            return false;
        }

        if (empty(CommentModel::imageToUbb($value))) {
            $this->message = translate('Nội dung không được bỏ trống');

            return false;
        }

        /** @var \App\Models\SocialiteUser $socialite_user */
        $socialite_user = auth()->guard('socialite')->user();

        if ($socialite_user->is_blocked === 1) {
            $this->message = translate('Người dùng bị cấm bình luận');

            return false;
        }

        /** @var \Illuminate\Support\Carbon|null $last_comment_date */
        $last_comment_date = CommentModel::where('socialite_user_id', $socialite_user->id)
            ->orderBy('created_at', 'desc')
            ->value('created_at');

        if ($socialite_user->is_admin !== 1 && $last_comment_date !== null && $last_comment_date->diffInMinutes() === 0) {
            $this->message = translate('Nhận xét quá thường xuyên, vui lòng thử lại sau.');

            return false;
        }

        $count = CommentModel::where('socialite_user_id', $socialite_user->id)
            ->whereDate('created_at', '=', Date::today())
            ->count();

        if ($socialite_user->is_admin !== 1 && $count > 10) {
            $this->message = translate('Bình luận đã bị hạn chế');

            return false;
        }

        return true;
    }

    /**
     * Get the validation error message.
     *
     * @return string
     */
    public function message()
    {
        return $this->message;
    }
}
