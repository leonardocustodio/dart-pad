// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Composite Codec
  final codec =
      CompositeCodec({
            'index': U8Codec.codec,
            'name': StrCodec.codec,
            'customTuple': TupleCodec([
              SimpleEnumCodec.fromList(['Red', 'Orange']),
              BoolCodec.codec,
            ]),
          })
          as Codec;

  final value = {
    'index': 1,
    'name': 'polkadart',
    'customTuple': ['Red', true],
  };

  final output = HexOutput();

  codec.encodeTo(value, output);

  // 0x0124706f6c6b61646172740001
  final encodedHex = output.toString();

  final input = Input.fromHex(encodedHex);

  // {
  //  'index': 1,
  //  'name': 'polkadart',
  //  'customTuple': ['Red', true],
  // }
  var decoded = codec.decode(input);
}
