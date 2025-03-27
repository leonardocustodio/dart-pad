// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Encode
  var output = HexOutput();
  final value = 69;
  CompactCodec.codec.encodeTo(value, output);
  var encodedHex = output.toString();
  print(encodedHex); // 0x1501

  // Decode
  var input = Input.fromHex(encodedHex);
  var decoded = CompactCodec.codec.decode(input);
  print(decoded); // 69
}
