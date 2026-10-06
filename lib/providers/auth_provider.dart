import 'package:flutter/material.dart';
import 'package:pch_app/models/createaccount_model.dart';
import 'package:pch_app/models/login_model.dart';
import 'package:pch_app/models/verifyOTP_model.dart';
import 'package:pch_app/services/auth_service.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService _service = AuthService();

  bool isloading = false;
  String? errorMessage;
  String? successMessage;
  String? userId;
  String? email;

  Future<bool> createaccount(CreateAccountModel data) async {
    isloading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    final result = await _service.createaccount(data);

    print('This is our result from provider: $result');
    isloading = false;
    if (result['success']) {
      successMessage = result['message'];
      notifyListeners();
      return true;
    } else {
      errorMessage = result['message'];
      notifyListeners();
      return false;
    }
  }

  //LOGIN


  Future<bool> login(LoginModel data) async {
    isloading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    final result = await _service.login(data);

    print('This is our result from provider: $result');
    isloading = false;
    if (result['success']) {
      successMessage = result['message'];
      notifyListeners();
      return true;
    } else {
      errorMessage = result['message'];
      notifyListeners();
      return false;
    }
  }

  // VerifyOTP


  Future<bool> verifyOTP(verifyOTPModel data) async {
    isloading = true;
    errorMessage = null;
    successMessage = null;
    notifyListeners();

    final result = await _service.verifyOTP(data);

    print('This is our result from provider: $result');
    isloading = false;
    if (result['success']) {
      successMessage = result['message'];
      notifyListeners();
      return true;
    } else {
      errorMessage = result['message'];
      notifyListeners();
      return false;
    }
  }

}





