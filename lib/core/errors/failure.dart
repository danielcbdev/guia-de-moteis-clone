abstract class Failure {
  final String message;

  const Failure([this.message = 'Ocorreu uma falha.']);
}

class ServerFailure extends Failure {
  const ServerFailure([super.message = 'Falha no servidor']);
}
