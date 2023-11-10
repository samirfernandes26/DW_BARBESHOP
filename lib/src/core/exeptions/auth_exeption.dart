sealed class AuthExeption implements Exception {
  final String message;
  AuthExeption({required this.message});
}

class AuthError extends AuthExeption{
  AuthError({required super.message});
}

class AuthUnauthorizedException extends AuthExeption{
  AuthUnauthorizedException() : super(message: '');
}