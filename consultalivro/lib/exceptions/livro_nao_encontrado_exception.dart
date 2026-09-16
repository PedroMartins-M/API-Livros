class LivroNaoEncontradoException implements Exception {
  final String mensagem;
  LivroNaoEncontradoException([this.mensagem = 'Nenhum livro foi encontrado.']);

  @override
  String toString() => mensagem;
}