import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/book.dart';

class AppDatabase {
  static AppDatabase? _instance;
  static Isar? _isar;

  AppDatabase._();

  static Future<AppDatabase> get instance async {
    _instance ??= AppDatabase._();
    if (_isar == null) {
      final dir = await getApplicationDocumentsDirectory();
      _isar = await Isar.open([BookSchema], directory: dir.path, name: 'magma_db');
    }
    return _instance!;
  }

  Isar get isar => _isar!;
  late final books = isar.books;
}
