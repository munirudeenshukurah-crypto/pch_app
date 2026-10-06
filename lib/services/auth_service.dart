import 'dart:convert';

import 'package:pch_app/models/createaccount_model.dart';
import 'package:http/http.dart' as http;
import 'package:pch_app/models/login_model.dart';
import 'package:pch_app/models/verifyOTP_model.dart';
import 'package:pch_app/screens/login.dart';

class AuthService {
 static const String _baseUrl = 'https://captain-track-backend-hluw.onrender.com';

 // REGISTER
Future<Map<String, dynamic>> createaccount(CreateAccountModel data) async {
 final url = Uri.parse('$_baseUrl/api/customer/register');
 print(data.toJson());
 final response = await http.post(
  url,
  body: jsonEncode(data.toJson()),
  headers:  {
   "Content-Type": "application/json"
  }
 );

 final json = jsonDecode(response.body);
 if (response.statusCode == 200){
  print('This is our response body: ${response.body}');
  return {
   "success": true,
   "data": json,
   "message": json['message']
  };
 } else{
  return {
   "success": false,
   "message": json['message']
  };
 }
}

 // LOGIN
 Future<Map<String, dynamic>> login(LoginModel data) async {
  final url = Uri.parse('$_baseUrl/api/auth/login');

  final response = await http.post(
      url,
      body: jsonEncode(data.toJson()),
      headers:  {
       "Content-Type": "application/json"
      }
  );
  print('our response body: ${response.body}');
  final json = jsonDecode(response.body);
  if (response.statusCode == 200){
   print('This is our response body: ${response.body}');
   return {
    "success": true,
    "data": json,
    "message": json['message']
   };
  } else{
   return {
    "success": false,
    "message": json['message']
   };
  }
 }

 // verifyOTP
 Future<Map<String, dynamic>> verifyOTP(verifyOTPModel data) async {
  final url = Uri.parse('$_baseUrl/api/auth/verifyOTP');

  final response = await http.post(
      url,
      body: jsonEncode(data.toJson()),
      headers:  {
       "Content-Type": "application/json"
      }
  );
  print('our response body: ${response.body}');
  final json = jsonDecode(response.body);
  if (response.statusCode == 200){
   print('This is our response body: ${response.body}');
   return {
    "success": true,
    "data": json,
    "message": json['message']
   };
  } else{
   return {
    "success": false,
    "message": json['message']
   };
  }
 }

}









