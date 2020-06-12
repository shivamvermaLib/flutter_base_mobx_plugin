import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
part 'firebase_auth_store.g.dart';

class FirebaseAuthStore = _FirebaseAuthStoreBase with _$FirebaseAuthStore;

abstract class _FirebaseAuthStoreBase with Store {
  @observable
  FirebaseUser currentUser;

  @computed
  bool get isUserLoggedIn => currentUser != null;

  final FirebaseAuth firebaseAuth;

  _FirebaseAuthStoreBase(this.firebaseAuth) {
    assert(firebaseAuth != null);
    firebaseAuth.onAuthStateChanged.listen((user) {
      print("Current: $user");
      currentUser = user;
    });
  }

  Future<void> signOutUser() async {
    await firebaseAuth.signOut();
  }

  Future<String> forgetPassword(String email) async {
    await firebaseAuth.sendPasswordResetEmail(email: email);
    return null;
  }

  Future<String> loginUser(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user.uid;
  }

  Future<String> registerUser(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user.uid;
  }
}
