import 'dart:async';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

import 'package:dio/dio.dart';

class DownloadSong {
  double progress = 0;

  final controller = StreamController<double>();
  Stream<double> get stream => controller.stream;

  downloadFile(uri, fileName) async {
    String savePath = await getFilePath(fileName);

    Dio dio = Dio();

    await dio.download(
      uri,
      savePath,
      onReceiveProgress: (recieved, total) {
        // print(
        //     'received: ${rcv.toStringAsFixed(0)} out of total: ${total.toStringAsFixed(0)}');

        Timer.periodic(Duration(seconds: 1), (t) {
          controller.sink.add(progress);

          progress =
              progress < ((recieved / total)) ? ((recieved / total)) : progress;
          print(progress);
        });

        if (progress == 100) {
        } else if (progress < 100) {}
      },
      deleteOnError: true,
    ).then((_) {
      if (progress == 100) {}
    });
  }

  static Future<String> getFilePath(uniqueFileName) async {
    String path = '';

    Directory dir = await getApplicationDocumentsDirectory();
    print(dir.path);
    path = '${dir.path}/$uniqueFileName.mp3';

    return path;
  }
}
