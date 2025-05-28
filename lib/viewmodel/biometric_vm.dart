import 'package:local_auth/local_auth.dart';

class BiometricVM {
  final LocalAuthentication _auth = LocalAuthentication();

  Future<bool> authenticate() async {
    try {
      bool canCheck = await _auth.canCheckBiometrics;
      if (!canCheck) return false;

      bool authenticated = await _auth.authenticate(
        localizedReason: 'Please authenticate to proceed',
        options: const AuthenticationOptions(
          biometricOnly: true,
          stickyAuth: true,
        ),
      );
      return authenticated;
    } catch (e) {
      return false;
    }
  }
}
