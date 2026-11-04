import 'package:isar/isar.dart';
part 'book.g.dart';

@collection
class Book {
  Id id = Isar.autoIncrement;
  late String title;
  late String author;
  late String filePath;
  late String format;
  double progress = 0.0;
  DateTime addedDate = DateTime.now();
  bool isFavorite = false;

  Book({
    required this.title,
    required this.author,
    required this.filePath,
    required this.format,
    this.progress = 0.0,
    DateTime? addedDate,
    this.isFavorite = false,
  }) : addedDate = addedDate ?? DateTime.now();
}
