import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:test_unit/firebase/auth.dart';


class MockFirebaseAuth extends Mock implements FirebaseAuth {
}

void main() {
  final MockFirebaseAuth mockFirebaseAuth = MockFirebaseAuth();
  final Auth auth = Auth(auth: mockFirebaseAuth);
  setUp(() {});
  tearDown(() {});

  test("create account", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "test@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => null);

    expect(
        await auth.createAccount(email: "test@gmail.com", password: "123456"),
        "Success");
  });

  test("create account exception", () async {
    when(
      mockFirebaseAuth.createUserWithEmailAndPassword(
          email: "test@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "Ocurrió un error", code: "400"));

    expect(
        await auth.createAccount(email: "test@gmail.com", password: "123456"),
        "Ocurrió un error");
  });

  test("sign in", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "test@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) => null);

    expect(await auth.signIn(email: "test@gmail.com", password: "123456"),
        "Success");
  });

  test("sign in exception", () async {
    when(
      mockFirebaseAuth.signInWithEmailAndPassword(
          email: "test@gmail.com", password: "123456"),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "Ocurrió un error", code: "400"));

    expect(await auth.signIn(email: "test@gmail.com", password: "123456"),
        "Ocurrió un error");
  });

  test("sign out", () async {
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((realInvocation) => null);

    expect(await auth.signOut(), "Success");
  });

  test("sign out exception", () async {
    when(
      mockFirebaseAuth.signOut(),
    ).thenAnswer((realInvocation) =>
        throw FirebaseAuthException(message: "Ocurrió un error",  code: "400"));

    expect(await auth.signOut(), "Ocurrió un error");
  });
}
