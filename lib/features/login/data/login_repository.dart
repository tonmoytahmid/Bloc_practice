import 'package:bloc_practice/features/login/database/login_database.dart';
import 'package:drift/drift.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginRepository {
  final AppDatabase db;
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  LoginRepository(this.db);

  Future<User?> signInWithGoogle({
    required String phoneNumber,
    required String occupation,
    required String name,
  }) async {
    final account = await _googleSignIn.signIn();
    if (account == null) return null;

    final user = UsersCompanion(
      name: Value(name),
      email: Value(account.email),
      phoneNumber: Value(phoneNumber),
      occupation: Value(occupation),
    );

    await db.deleteUser();
    await db.insertUser(user);
    return await db.getUser();
  }

  Future<User?> getLoggedInUser() async {
    return await db.getUser();
  }

  Future<void> logout() async {
    await _googleSignIn.signOut();
    await db.deleteUser();
  }
}
