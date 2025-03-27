// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Initializing Codec object
  final codec = BitSequenceCodec(BitStore.U8, BitOrder.LSB);
  final value = '11111';

  // Encoding
  final bitArray = BitArray.parseBinary(value);
  final output = HexOutput();
  codec.encodeTo(bitArray, output);
  final encodedHex = output.toString();
  print(encodedHex); // 0x1f

  // Decoding
  final input = Input.fromHex(encodedHex);
  var decoded = codec.decode(input);
  print(decoded); // BitArray.parseBinary('11111')
}
