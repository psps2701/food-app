import 'dart:convert';

import 'package:foodoma_app/base/custom_snack_bar.dart';
import 'package:foodoma_app/model/login_reponse_model.dart';
import 'package:foodoma_app/model/register_response_model.dart';
import 'package:foodoma_app/model/registration_model/send_otp_reponse_model.dart';
import 'package:foodoma_app/utils/app_constants.dart';
import 'package:http/http.dart';

class ServiceController {


  Future<String> login({required String email, required String password}) async{

    var url = AppConstants.BASE_URL + AppConstants.LOGIN_URL;
    Map<String, String> headers = {"Content-type": "application/json"};

    var map = new Map<String, dynamic>();
    map['email'] = email;

    map['password'] = password;

    Response response = await post(Uri.parse(url), body: map);
    print(response.body);
    final loginResponseModel = loginResponseModelFromJson(response.body);
    print(loginResponseModel);

        if(response.statusCode == 200) {
          if(loginResponseModel!.success == true) {

            showCustomsnackBar("Successfully login", title: "Success");
            return "Success";


          }else {
            showCustomsnackBar("Something went wrong", title: "Error");
            return 'Failed';

          }
        }else {
          return 'Failed';


        }


  }



  Future<String> sendOTPVerification({required String email, required String phoneNumber}) async{
    var url = AppConstants.BASE_URL + AppConstants.SEND_OTP_URL;
    Map<String, String> headers = {"Content-type": "application/json"};

    Map data = {
      'phone': phoneNumber,
      'email' : email
    };
    //encode Map to JSON
    var body = json.encode(data);

    var response = await post(Uri.parse(url),
        headers: {"Content-Type": "application/json"},
        body: body
    );
    if(response.statusCode == 200) {

          final otpResponseModel = otpResponseModelFromJson(response.body);
          if(otpResponseModel!.success == true) {
            showCustomsnackBar(otpResponseModel.message!);
            return "Success";
          }else {
            showCustomsnackBar(otpResponseModel.message!);

            return "Failed";
          }



    }else {
      showCustomsnackBar(response.reasonPhrase!);
      return "Failed";
    }


  }

  Future<String> register({required String fullName, required String email, required String password, required String phone, required int otp, required String lat, required String long, required String address, required String house, required String tag})async {
    var url = AppConstants.BASE_URL + AppConstants.REGISTER_URL;
    Map<String, String> headers = {"Content-type": "application/json"};
    Map data = {
      'phone': phone,
      'email' : email,
      "name" : fullName,
      "password" : password,
      "otp" : otp,
      "address" : {
        "lat" : lat,
        "lng" : long,
        "address" : address,
        "house" : house,
        "tag" : tag
      }


    };

    String requestBody = json.encode(data);
    print(requestBody);
    Response response = await post(Uri.parse(url), body: requestBody);

        final registerResponseModel = registerResponseModelFromJson(response.body);


    if(response.statusCode == 200) {
      if(registerResponseModel.success == true) {

        showCustomsnackBar("Successfully login", title: "Success");
        return "Success";


      }else {
        showCustomsnackBar("Something went wrong", title: "Error");
        throw Exception("Something went wrong");

      }
    }else {
      return "Failed";

    }


  }
}