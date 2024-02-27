import 'package:dio/dio.dart';

Dio httpClient() {
  final options = BaseOptions(
      baseUrl: 'https://www.inkozi.com/api/',
      headers: {"Accept": "application/json", ...getAuthHeader()});
  return Dio(options);
}

Dio httpFormDataClient() {
  final options = BaseOptions(
      baseUrl: 'https://www.inkozi.com/api/',
      headers: {"Content-Type": "multipart/form-data", ...getAuthHeader()});
  return Dio(options);
}

Map<String, String> getAuthHeader() {
  return {'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'};
}
