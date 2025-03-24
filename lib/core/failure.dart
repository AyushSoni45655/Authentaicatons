

abstract class Failuress {
  final String error;
  Failuress({required this.error});

  String getMessage() => error; // ✅ सही एरर मैसेज मिलेगा
  @override
  String toString() => error; // ✅ print(failure) करने पर सही मैसेज दिखेगा
}

class ServerFailure extends Failuress {
  ServerFailure(String serverMessage) : super(error: serverMessage);
}

class AuthFailure extends Failuress {
  AuthFailure(String authMessage) : super(error: authMessage);
}
