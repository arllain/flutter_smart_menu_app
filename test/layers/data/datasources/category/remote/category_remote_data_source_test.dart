import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;
import 'package:smart_menu_app/core/error/exceptions.dart';
import 'package:smart_menu_app/layers/data/datasources/category/remote/category_remore_datasource_impl.dart';
import 'package:smart_menu_app/layers/data/models/category/category_model.dart';

import '../../../../../fixtures/fixture_reader.dart';
import 'category_remote_data_source_test.mocks.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

@GenerateMocks([http.Client],
    customMocks: [MockSpec<http.Client>(as: #MockHttpCliente)])
void main() {
  late CategoryRemoteDataSourceImpl dataSourceImpl;
  late MockHttpCliente mockHttpClient;

  setUpAll(() {
    mockHttpClient = MockHttpCliente();
    dataSourceImpl = CategoryRemoteDataSourceImpl(client: mockHttpClient);
    dotenv.testLoad(fileInput: File('assets/.env').readAsStringSync());
  });

  final List<CategoryModel> tCategoryList =
      (json.decode(fixture('/category/category_list.json')) as List<dynamic>)
          .map<CategoryModel>((item) => CategoryModel.fromJson(item))
          .toList();

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers'))).thenAnswer(
        (_) async =>
            http.Response(fixture('/category/category_list.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getAllCategories', () {
    test(
        'should return a list of Category when the response code is 200 (success)',
        () async {
      // arrange
      setUpMockHttpClientSuccess200();
      // act
      final result = await dataSourceImpl.getAllCategories();
      // assert
      expect(result, equals(tCategoryList));
    });

    test('should throw a ServerException when the response is 404 or other ',
        () async {
      // arrange
      setUpMockHttpClientFailure404();
      // act
      final call = dataSourceImpl.getAllCategories();
      // assert
      expect(() => call, throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
