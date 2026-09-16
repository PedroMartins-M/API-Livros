class Livro {
  final String title;
  final List<String> authorName;
  final int firstPublishYear;
  final int editionCount;
  final List<String> language;

  Livro({
    required this.title,
    required this.authorName,
    required this.firstPublishYear,
    required this.editionCount,
    required this.language,
  });

  Map<String, dynamic> paraJson() {
    return {
      'title': title,
      'author_name': authorName,
      'first_publish_year': firstPublishYear,
      'edition_count': editionCount,
      'language': language,
    };
  }

  factory Livro.deJson(Map<String, dynamic> json) {
    return Livro(
      // Tratamento com operador ?? para evitar erros com campos nulos
      title: json['title'] ?? 'Título indisponível',
      
      // Mapeia a lista genérica dynamic para List<String>
      authorName: (json['author_name'] as List<dynamic>?)
              ?.map((item) => item.toString())
              .toList() ??
          ['Autor desconhecido'],

      firstPublishYear: json['first_publish_year'] ?? 0,

      editionCount: json['edition_count'] ?? 0,

      language: (json['language'] as List<dynamic>?)
              ?.map((item) => item.toString())
              .toList() ??
          ['Idioma não informado'],
    );
  }
}