import '../models/livro.dart';
import '../service/livro-service.dart';

class LivroController {
  final LivroService _service = LivroService();

  Future<List<Livro>> pesquisar(String termo) async {
    // Validação simples antes de chamar a API
    if (termo.trim().isEmpty) {
      throw Exception('Digite o nome de um livro para pesquisar.');
    }

    return await _service.buscarLivros(termo);
  }
}