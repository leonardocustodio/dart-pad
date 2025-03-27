// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Initializing Codec object
  final codec = BitSequenceCodec(BitStore.U8, BitOrder.LSB);

  final value = '11111';

  final bitArray = BitArray.parseBinary(value);

  final output = HexOutput();

  codec.encodeTo(value, output);

  // 0x1f
  final encodedHex = output.toString();

  final input = Input.fromHex(encodedHex);

  // BitArray.parseBinary('11111')
  var decoded = codec.decode(input);
}
