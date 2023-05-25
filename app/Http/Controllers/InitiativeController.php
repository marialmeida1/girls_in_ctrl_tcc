<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Initiative;


class InitiativeController extends Controller
{
    public function addInitiative(Request $request) {


        $validate = $request->validate([
            'name' => 'required|string',
            'link' => 'required|string',
        ]);

        $image = $this->saveImage($request->image, 'initiative');

        $iniciativa = new Initiative;
        $iniciativa->name = $request->$validate(input('nome'));
        $iniciativa->path_image = $request->input($image);
        $iniciativa->link = $request->$validate(input('link'));
        $iniciativa->save();

        return response()->json(['message' => 'Dados inseridos com sucesso']);

    }
}
