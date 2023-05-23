class ApiResponse {
  Object? data;
  String? error;
}

// Tem o intuito de buscar uma resposta da api requisitada
// Pode ser um resposta com dados, como no object "data", que traz consigo informações que foram requisitadas
// Ou informações negativas, como o "error", que traz somente um menssagem de erro