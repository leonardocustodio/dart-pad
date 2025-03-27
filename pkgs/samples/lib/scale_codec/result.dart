// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Creates the registry for parsing the types
  final registry = Registry();

  // register the customCodec of your choice
  registry.registerCustomCodec(<String, dynamic>{'A': 'Result<u8, bool>'});

  // Initialize the scale codec
  final codec = ScaleCodec(registry);

  final output = HexOutput();

  codec.encodeTo('A', MapEntry('Ok', 42), output);

  // 0x002a
  final encodedHex = output.toString();

  final input = Input.fromHex(encodedHex);

  // MapEntry('Ok', 42)
  var decoded = codec.decode('A', input);

  // or
  //
  // For Err field
  //
  final value = MapEntry('Err', false);

  codec.encodeTo('A', value, output);
  // 0x0100
  final encodedHex = output.toString();

  // MapEntry('Err', false)
  var decoded = codec.decode('A', input);
}
