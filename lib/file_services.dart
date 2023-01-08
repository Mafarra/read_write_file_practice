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
    // Get the directory path for both Android and iOS to store file.
    final Directory dir = await getApplicationDocumentsDirectory();
    final String path = '${dir.path}/$fileName';

    // Attempt to read the file
    File file;
    try {
      file = File(path);
      String contents = await file.readAsString();
      print(contents);
    } catch (e) {
      // If encountering an error, return
      print("Error reading file: $e");
      return;
    }

    // If the file doesn't exist, create it and write to it
    if (!await file.exists()) {
      file = await file.create();
      await file.writeAsString('Hello World!', mode: FileMode.write);
      print("File created and written to");
    } else {
      // Otherwise, truncate the file and write to it
      await file.writeAsString('Hello World!', mode: FileMode.writeOnly);
      print("File truncated and written to");
    }
  }
}
