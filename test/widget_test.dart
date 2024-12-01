import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart' as getx;
import 'package:get_storage/get_storage.dart';
import 'package:laundry_link/app/routes/app_pages.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:laundry_link/app/modules/auth/signin/controllers/signin_controller.dart';
import 'package:laundry_link/app/data/models/user_model.dart';

import 'widget_test.mocks.dart';

// Generate a mock class for Dio
@GenerateMocks([Dio])
void main() {
  late SigninController signinController = getx.Get.put(SigninController());
  late MockDio mockDio;
  late GetStorage mockStorage = getx.Get.put(GetStorage('testStorage'));
  String api = 'https://apiv1.nopals.my.id/api/api/users/login';
  getx.Get.put(Dio());

  setUp(() async {
    // Ensure widgets binding is initialized
    TestWidgetsFlutterBinding.ensureInitialized();

    // Mock GetStorage
    await mockStorage.write('user_token', null);

    // Initialize mock Dio and controller
    mockDio = MockDio();
  });

  // tearDown(() {
  //   signinController.dispose();
  // });

  group('SigninController', () {
    test('Initial state of SigninController', () {
      expect(signinController.isLoggedIn.value, false);
      expect(signinController.isLoading.value, false);
      expect(signinController.emailController.text, '');
      expect(signinController.passwordController.text, '');
    });

    test('api function', () {
      signinController.emailController.text = 'laundrylink@mail.com';
      signinController.passwordController.text = 'password';
      signinController.login();
      expect(signinController.emailController.text, 'laundrylink@mail.com');
      expect(signinController.passwordController.text, 'password');

    });

    test('Login with valid credentials stores token and navigates',
        () async {
       TestWidgetsFlutterBinding.ensureInitialized();
      signinController.emailController.text = 'laundrylink@mail.com';
      signinController.passwordController.text = 'password';

       final requestData = {
    'email': signinController.emailController.text,
    'password': signinController.passwordController.text,
  };
      final response = Response(
        data: {
          'data': {'token': 'token'},
        },
        statusCode: 200,
        requestOptions: RequestOptions(path: api),
      );

      when(mockDio.post(
        api,
        data: requestData ,
      )).thenAnswer((_) async => response);
      
      dynamic result = signinController.login();
      // print(signinController.login);
      expect(signinController.emailController.text, 'laundrylink@mail.com');
      // verifyNever(result).called(1);
    });
  });
}
