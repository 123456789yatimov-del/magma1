import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import '../data/models/book.dart';
import '../data/database/app_database.dart';

class FileService {
  static Future<Directory> getAppDir() async {
    final dir = await getApplicationDocumentsDirectory();
    final appDir = Directory('${dir.path}/magma_library');
    if (!await appDir.exists()) await appDir.create(recursive: true);
    return appDir;
  }

  static Future<Book?> importFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['epub', 'txt', 'pdf', 'fb2', 'docx'],
    );

    if (result != null && result.files.single.path != null) {
      File sourceFile = File(result.files.single.path!);
      String fileName = path.basename(sourceFile.path);
      String ext = path.extension(fileName).toLowerCase().replaceAll('.', '');
      
      final appDir = await getAppDir();
      File copiedFile = await sourceFile.copy('${appDir.path}/$fileName');

      Book newBook = Book(
        title: path.basenameWithoutExtension(fileName),
        author: 'Неизвестный автор',
        filePath: copiedFile.path,
        format: ext,
      );

      final db = await AppDatabase.instance;
      await db.books.put(newBook);
      return newBook;
    }
    return null;
  }
}
