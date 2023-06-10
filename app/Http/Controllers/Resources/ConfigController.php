<?php

declare(strict_types=1);

namespace App\Http\Controllers\Resources;

use App\Http\Requests\Config\QqQunOrCode;
use Baijunyao\LaravelRestful\Traits\Index;
use Baijunyao\LaravelRestful\Traits\Show;
use Baijunyao\LaravelRestful\Traits\Update;
use Illuminate\Http\JsonResponse;

class ConfigController extends Controller
{
    use Index, Show, Update;

    protected const PER_PAGE = 1000;

    public function uploadQqQunOrCode(QqQunOrCode $request): JsonResponse
    {
        $result = [
            'success' => 1,
            'message' => 'success',
            'url'     => '',
        ];

        foreach (config('bjyblog.upload_disks') as $disk) {
            $file = $request->file('file');

            assert($file instanceof \Illuminate\Http\UploadedFile);

            $result['url'] = '/' . $file->store('uploads/images', $disk);
        }

        return response()->json($result);
    }
}
