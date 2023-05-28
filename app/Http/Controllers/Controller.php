<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\URL;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    // Função que salva as imagens
    // $image = recebe a imagem que foi enviada
    // $path define o caminho, caso nao tenha um caminho definido, ele vai para public para via das duvidas
    public function saveImage($image, $path = 'public')
    {
        // retorna nulo caso nao seja adicionado imagem
        if (!$image) {
            return null;
        }
        // salva a imagem de maneira unica de acordo com o tempo que foi salva
        $filename = time() . '.png';

        // define o local que a imagem vai ser salva, e faz um "put"(atualiza) o local
        // o base64_decode serve como um decodificador binario do código que foi enviado da imagem
        Storage::disk($path)->put($filename, base64_decode($image));

        // salva a imagem no local estipulado
        return URL::to('/') . '/storage/' . $path . '/' . $filename;
    }   
}
