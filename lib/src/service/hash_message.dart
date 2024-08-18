import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

class HashMessage {
  const HashMessage();
  Digest encrypt(List<String> messages) {
    final output = AccumulatorSink<Digest>();
    var input = sha512256.startChunkedConversion(output);
    for (var message in messages) {
      input.add(utf8.encode(message));
    }
    input.close();
    final digest = output.events.single;
    return digest;
  }
}
