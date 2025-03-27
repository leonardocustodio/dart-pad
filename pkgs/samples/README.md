[![samples](https://github.com/dart-lang/dart-pad/actions/workflows/samples.yml/badge.svg)](https://github.com/dart-lang/dart-pad/actions/workflows/samples.yml)

Sample code snippets for DartPad.

## Samples

<!-- samples -->
| Category | Name | Sample | ID |
| --- | --- | --- | --- |
| Defaults | Dart snippet | [default_dart.dart](lib/default_dart.dart) | `dart` |
| Scale Codec | BitVec | [bitvec.dart](lib/scale_codec/bitvec.dart) | `bitvec` |
| Scale Codec | Compact | [compact.dart](lib/scale_codec/compact.dart) | `compact` |
| Scale Codec | Composite | [composite.dart](lib/scale_codec/composite.dart) | `composite` |
| Scale Codec | Enum | [enum.dart](lib/scale_codec/enum.dart) | `enum` |
| Scale Codec | Integers | [integers.dart](lib/scale_codec/integers.dart) | `integers` |
| Scale Codec | Option | [option.dart](lib/scale_codec/option.dart) | `option` |
| Scale Codec | Result | [result.dart](lib/scale_codec/result.dart) | `result` |
<!-- samples -->

## Contributing

When considering contributing a sample to DartPad, please open an issue first
for discussion.

After the sample is discussed and approved:

- add the code for the sample to a new Dart file in `lib/`
- add an entry for the sample to the [lib/samples.json](lib/samples.json) file
- run `dart tool/samples.dart` to re-generate related files
