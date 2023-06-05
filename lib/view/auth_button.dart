import 'package:flutter/material.dart';
import 'package:local_auth/local_auth.dart';
import 'package:touch_idapp/service/local_auth_service.dart';
import 'package:touch_idapp/widget/show_message_helper.dart';

class AuthButton extends StatefulWidget {
  const AuthButton({super.key});

  @override
  State<AuthButton> createState() => _AuthButtonState();
}

class _AuthButtonState extends State<AuthButton> {
  final AuthenticationService _authService = AuthenticationService();
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        bool isAvailable = await _authService.isBiometricAvailable();
        if (isAvailable) {
          List<BiometricType> availableBiometrics =
              await _authService.getAvailableBiometrics();

          debugPrint("biometrics ${availableBiometrics.length}");

          if (availableBiometrics.isNotEmpty) {
            bool isAuthenticated =
                await _authService.authenticateWithBiometrics();
            print(isAuthenticated);

            if (isAuthenticated) {
              // User successfully authenticated
              showMessage('Authentication successful!');
            } else {
              // Authentication failed
              showMessage('Authentication failed!');
            }
          } else {
            // Biometrics not supported
            showMessage("Biometrics not supported");
          }
        } else {
          // Biometrics not available
          showMessage("Biometrics not available");
        }
      },
      child: const Text('Authenticate'),
    );
  }
}
