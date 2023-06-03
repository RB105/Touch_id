import 'package:local_auth/local_auth.dart';

class AuthenticationService {
  final LocalAuthentication _localAuth = LocalAuthentication();

  Future<bool> isBiometricAvailable() async {
    bool isAvailable = await _localAuth.canCheckBiometrics;
    return isAvailable;
  }

  Future<List<BiometricType>> getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics =
        await _localAuth.getAvailableBiometrics();
    return availableBiometrics;
  }

  Future<bool> authenticateWithBiometrics() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await _localAuth.authenticate(
          localizedReason: 'Please authenticate to access this feature',
          options: const AuthenticationOptions(
              useErrorDialogs: true, stickyAuth: true));
    } on Exception catch (e) {
      print(e);
    }
    return isAuthenticated;
  }
}
