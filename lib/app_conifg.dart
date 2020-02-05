import 'dart:convert';

import 'package:aad_oauth/aad_oauth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


import 'models/enums.dart';
import 'models/userInfo.dart';

class AppConfig {
  static AppConfig instance = new AppConfig();
  double _screenWidth;
  double _screenHeight;
  DeviceType _deviceType;
  Orientation _orientation;

  AadOAuth oauth;
  String accessToken;

  String microsoftGraphAccessToken;

  void init(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    _screenWidth = mediaQuery.size.width;
    _screenHeight = mediaQuery.size.height;
    _deviceType = mediaQuery.size.shortestSide < 600
        ? DeviceType.SmartPhone
        : DeviceType.Tablets;
    _orientation = mediaQuery.orientation;
  }

  static get menuPage => RouteName.Menu;
  static get resvPage => RouteName.Reservation;
  static get infoPage => RouteName.Information;
  static get cartPage => RouteName.Cart;
  static get profPage => RouteName.Profile;
  static get undefinedPage => RouteName.Undefined;

  static get defaultFontFamily => "Nunito Sans";

  double get screenWidth => this._screenWidth;
  double get screenHeight => this._screenHeight;
  double get blockWidth => this._screenWidth / 100;
  double get blockHeight => this._screenHeight / 100;

  DeviceType get deviceType => this._deviceType;
  Orientation get orientation => this._orientation;

  Map<String, dynamic> parseJwt(String token) {
    final parts = token.split('.');
    if (parts.length != 3) {
      throw Exception('invalid token');
    }

    final payload = _decodeBase64(parts[1]);
    final payloadMap = json.decode(payload);
    if (payloadMap is! Map<String, dynamic>) {
      throw Exception('invalid payload');
    }

    return payloadMap;
  }

  String _decodeBase64(String str) {
    String output = str.replaceAll('-', '+').replaceAll('_', '/');

    switch (output.length % 4) {
      case 0:
        break;
      case 2:
        output += '==';
        break;
      case 3:
        output += '=';
        break;
      default:
        throw Exception('Illegal base64url string!"');
    }

    return utf8.decode(base64Url.decode(output));
  }

  Future<UserInfo> getUserInfo(String userEmail) async {
    String baseUrl = "https://graph.microsoft.com/v1.0/users";
    String url = baseUrl + "/$userEmail";
    Map<String, String> header = {
      "Authorization": "Bearer " + microsoftGraphAccessToken
    };
    Response response = await get(url, headers: header);
    Map<String, dynamic> respJson = json.decode(response.body);
    UserInfo userInfo = UserInfo.fromJson(respJson);
    return userInfo;
  }

  Future<void> getGraphAccessToken() async {
    String url = "https://login.microsoftonline.com/sliq.com/oauth2/v2.0/token";
    Map<String,String> params = {
      "client_id": "08166626-e5af-4424-8b7a-0a6d59853617",
      "scope": "https://graph.microsoft.com/.default",
      "client_secret": "N0iqH*fbJ/Jb=wf-0CcXSs114[g8-W61",
      "grant_type": "client_credentials"
    };
    Map<String, String> header = {
      "Host": "login.microsoftonline.com",
      "Content-Type": "application/x-www-form-urlencoded"
    };

    Response response = await post(url,
        body: params,
        headers: header);
    Map<String, dynamic> tokenJson = json.decode(response.body);
    microsoftGraphAccessToken = tokenJson['access_token'];
  }
}
