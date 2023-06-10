<?php

declare(strict_types=1);

namespace App\Http\Controllers\Home;

use App\Http\Controllers\Controller;
use App\Models\Tag;
use Illuminate\View\View;

class TagController extends Controller
{
    public function show(Tag $tag): View
    {
        $articles = $tag->articles()
            ->orderBy('created_at', 'desc')
            ->with(['category', 'tags'])
            ->paginate(10);

        $head = [
            'title'       => $tag->name,
            'keywords'    => $tag->keywords,
            'description' => $tag->description,
        ];
        $assign = [
            'category_id'  => 'index',
            'articles'     => $articles,
            'tagName'      => $tag->name,
            'title'        => $tag->name,
            'head'         => $head,
        ];

        return view('home.index.index', $assign);
    }
}
