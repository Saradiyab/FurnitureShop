import 'dart:convert';
import 'dart:io';

import 'package:deneme_app/core/utils/app_api.dart';
import 'package:deneme_app/routes/app_routes.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
// ignore: depend_on_referenced_packages
import 'package:path/path.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;

import '../../main.dart';

class Crud extends GetxController {
  Future<bool>? _refreshFuture;

  Future<bool> _ensureRefreshToken() async {
    if (_refreshFuture != null) {
      try {
        return await _refreshFuture!;
      } catch (_) {
        return false;
      }
    }
    _refreshFuture = refreshToken();
    try {
      final result = await _refreshFuture!;
      return result;
    } finally {
      _refreshFuture = null;
    }
  }

  Map<String, String> _defaultHeaders() {
    return {
      'Accept': 'application/json',
      'userLang': 'tr',
      'apiPassword': 'd7N-q=/%)H~IVv9O7xtc)|v4',
      'Authorization': 'Bearer ${data.read('access_token')}',
    };
  }

  dynamic jsonDecodeSafe(String body) {
    try {
      return jsonDecode(body);
    } catch (_) {
      return body;
    }
  }

  Future<dynamic> getRequest(String url, {bool retry = true}) async {
    try {
      var response = await http.get(Uri.parse(url), headers: _defaultHeaders());
      print('GET $url -> ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 && retry) {
        bool refreshed = await _ensureRefreshToken();
        if (refreshed) {
          return await getRequest(url, retry: false);
        } else {
          data.remove('user');
          data.remove('access_token');
          data.remove('refresh_token');

          Get.offAllNamed(AppRoutes.init);
        }
      } else {
        debugPrint("GET Error: ${response.statusCode} ${response.body}");
        return jsonDecodeSafe(response.body);
      }
    } catch (e) {
      debugPrint("GET Exception: $e");
    }
    update();
    return null;
  }

  Future<dynamic> postRequest(
    String url,
    Map datas, {
    bool retry = true,
  }) async {
    try {
      var response = await http.post(
        Uri.parse(url),
        body: datas,
        headers: _defaultHeaders(),
      );
      print('POST $url -> ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 && retry) {
        bool refreshed = await _ensureRefreshToken();
        if (refreshed) {
          return await postRequest(url, datas, retry: false);
        } else {
          data.remove('user');
          data.remove('access_token');
          data.remove('refresh_token');
          Get.offAllNamed(AppRoutes.init);
        }
      } else {
        return jsonDecodeSafe(response.body);
      }
    } catch (e) {
      debugPrint("POST Exception: $e");
    }
    update();
    return null;
  }

  Future<dynamic> putRequest(String url, Map datas, {bool retry = true}) async {
    try {
      var response = await http.put(
        Uri.parse(url),
        body: datas,
        headers: _defaultHeaders(),
      );
      print('PUT $url -> ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 && retry) {
        bool refreshed = await _ensureRefreshToken();
        if (refreshed) {
          return await putRequest(url, datas, retry: false);
        } else {
          data.remove('user');
          data.remove('access_token');
          data.remove('refresh_token');
          Get.offAllNamed(AppRoutes.init);
        }
      } else {
        return jsonDecodeSafe(response.body);
      }
    } catch (e) {
      debugPrint("PUT Exception: $e");
    }
    update();
    return null;
  }

  Future<dynamic> deleteRequest(String url, {bool retry = true}) async {
    try {
      var response = await http.delete(
        Uri.parse(url),
        headers: _defaultHeaders(),
      );
      print('DELETE $url -> ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 && retry) {
        bool refreshed = await _ensureRefreshToken();
        if (refreshed) {
          return await deleteRequest(url, retry: false);
        } else {
          data.remove('user');
          data.remove('access_token');
          data.remove('refresh_token');
          Get.offAllNamed(AppRoutes.init);
        }
      } else {
        return jsonDecodeSafe(response.body);
      }
    } catch (e) {
      debugPrint("DELETE Exception: $e");
    }
    update();
    return null;
  }

  Future<dynamic> fileRequest(
    String url,
    Map<String, String> datas,
    File? file,
    String imagePath, {
    bool retry = true,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(_defaultHeaders());

      if (file != null) {
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile(
          imagePath,
          stream,
          length,
          filename: basename(file.path),
        );
        request.files.add(multipartFile);
      }

      datas.forEach((key, value) => request.fields[key] = value);

      var myRequest = await request.send();
      var response = await http.Response.fromStream(myRequest);

      print('FILE $url -> ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 && retry) {
        bool refreshed = await _ensureRefreshToken();
        if (refreshed) {
          return await fileRequest(url, datas, file, imagePath, retry: false);
        } else {
          data.remove('user');
          data.remove('access_token');
          data.remove('refresh_token');
          Get.offAllNamed(AppRoutes.init);
        }
      } else {
        debugPrint("File Error: ${response.statusCode} ${response.body}");
        return jsonDecodeSafe(response.body);
      }
    } catch (e) {
      debugPrint("File Exception: $e");
    }
    update();
    return null;
  }

  Future<dynamic> multiFileRequest(
    String url,
    Map<String, String> datas,
    List files,
    String imagePaths, {
    bool retry = true,
  }) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers.addAll(_defaultHeaders());

      for (var file in files) {
        var length = await file.length();
        var stream = http.ByteStream(file.openRead());
        var multipartFile = http.MultipartFile(
          imagePaths,
          stream,
          length,
          filename: basename(file.path),
        );
        request.files.add(multipartFile);
      }

      datas.forEach((key, value) => request.fields[key] = value);

      var myRequest = await request.send();
      var response = await http.Response.fromStream(myRequest);

      print('MULTIFILE $url -> ${response.statusCode}');
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else if (response.statusCode == 401 && retry) {
        bool refreshed = await _ensureRefreshToken();
        if (refreshed) {
          return await multiFileRequest(
            url,
            datas,
            files,
            imagePaths,
            retry: false,
          );
        } else {
          data.remove('user');
          data.remove('access_token');
          data.remove('refresh_token');
          Get.offAllNamed(AppRoutes.init);
        }
      } else {
        debugPrint("MultiFile Error: ${response.statusCode} ${response.body}");
        return jsonDecodeSafe(response.body);
      }
    } catch (e) {
      debugPrint("MultiFile Exception: $e");
    }
    update();
    return null;
  }

  Future<bool> refreshToken() async {
    try {
      final refreshUrl = '${AppApi.refreshToken}/${data.read('refresh_token')}';
      var response = await http.post(
        Uri.parse(refreshUrl),
        headers: {
          'Accept': 'application/json',
          'userLang': 'tr',
          'apiPassword': 'd7N-q=/%)H~IVv9O7xtc)|v4',
          'Authorization': 'Bearer ${data.read('access_token')}',
        },
      );
      print('Refresh Token çalıştı -> ${response.statusCode}');
      var decoded = jsonDecode(response.body);
      if (decoded['status'] == 'error') {
        Get.offAllNamed(AppRoutes.init);
        data.remove('user');
        data.remove('access_token');
        data.remove('refresh_token');
      }
      if (response.statusCode == 200) {
        print('Refreshasdasdasd $decoded');
        await data.write('access_token', decoded['access_token'].toString());
        print('Refresh Token onaylandı, token güncellendi');
        return true;
      } else if (response.statusCode == 401) {
        Get.offAllNamed(AppRoutes.init);
        data.remove('user');
        data.remove('access_token');
        data.remove('refresh_token');
      } else {
        Get.offAllNamed(AppRoutes.init);
        data.remove('user');
        data.remove('access_token');
        data.remove('refresh_token');
      }
    } catch (e) {
      debugPrint("Refresh Exception: $e");
    }
    return false;
  }
}
////////////////////////////// Not

// appApi içinde ekle:
//  static const String refreshToken = '$init/refresh-token';

//  logın ve register içinde ekle : 
//   data.write('access_token', response['access_token'].toString());
//  data.write('refresh_token', response['refresh_token'].toString());