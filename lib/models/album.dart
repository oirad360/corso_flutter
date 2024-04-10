class Album {
  final int userId;
  final int id;
  final String title;

  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory Album.fromJson(Map<String, dynamic> json) { // factory è un costruttore che ritorna un'istanza della classe
    // json è una mappa con chiave stringa e valore dinamico perchè non lo conosciamo a priori
    /*
    json sarà qualcosa del genere:
    {
      "userId": 1,
      "id": 1,
      "title": "quidem molestiae enim"
    }
    */
    return Album(userId: json['userId'], id: json['id'], title: json['title']);
  }
}