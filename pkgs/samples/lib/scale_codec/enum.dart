// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // ignore: unnecessary_cast
  final extraDataCodec =
      CompositeCodec({
            'index': U8Codec.codec,
            'name': StrCodec.codec,
            'customTuple': TupleCodec([
              SimpleEnumCodec.fromList(['Red', 'Orange']),
              BoolCodec.codec,
            ]),
          })
          as Codec;

  final codec = ComplexEnumCodec.sparse({
    0: MapEntry('Plain', StrCodec.codec),
    1: MapEntry('ExtraData', extraDataCodec),
  });

  final value = MapEntry('ExtraData');
  final output = HexOutput();

  codec.encodeTo(value, output);

  // 0x010124706f6c6b61646172740001
  final encodedHex = output.toString();

  final input = Input.fromHex(encodedHex);

  // MapEntry('ExtraData', {
  //       'index': 1,
  //       'name': 'polkadart',
  //       'customTuple': ['Red', true],
  //     })
  var decoded = codec.decode(input);
}
