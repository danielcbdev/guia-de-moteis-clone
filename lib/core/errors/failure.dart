abstract class Failure {
  final String message;

  const Failure([this.message = 'Ocorreu uma falha.']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Falha no servidor']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Falha no cache']);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Falha de conexão']);
}