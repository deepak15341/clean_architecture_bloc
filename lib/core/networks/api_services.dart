import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'api_exceptions.dart';


class ApiService {
  final Dio dio;

  ApiService(this.dio);

  // Base URLs
  static const hostApi = 'https://jsonplaceholder.typicode.com/';





  dynamic postRequest(
    String subUrl,
    Map<String, dynamic> inputData, {
    bool withFile = false,
    bool cacheRequest = true,
    bool forceRefresh = false,
    var contentType = Headers.jsonContentType,

    CancelToken? cancelToken,
  }) async {
    try {
      String fullUrl = "$hostApi$subUrl";



      debugPrint('---POST url: $fullUrl');
      debugPrint('---Body Data: $inputData');


      Options option = Options(
        contentType: contentType,
      );



      Response res = await dio.post(
        fullUrl,
        data: withFile ? FormData.fromMap(inputData) : inputData,
        options: option,
        cancelToken: cancelToken,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        log("---RESULT: $rData");
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromString(dioError.response.toString());
    }
  }

  dynamic getRequest(
    String subUrl, {
    Map<String, dynamic> data = const {},
    bool cacheRequest = true,
    CancelToken? cancelToken,
    bool forceRefresh = false,

  }) async {
    try {

      String fullUrl = "$hostApi$subUrl";

      // Add platform parameter to existing query parameters if not using newHostApi



      debugPrint('---GET url: $fullUrl');

      Options option = Options(
        contentType: Headers.formUrlEncodedContentType,
      );


      Response res = await dio.get(
        fullUrl,

        options: option,
        cancelToken: cancelToken,
      );

      debugPrint('---RESULT: ${res.data}');
      log("---RESULT: ${res.data}");

      if (res.statusCode == 200) {
        var rData = res.data;
        debugPrint('---RESULT END');
        return rData;
      } else if (res.statusCode == 404) {
        var errorResponse = res.data['error'];
        throw ApiException.fromString("Error Occurred: $errorResponse");
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromDioError(dioError);
    }
  }

  dynamic putRequest(
    String subUrl,
    Map<String, dynamic> inputData, {
    bool withFile = false,
    bool cacheRequest = true,
    CancelToken? cancelToken,
    bool forceRefresh = false,

  }) async {
    try {
      String fullUrl = "$hostApi$subUrl";


      debugPrint('---PUT url: $fullUrl');
      debugPrint('---Body Data: $inputData');

      Options option = Options(
        contentType: Headers.jsonContentType,
      );

      Response res = await dio.put(
        fullUrl,
        data: withFile ? FormData.fromMap(inputData) : inputData,
        options: option,
        cancelToken: cancelToken,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        log("---RESULT: $rData");
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromDioError(dioError);
    }
  }

  dynamic patchRequest(
    String subUrl,
    Map<String, dynamic> inputData, {
    bool withFile = false,
    CancelToken? cancelToken,
    bool cacheRequest = true,
    bool forceRefresh = false,
  }) async {
    try {
      String fullUrl = "$hostApi$subUrl";


      debugPrint('---PATCH url: $fullUrl');
      debugPrint('---Body Data: $inputData');

      Options option = Options(
        contentType: Headers.formUrlEncodedContentType,
      );

      Response res = await dio.patch(
        fullUrl,
        data: withFile ? FormData.fromMap(inputData) : inputData,
        options: option,
        cancelToken: cancelToken,
      );

      if (res.statusCode == 200 || res.statusCode == 201) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        log("---RESULT: $rData");
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {
      throw ApiException.fromDioError(dioError);
    }
  }

  dynamic deleteRequest(
    String subUrl, {
    Map<String, dynamic> data = const {},
    CancelToken? cancelToken,
    bool cacheRequest = true,
    bool forceRefresh = false,
  }) async {
    try {
      String fullUrl = "$hostApi$subUrl";


      debugPrint('---DELETE url: $fullUrl');
      debugPrint('---Body Data: $data');

      Options option = Options(
        contentType: Headers.jsonContentType,
      );

      Response res = await dio.delete(
        fullUrl,
        data: data.isNotEmpty ? data : null,
        options: option,
        cancelToken: cancelToken,
      );

      if (res.statusCode == 200 || res.statusCode == 204) {
        var rData = res.data;
        debugPrint('---RESULT: $rData');
        log("---RESULT: $rData");
        debugPrint('---RESULT END');
        return rData;
      } else {
        throw ApiException.fromString("Error Occurred. ${res.statusCode}");
      }
    } on SocketException {
      throw ApiException.fromString("No Internet Connection!");
    } on DioException catch (dioError) {

      throw ApiException.fromDioError(dioError);
    }
  }

}
