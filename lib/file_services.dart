// ignore_for_file: avoid_print

import 'dart:io';

import 'package:path_provider/path_provider.dart';

class FileService {
  static final FileService _instance = FileService._privateConstructor();
  FileService._privateConstructor();
  factory FileService() {
    return _instance;
  }

  Future<void> readWriteFile(String fileName) async {
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = '${dir.path}/$fileName';
    final File file = File(path);

    if (!await file.exists()) {
      await _createAndWriteToFile(file);
    } else {
      await _truncateAndWriteToFile(file);
    }
  }

  Future<void> _createAndWriteToFile(File file) async {
    file = await file.create();
    await file.writeAsString('Hello World!', mode: FileMode.write);
    print("File created and written to");
  }

  Future<void> _truncateAndWriteToFile(File file) async {
    await file.writeAsString('Hello World!', mode: FileMode.writeOnly);
    print("File truncated and written to");
  }
//This version of the code has the readWriteFile function
// delegate the creation and writing to the file to the
// _createAndWriteToFile function, and the truncation and writing
// to the file to the _truncateAndWriteToFile function.
}
