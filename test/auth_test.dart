import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/auth_user.dart';
import 'package:test/test.dart';

void main() {
  group('Mock Authentication', (){
    final provider = MockAuthProvider();
    test('Should not be initialized to begin with', () {
      expect(provider.isInitialized, false);
    });

    test('Cannot log out if not initoalized', (){
      expect(provider.logOut(),
      throwsA(const TypeMatcher<NotInitializedEException>())
      );
    });

    test('Should be able to initialize',() async{
      await provider.initialize();
      expect(provider.isInitialized, true);
    });

  });
}

class NotInitializedEException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;
  var _isInitialized = false;
  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedEException();
    await Future.delayed(const Duration(seconds: 1));
    return logIn(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
  await Future.delayed(const Duration(seconds: 1));
    _isInitialized =true;
  }

  @override
  Future<AuthUser> logIn({
    required String email,
    required String password,
  }) async {
 if (!isInitialized) throw NotInitializedEException();
    await Future.delayed(const Duration(seconds: 1));
    if (email == 'kojo@adent.com') throw UserNotFoundAuthException();
    if (password == 'annan') throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return Future.value(user);

  }

  @override
  Future<void> logOut() async {
    if(!isInitialized) throw NotInitializedEException();
    if(_user == null) throw UserNotFoundAuthException();
    await Future.delayed(const Duration(seconds: 1));
    _user = null;
  }

  @override
  Future<void> sendEmailVerification() async {
    if (!isInitialized) throw NotInitializedEException();
    final user = _user;
    if (user == null) throw UserNotFoundAuthException();
    const newUser = AuthUser (isEmailVerified: true);
    _user = newUser;
  }
}
