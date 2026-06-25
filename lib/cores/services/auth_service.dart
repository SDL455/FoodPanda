import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart'
    show GoogleSignIn, GoogleSignInAccount, GoogleSignInAuthentication;
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService extends GetxService {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;
  final FacebookLogin _facebookLogin = FacebookLogin();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );
    return await _auth.signInWithCredential(credential);
  }

  Future<UserCredential?> signInWithFacebook() async {
    final result = await _facebookLogin.logIn(
      permissions: [FacebookPermission.publicProfile, FacebookPermission.email],
    );

    switch (result.status) {
      case FacebookLoginStatus.success:
        final accessToken = result.accessToken;

        if (accessToken == null) {
          throw Exception("Facebook access token is null");
        }

        final credential = FacebookAuthProvider.credential(accessToken.token);

        final userCredential = await _auth.signInWithCredential(credential);

        print("========= FACEBOOK =========");
        print("UID      : ${userCredential.user?.uid}");
        print("Name     : ${userCredential.user?.displayName}");
        print("Email    : ${userCredential.user?.email}");
        print("Photo    : ${userCredential.user?.photoURL}");
        print("Provider : ${userCredential.user?.providerData}");
        print("============================");

        return userCredential;

      case FacebookLoginStatus.cancel:
        return null;

      case FacebookLoginStatus.error:
        throw Exception(result.error);
    }
  }

  Future<AuthorizationCredentialAppleID> signInWithApple() async {
    final credentials = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );
    return credentials;
  }

  Future<void> signOut() async {
    await _googleSignIn.signOut();
    await _facebookLogin.logOut();
    await _auth.signOut();
  }
}
