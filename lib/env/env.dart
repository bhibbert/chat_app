import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
final class Env {
  @EnviedField(
    varName: 'firebase_key',
    obfuscate: true,
  )
  static final String firebaseKey = _Env.firebaseKey;

  @EnviedField(
    varName: 'firebaseOptions_key',
    obfuscate: true,
  )
  static final String firebaseOptionsKey = _Env.firebaseOptionsKey;
}
