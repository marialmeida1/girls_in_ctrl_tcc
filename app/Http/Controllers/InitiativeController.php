<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Initiative;

class InitiativeController extends Controller
{
    public function initiative(Request $request)
    {

        $iniciativa = new Initiative;        
        $iniciativa->card = $request->input('card');
        $iniciativa->name = $request->input('name');
        $iniciativa->link = $request->input('link');
        $iniciativa->save();

        return response()->json(['message' => 'Dados inseridos com sucesso']);
    }

    public function getInitiative($card)
    {
        try {
            // Buscar a iniciativa com base no campo "card"
            $initiative = Initiative::where('card', $card)->first();
    
            if ($initiative) {
                // Retornar a iniciativa como uma resposta JSON
                return response()->json(['message' => '$initiative'], 200);
            } else {
                // Retornar erro caso a iniciativa não seja encontrada
                return response()->json(['error' => 'Iniciativa não encontrada'], 404);
            }
        } catch (\Exception $e) {
            // Lidar com erros
            return response()->json(['error' => 'Erro ao buscar iniciativa'], 500);
        }
    }

    

    public function update(Request $request, $card)
    {   
    try {
        // Buscar a iniciativa com base no campo "card"
        $iniciativa = Initiative::where('card', $card)->first();

        if ($iniciativa) {
            // Atualizar as variáveis "name" e "link" com os novos valores
            $iniciativa->name = $request->input('name');
            $iniciativa->link = $request->input('link');
            $iniciativa->save();

            // Retornar uma resposta de sucesso
            return response()->json(['message' => 'Iniciativa atualizada com sucesso'], 200);
        } else {
            // Retornar erro caso a iniciativa não seja encontrada
            return response()->json(['error' => 'Iniciativa não encontrada'], 404);
        }
    } catch (\Exception $e) {
        // Lidar com erros
        return response()->json(['error' => 'Erro ao atualizar iniciativa'], 500);
    }
    }

    
    
}
