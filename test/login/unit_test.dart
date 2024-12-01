import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/data/services/user_services.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:get/get.dart' as getx;
import 'package:laundry_link/app/data/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'unit_test.mocks.dart';

@GenerateMocks([Dio, UserServices, GetStorage, SharedPreferencesAsync])
void main() {
  late UserServices userServices;
  late MockDio mockDio;
  late MockGetStorage mockStorage;
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    DartPluginRegistrant.ensureInitialized();
    mockStorage = MockGetStorage();
    getx.Get.put(GetStorage.new);
    mockDio = MockDio();
    userServices = UserServices(dio: mockDio, storage: mockStorage);
  });

  group('UserServices loginUser', () {
    const String apiUrl = 'http://localhost:3001/api/users/login';
    const Map<String, String> requestData = {
      'email': 'laundrylink@mail.com',
      'password': 'password',
    };

    test('Login succeeds and token is saved', () async {

      const responseJson = {
        'data': {'token': 'valid_token'}
      };
      final mockResponse = Response(
        requestOptions: RequestOptions(path: apiUrl),
        statusCode: 200,
        data: responseJson,
      );

      when(mockDio.post(
        apiUrl,
        data: anyNamed('data'),
        options: anyNamed('options'),
      )).thenAnswer((_) async => mockResponse);

      // Mock storage behavior
      when(mockStorage.write('user_token', 'valid_token'))
          .thenAnswer((_) async => true);

      // Act
      final loginData = await userServices.loginUser(requestData);

      // Assert
      print(loginData?.token);
      expect(loginData, isA<LoginData>());
      expect(loginData?.token.isNotEmpty, true);
      expect(loginData?.token.isNotEmpty, true);
      // verify(mockDio.post(apiUrl,
      //         data: anyNamed('data'), options: anyNamed('options')))
      //     .called(1);
      // verify(mockStorage.write('user_token', 'valid_token')).called(1);
    });

    //  test('Login fails with server error', () async {
    //   // Mock error response
    //   final mockResponse = Response(
    //     requestOptions: RequestOptions(path: apiUrl),
    //     statusCode: 400,
    //     data: {'errors': 'Invalid credentials'},
    //   );

    //   // Mock Dio behavior
    //   when(mockDio.post(
    //     apiUrl,
    //     data: anyNamed('data'),
    //     options: anyNamed('options'),
    //   )).thenAnswer((_) async => mockResponse);

    //   // Act & Assert
    //   expect(
    //     () async => await userServices.loginUser(requestData),
    //     throwsException,
    //   );

    //   verify(mockDio.post(apiUrl, data: requestData, options: anyNamed('options'))).called(1);
    //   verifyNever(.write('user_token', any));
    // });
  });

  
}
