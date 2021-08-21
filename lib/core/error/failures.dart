import 'package:flutter/foundation.dart';

abstract class Failure {
  final String message;

  const Failure(this.message);

  @override
  String toString() => 'Failure(message: $message)';
}

class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);
}

class ServerStatusFailure extends Failure {
  final int statusCode;

  const ServerStatusFailure({@required this.statusCode})
      : super("Error $statusCode");
}

class RequestResponseFailure extends Failure {
  final List<String> messages;

  const RequestResponseFailure({@required this.messages})
      : super('Error $messages');
}
