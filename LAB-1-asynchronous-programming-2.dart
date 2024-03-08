import 'dart:io';
import 'package:http/http.dart' as http;

Future<void> downloadFile(String url, String savePath) async {
  
  var response = await http.get(Uri.parse(url));


  if (response.statusCode == 200) {
  
    File file = File(savePath);
    await file.writeAsBytes(response.bodyBytes);
    print('File downloaded successfully: $savePath');
  } else {
  
    print('Failed to download file: ${response.reasonPhrase}');
  }
}

void main() async {
  
  String url = 'https://example.com/file.txt';

  String savePath = 'downloaded_file.txt';

  
  await downloadFile(url, savePath);
}
