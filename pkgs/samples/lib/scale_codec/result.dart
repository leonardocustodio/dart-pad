// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Creates the registry for parsing the types
  final registry = Registry();

  // Register the custom codec of your choice
  registry.registerCustomCodec(<String, dynamic>{'A': 'Result<u8, bool>'});

  // Initialize the scale codec
  final codec = ScaleCodec(registry);

  // Encoding
  final output = HexOutput();
  codec.encodeTo('A', MapEntry('Ok', 42), output);
  final encodedHex = output.toString();
  print(encodedHex); // 0x002a

  // Decoding
  final input = Input.fromHex(encodedHex);
  var decoded = codec.decode('A', input);
  print(decoded); // MapEntry('Ok', 42)

  // For Err field

  // Encoding
  final value = MapEntry('Err', false);
  codec.encodeTo('A', value, output);
  final encodedErrHex = output.toString();
  print(encodedErrHex); // 0x0100

  // Decoding
  var decodedErr = codec.decode('A', input);
  print(decodedErr); // MapEntry('Err', false)
}
