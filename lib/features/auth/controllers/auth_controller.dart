import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthController extends GetxController {
  final FirebaseAuth _auth;
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  bool _googleInitialized = false;

  AuthController({FirebaseAuth? auth}) : _auth = auth ?? FirebaseAuth.instance;

  final Rxn<User> user = Rxn<User>();
  final RxBool isLoading = false.obs;
  final RxString lastError = ''.obs;

  bool get isLoggedIn => user.value != null;

  @override
  void onInit() {
    super.onInit();
    user.bindStream(_auth.authStateChanges());
  }

  Future<void> signInWithGoogle() async {
    await _runAuthAction(() async {
      await _ensureGoogleInitialized();
      if (!_googleSignIn.supportsAuthenticate()) {
        throw UnsupportedError('Google sign-in is not supported on this platform.');
      }

      final googleUser = await _googleSignIn.authenticate();
      final idToken = googleUser.authentication.idToken;
      if (idToken == null || idToken.isEmpty) {
        throw StateError('Google sign-in did not return an ID token.');
      }

      final credential = GoogleAuthProvider.credential(idToken: idToken);
      await _auth.signInWithCredential(credential);
    });
  }

  Future<void> signInWithFacebook() async {
    await _runAuthAction(() async {
      final result = await FacebookAuth.instance.login(
        permissions: const ['public_profile', 'email'],
      );
      if (result.status != LoginStatus.success) return;
      final accessToken = result.accessToken;
      if (accessToken == null) return;

      final credential = FacebookAuthProvider.credential(accessToken.tokenString);
      await _auth.signInWithCredential(credential);
    });
  }

  Future<void> signInWithApple() async {
    await _runAuthAction(() async {
      // Apple requires a cryptographic nonce. Firebase verifies it server-side.
      final rawNonce = _generateNonce();
      final hashedNonce = _sha256OfString(rawNonce);

      final appleIdCredential = await SignInWithApple.getAppleIDCredential(
        scopes: const [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
        nonce: hashedNonce,
      );

      final oauthProvider = OAuthProvider('apple.com');
      final credential = oauthProvider.credential(
        idToken: appleIdCredential.identityToken,
        rawNonce: rawNonce,
        accessToken: appleIdCredential.authorizationCode,
      );

      await _auth.signInWithCredential(credential);
    });
  }

  Future<void> signOut() async {
    await _runAuthAction(() async {
      try {
        await _ensureGoogleInitialized();
        await _googleSignIn.signOut();
      } catch (_) {}
      try {
        await FacebookAuth.instance.logOut();
      } catch (_) {}
      await _auth.signOut();
    });
  }

  Future<void> _ensureGoogleInitialized() async {
    if (_googleInitialized) return;
    await _googleSignIn.initialize();
    _googleInitialized = true;
  }

  Future<void> _runAuthAction(Future<void> Function() action) async {
    if (isLoading.value) return;
    lastError.value = '';
    isLoading.value = true;
    try {
      await action();
    } on FirebaseAuthException catch (e) {
      lastError.value = e.message ?? e.code;
    } catch (e) {
      lastError.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  // ---- Nonce helpers (no extra packages needed) ----

  static const _charset =
      '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';

  String _generateNonce([int length = 32]) {
    final random = Random.secure();
    return List.generate(
      length,
      (_) => _charset[random.nextInt(_charset.length)],
    ).join();
  }

  String _sha256OfString(String input) {
    final bytes = input.codeUnits;
    final digest = sha256.convert(bytes);
    return digest.toString();
  }
}

