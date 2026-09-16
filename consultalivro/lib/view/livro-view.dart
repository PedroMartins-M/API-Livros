import 'dart:io';
import '../controllers/livro_controller.dart';

class LivroView {
  final LivroController _controller = LivroController();

  Future<void> iniciar() async {
    print('=== BUSCADOR DE LIVROS ===');
    stdout.write('Digite o nome do livro: ');
    final entrada = stdin.readLineSync() ?? '';

    try {
      print('\nBuscando...');
      final livros = await _controller.pesquisar(entrada);

      print('\n--- RESULTADOS ENCONTRADOS (${livros.length}) ---');
      for (var livro in livros) {
        print('\nTítulo: ${livro.title}');
        print('Autor(es): ${livro.authorName.join(', ')}');
        print('Ano de Publicação: ${livro.firstPublishYear}');
        print('Edições: ${livro.editionCount}');
        print('Idiomas: ${livro.language.join(', ')}');
        print('-' * 30);
      }
    } catch (e) {
      print('\n[ERRO]: $e');
    }
  }
}