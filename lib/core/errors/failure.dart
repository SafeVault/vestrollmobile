import 'package:dartz/dartz.dart';

sealed class Failure {
  const Failure(this.message);
  final String message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure() : super('No internet connection');
}

class AuthFailure extends Failure {
  const AuthFailure(super.message);
}

class ValidationFailure extends Failure {
  const ValidationFailure(super.message, {this.fieldErrors});
  final Map<String, String>? fieldErrors;
}

class TimeoutFailure extends Failure {
  const TimeoutFailure() : super('Request timed out');
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Cache error']);
}

typedef ApiResult<T> = Either<Failure, T>;
