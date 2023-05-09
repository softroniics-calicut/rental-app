import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:http/http.dart' as http;
import 'package:vehicleportaladmin/con.dart';
const Map<String, dynamic> temp = {};

Future getData(String url,
    {Map<String, dynamic> params = temp, post = true}) async {
  final http.Response result;
  if (post) {
    result = await http.post(Uri.parse("${Con.url}$url"),
        body: params); //https://hosted_url.com/login_api
  } else {
    result = await http.get(Uri.parse("${Con.url}$url"));
  }
  print(result.body);
  if (result.statusCode == 200) {
    final data = result.body;
    return jsonDecode(data);
  }
}

Future<http.StreamedResponse> addTranspotation(
    File imageFile,File rc,File insurance,File driving,File photo, String url, Map<String, String> params) async {
  var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
  var length = await imageFile.length();

  var uri = Uri.parse("${Con.url}$url");

  var request = http.MultipartRequest(
    "POST",
    uri,
  );
  var multipartFileRc = http.MultipartFile('rc', stream, length,
      filename: basename(imageFile.path));

 var multipartFileInsurance = http.MultipartFile('insurance', stream, length,
      filename: basename(imageFile.path));
 var multipartFileDriving = http.MultipartFile('licence', stream, length,
      filename: basename(imageFile.path));
  var multipartFilePhoto = http.MultipartFile('pic', stream, length,
      filename: basename(imageFile.path));
  //contentType: new MediaType('image', 'png'));

  request.files.add(multipartFileRc);
  request.files.add(multipartFileInsurance);
  request.files.add(multipartFilePhoto);
  request.files.add(multipartFileDriving);
  request.fields.addAll(params);
  var response = await request.send();
  print(response.statusCode);
  response.stream.transform(utf8.decoder).listen((value) {
    print(value);
  });
  return response;
}