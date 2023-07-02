import 'dart:async';
import 'package:dio/dio.dart';

void main() async {
  Dio dio = Dio();

  await getRequest(dio);
  await postRequest(dio);
  await putRequest(dio);
  await deleteRequest(dio);
}

Future<void> getRequest(Dio dio) async {
  try {
    Response response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    if (response.statusCode == 200) {
      print(response.data);
    } else {
      print('Произошла ошибка: ${response.statusCode}');
    }
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

Future<void> postRequest(Dio dio) async {
  try {
    Map<String, dynamic> data = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1
    };

    Response response = await dio.post('https://jsonplaceholder.typicode.com/posts', data: data);

    if (response.statusCode == 201) {
      print('Новый пост успешно создан');
      print(response.data);
    } else {
      print('Произошла ошибка: ${response.statusCode}');
      print(response.data);
    }
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

Future<void> putRequest(Dio dio) async {
  try {
    Map<String, dynamic> data = {
      'title': 'foo',
      'body': 'bar',
      'userId': 1
    };

    Response response = await dio.put('https://jsonplaceholder.typicode.com/posts/1', data: data);

    if (response.statusCode == 200) {
      print('Пост успешно обновлен');
      print(response.data);
    } else {
      print('Произошла ошибка: ${response.statusCode}');
      print(response.data);
    }
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}

Future<void> deleteRequest(Dio dio) async {
  try {
    Response response = await dio.delete('https://jsonplaceholder.typicode.com/posts/1');

    if (response.statusCode == 200) {
      print('Пост успешно удален');
    } else {
      print('Произошла ошибка: ${response.statusCode}');
    }
  } catch (e) {
    print('Произошла ошибка: $e');
  }
}