<?php

declare(strict_types=1);

namespace App\Http\Controllers;

use App\Models\Article;
use App\Models\Comment;
use App\Models\Note;
use App\Models\SocialiteUser;
use DB;
use Illuminate\Http\JsonResponse;

class DashboardController extends Controller
{
    public function analysis(): JsonResponse
    {
        $mysql_version = DB::connection()->getPdo()->query('SELECT VERSION();');

        $version     = [
            'latest_socialite_users' => SocialiteUser::orderBy('updated_at', 'desc')->limit(5)->get(),
            'latest_comments'        => (new Comment())->getLatestComments(5),
            'versions'               => [
                'system'     => PHP_OS,
                'web_server' => $_SERVER['SERVER_SOFTWARE'] ?? '',
                'php'        => PHP_VERSION,
                'mysql'      => $mysql_version === false ? '' : $mysql_version->fetchColumn(),
            ],
            'counts' => [
                'articles'        => Article::withTrashed()->count(),
                'comments'        => Comment::withTrashed()->count(),
                'notes'           => Note::withTrashed()->count(),
                'socialite_users' => SocialiteUser::withTrashed()->count(),
            ],
        ];

        return response()->json($version);
    }
}
