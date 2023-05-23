<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Illuminate\Support\Facades\Auth;


class AuthController extends Controller
{
    // Register
    public function register(Request $request)
    {

        // Validação do Usuário
        $validate = $request->validate([
            'name' => 'required|string',
            'lastname' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6|confirmed'
        ]);

        // Criação do Usuário
        $user = User::create([
            'name' => $validate['name'],
            'lastname' => $validate['lastname'],
            'email' => $validate['email'],
            'password' => bcrypt($validate['password'])
        ]);

        // Retorna um resposta bem sucedida do cadastro do usuário
        return response([
            'user' => $user,
            'token' => $user->createToken('secret')->plainTextToken
        ]);
    }


    // Login
    public function login(Request $request)
    {

        // Validação do Usuário
        $validate = $request->validate([
            'email' => 'required|email',
            'password' => 'required|min:6'
        ]);

        // Logando o usuário a sua conta

        // Vai entrar e ver se o usuário existe
        // O Auth faz essa fiscalização
        // Se não der certo da um erro 403 e se der certo da uma resposta 200
        if (!Auth::attempt($validate)) {
            return response(
                ['message' => 'Cadastro Invalido!'],
                403
            );
        }
        return response([
            'user' => auth()->user(),
            // O token cria um token de autentificação e transforma em uma string legível
            'token' => $request->user()->createToken('secret')->plainTextToken
        ], 200);

        //  Cliente recebe o token de autenticação para posteriormente autenticar solicitações subsequentes à API.
    }

    // Update
    public function update(Request $request)
    {
        // Responsável por validar as informações do name e do lastname
        $validate = $request->validate([
            'name' => 'required|string',
            'lastname' => 'required|string'
        ]);

        // pega a imagem e valida ela pelo método saveImage que está no controller
        $image = $this->saveImage($request->image, 'profiles');

        // faz o update das informações recebidas por meio dos métodos $validate e $image
        $request->user()->update(
            [
                'name' => $validate['name'],
                'lastname' => $validate['lastname'],
                'image' => $image
            ]
        );

        // faz a atualização e envia uma mensagem 200, que deu certo
        return response([
            'message' => "Usuário Atualizado",
            'user' => auth()->user()
        ], 200);
    }


    // Logout
    public function logout(Request $request)
    {
        // Deleta todos os tokens que foram utilizados por esse usuário
        $request->user()->tokens()->delete();
        return response([
            'message' => 'Logout com sucesso!'
        ]);
    }


    // Informações do Usuário
    public function user()
    {
        // Pega as informações do usuário e retorna em formato json
        return response([
            'user' => auth()->user()
        ], 200);
    }
}
