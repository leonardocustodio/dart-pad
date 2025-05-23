// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Encode - Some
  final value = true;
  final output = HexOutput();
  OptionCodec(BoolCodec.codec).encodeTo(value, output);
  var encodedHex = output.toString();
  print(encodedHex); // 0x0101

  // Decode - Some
  final input = Input.fromHex(encodedHex);
  var decoded = OptionCodec(BoolCodec.codec).decode(input);
  print(decoded); // Option.some(true)

  // Encode - None
  final noneOutput = HexOutput();
  OptionCodec(BoolCodec.codec).encodeTo(null, noneOutput);
  var noneEncoded = output.toString();
  print(noneEncoded); // 0x00

  // Decode - None
  final noneInput = Input.fromHex(noneEncoded);
  var noneDecoded = OptionCodec(BoolCodec.codec).decode(noneInput);
  print(noneDecoded); // Option.none()
}
