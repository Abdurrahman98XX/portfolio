import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:convert/convert.dart';

abstract interface class Utils {
  static FutureOr<({T result, Duration duration})> timeElapsed<T>(
      FutureOr<T> Function() function) async {
    final start = DateTime.now();
    final result = await function();
    final duration = DateTime.now().difference(start);
    return (result: result, duration: duration);
  }

  static ({Digest value, bool? isValid}) hash512356(List<String> messages,
      {String? check}) {
    final output = AccumulatorSink<Digest>();
    var input = sha512256.startChunkedConversion(output);
    // ignore: curly_braces_in_flow_control_structures
    for (var message in messages) input.add(utf8.encode(message));
    input.close();
    final digest = output.events.single;
    if (check != null) return (value: digest, isValid: '$digest' == check);
    return (value: digest, isValid: null);
  }
}
