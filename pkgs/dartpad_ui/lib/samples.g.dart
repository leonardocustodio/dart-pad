// Copyright (c) 2023, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

// This file has been automatically generated - please do not edit it manually.

import 'package:collection/collection.dart';

class Sample {
  final String category;
  final String icon;
  final String name;
  final String id;
  final String source;

  const Sample({
    required this.category,
    required this.icon,
    required this.name,
    required this.id,
    required this.source,
  });

  bool get isDart => category == 'Dart';

  bool get shouldList => category != 'Defaults';

  @override
  String toString() => '[$category] $name ($id)';
}

abstract final class Samples {
  static const List<Sample> all = [
    _dart,
    _bitvec,
    _compact,
    _composite,
    _enum,
    _integers,
    _option,
    _result,
  ];

  static const Map<String, List<Sample>> categories = {
    'Scale Codec': [_bitvec, _compact, _composite, _enum, _integers, _option, _result],
  };

  static Sample? getById(String? id) => all.firstWhereOrNull((s) => s.id == id);

  static String defaultSnippet({bool forFlutter = false}) =>
      getById(forFlutter ? 'flutter' : 'dart')!.source;
}

const _dart = Sample(
  category: 'Defaults',
  icon: 'dart',
  name: 'Dart snippet',
  id: 'dart',
  source: r'''
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
''',
);

const _bitvec = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'BitVec',
  id: 'bitvec',
  source: r'''
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
''',
);

const _compact = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'Compact',
  id: 'compact',
  source: r'''
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
''',
);

const _composite = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'Composite',
  id: 'composite',
  source: r'''
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
''',
);

const _enum = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'Enum',
  id: 'enum',
  source: r'''
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
''',
);

const _integers = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'Integers',
  id: 'integers',
  source: r'''
// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  unsignedUp32(); // Unsigned Integers ( u8 | u16 | u32 )
  unsignedUp256(); // Unsigned Integers ( u64 | u128 | u256 )
  signedUp32(); // Signed Integers ( i8 | i16 | i32 )
  signedUp256(); // Signed Integers ( i64 | i128 | i256 )
}

void unsignedUp32() {
  // Encode
  var output = HexOutput();
  final value = 69;
  U8Codec.codec.encodeTo(value, output);
  var encodedHex = output.toString();
  print(encodedHex); // 0x45

  // Decode
  var input = Input.fromHex(encodedHex);
  var decoded = U8Codec.codec.decode(input);
  print(decoded); // 69
}

void unsignedUp256() {
  // Encode
  var output = HexOutput();
  final value = BigInt.parse(
    '115792089237316195423570985008687907853269984665640564039457584007913129639935',
  );
  U256Codec.codec.encodeTo(value, output);
  var encodedHex = output.toString();
  print(
    encodedHex,
  ); // 0xffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff

  // Decode
  var input = Input.fromHex(encodedHex);
  var decoded = U256Codec.codec.decode(input);
  print(
    decoded,
  ); // BigInt.parse('115792089237316195423570985008687907853269984665640564039457584007913129639935');
}

void signedUp32() {
  // Encode
  var output = HexOutput();
  final value = -128;
  I8Codec.codec.encodeTo(value, output);
  var encodedHex = output.toString();
  print(encodedHex); // 0x80

  // Decode
  var input = Input.fromHex(encodedHex);
  var decoded = I8Codec.codec.decode(input);
  print(decoded); // -128
}

void signedUp256() {
  // Encode
  var output = HexOutput();
  final value = BigInt.parse('-9223372036854775808');
  I64Codec.codec.encodeTo(value, output);
  var encodedHex = output.toString();
  print(encodedHex); // 0x0000000000000080

  // Decode
  var input = Input.fromHex(encodedHex);
  var decoded = I64Codec.codec.decode(input);
  print(decoded); // BigInt.parse('-9223372036854775808')
}
''',
);

const _option = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'Option',
  id: 'option',
  source: r'''
// Copyright 2025 to the Polkadart Team
import 'package:polkadart_scale_codec/polkadart_scale_codec.dart';

void main() {
  // Encode - Some
  final value = Option.some(true);
  final output = HexOutput();
  OptionCodec(BoolCodec.codec).encodeTo(value, output);
  var encodedHex = output.toString();
  print(encodedHex); // 0x0101

  // Decode - Some
  final input = Input.fromHex(encodedHex);
  var decoded = OptionCodec(BoolCodec.codec).decode(input);
  print(decoded); // Option.some(true)

  // Encode - None
  final noneValue = Option.none();
  final noneOutput = HexOutput();
  OptionCodec(BoolCodec.codec).encodeTo(noneValue, noneOutput);
  var noneEncoded = output.toString();
  print(noneEncoded); // 0x00

  // Decode - None
  final noneInput = Input.fromHex(noneEncoded);
  var noneDecoded = OptionCodec(BoolCodec.codec).decode(input);
  print(noneDecoded); // Option.none()
}
''',
);

const _result = Sample(
  category: 'Scale Codec',
  icon: 'dart',
  name: 'Result',
  id: 'result',
  source: r'''
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
''',
);
