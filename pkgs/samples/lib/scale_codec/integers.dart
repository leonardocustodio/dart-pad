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
