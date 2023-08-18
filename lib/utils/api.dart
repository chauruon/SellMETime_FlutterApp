import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:logger/logger.dart';


enum TypeFetch {
  get,
  post,
  put,
  delete,
}


class CallApi extends GetxController {
  final Logger logger = Logger();
  var isLoading = false.obs;

  Future getFetchApi(String url, Map<String, String>? headers, Object? body) async {
    try {
      isLoading(true);
      var header = {
        "Content-Type": "application/json",
        ...?headers
      };
      final response = await http.get(
        Uri.parse(url),
        headers: header,
      );
      
      Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        isLoading(false);
        return responseData;
      }

    } catch (e) {
      logger.e("API request error: $e");
      throw Exception("Failed to make API request");
    } finally { 
      isLoading(false);
    }
  }
  Future postFetchApi(String url, Map<String, String>? headers, Object? body) async {
    try {
      isLoading(true);
      // var header = {
      //   "Content-Type": "application/json",
      //   ...?headers
      // };
      final response = await http.post(
        Uri.parse(url),
        // headers: header,
        body: body
      );
      Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        isLoading(false);
        return responseData;
      }

    } catch (e) {
      logger.e("API request error: $e");
      throw Exception("Failed to make API request");
    } finally { 
      isLoading(false);
    }
  }
  Future deleteFetchApi(String url, Map<String, String>? headers, Object? body) async {
    try {
      isLoading(true);
      // var header = {
      //   "Content-Type": "application/json",
      //   ...?headers
      // };
      final response = await http.delete(
        Uri.parse(url),
        // headers: header,
        body: body
      );
      
      Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        // isLoading(false);
        return responseData;
      }

    } catch (e) {
      logger.e("API request error: $e");
      throw Exception("Failed to make API request");
    } finally { 
      isLoading(false);
    }
  }
  Future putFetchApi(String url, Map<String, String>? headers, Object? body) async {
    try {
      isLoading(true);
      var header = {
        "Content-Type": "application/json",
        ...?headers
      };
      final response = await http.put(
        Uri.parse(url),
        headers: header,
        body: body
      );
      
      Map<String, dynamic> responseData = json.decode(response.body);
      if (response.statusCode == 200) {
        return responseData;
      } else {
        isLoading(false);
        return responseData;
      }

    } catch (e) {
      logger.e("API request error: $e");
      throw Exception("Failed to make API request");
    } finally { 
      isLoading(false);
    }
  }


  

}
