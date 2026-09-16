import 'dart:convert';
import 'package:http/http.dart' as http;
import '/models/livro.dart';

class LivroService {
  Future<List<Livro>> buscarLivros(String termo) async {
    final url = Uri.parse('https://openlibrary.org/search.json?q=$termo');

    print('--> 1. Enviando requisição para: $url');

    try {
      final resposta = await http.get(url);
      print('--> 2. Código de Status recebido: ${resposta.statusCode}');

      if (resposta.statusCode == 200) {
        final Map<String, dynamic> dados = jsonDecode(resposta.body);
        final List<dynamic> docs = dados['docs'] ?? [];
        print('--> 3. Quantidade de livros retornados pela API: ${docs.length}');

        if (docs.isEmpty) {
          print('--> AVISO: A API respondeu 200, mas o termo "$termo" não retornou nenhum livro.');
          return [];
        }

        print('--> 4. Tentando converter o primeiro item do JSON para o Model...');
        final livros = docs.map((item) => Livro.deJson(item)).toList();
        print('--> 5. Sucesso! ${livros.length} livros convertidos.');

        return livros;
      } else {
        print('--> ERRO na API: Status ${resposta.statusCode}');
        return [];
      }
    } catch (e) {
      print('--> ERRO DE EXECUÇÃO: $e');
      rethrow;
    }
  }
}