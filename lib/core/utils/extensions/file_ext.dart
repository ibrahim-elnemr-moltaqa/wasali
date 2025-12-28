import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

extension FileExt on File {
  /// Compress image file and return File
  Future<File?> compressImage({int quality = 70}) async {
    final tempDir = await getTemporaryDirectory();
    final targetPath = p.join(
      tempDir.path,
      '${DateTime.now().millisecondsSinceEpoch}_${p.basename(path)}',
    );

    final XFile? compressedXFile =
        await FlutterImageCompress.compressAndGetFile(
      path,
      targetPath,
      quality: quality,
    );

    if (compressedXFile == null) return null;

    return File(compressedXFile.path);
  }
}
