class MovieModel {
  final String id;
  final String name;
  final String description;
  final String rating;
  final String duration;
  final String author;
  final String dateOfProduction;
  final String image;
  final String video;
  final int numberOfWatch;
  final int v;

  MovieModel(
      {required this.id,
      required this.name,
      required this.description,
      required this.rating,
      required this.duration,
      required this.author,
      required this.dateOfProduction,
      required this.image,
      required this.numberOfWatch,
      required this.v,
      required this.video});

  factory MovieModel.fromJson(jsonData) {
    return MovieModel(
        id: jsonData['_id'],
        name: jsonData['name'],
        description: jsonData['description'],
        rating: jsonData['rating'].toString(),
        duration: jsonData['duration'],
        author: jsonData['author'],
        dateOfProduction: jsonData['dateOfProduction'],
        image: jsonData['image'],
        video: jsonData['video'],
        numberOfWatch: jsonData['numberOfWatch'],
        v: jsonData['__v']);
  }
}
