// ignore: depend_on_referenced_packages
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio provideDio() {
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
        },
      ),
    );

    // Add interceptors if necessary
    if (!kReleaseMode) {
      // its debug mode so print app logs
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
        ),
      );
    }
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        if (options.extra['requiresToken'] == true) {
          options.headers['Authorization'] =
              'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjczNDlmZGQ4NWE1MzczNDI0NGQ1ZTJlIiwicm9sZSI6InVzZXIiLCJpYXQiOjE3MzMwOTA2MzB9.-Fl6bb5QcUKECnqjRvnSWWVd9gy3JfR3lwHDbmB8vUk';
        }
      },
    ));

    return dio;
  }
}
