import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation_service.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;

  AuthProvider() {
    this.isAuthenticated();
  }

  login(String email, String password) {
    _token = 'sdkjnfsjdfjdskfkjshdfjkshdfjshfsdfjhskdf';
    print('tocken $_token');
    LocalStorage.prefs.setString('token', this._token!);
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    NavigationService.replaceTo(Flurorouter.dashboardRoute);
  }

  /* Function to check if user is authenticated */
  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    // For simulate to check JWT on backend
    await Future.delayed(Duration(milliseconds: 1000));
    authStatus = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
