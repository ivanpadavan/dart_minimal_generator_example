import 'dart:async';

import 'package:build/build.dart';
import 'package:build_test/build_test.dart';
import 'package:model_generator/builder.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';


final String pkgName = 'pkg';

final Builder builder = new PartBuilder([const HasIdGenerator()]);

Future<String> generate(String source) async {
  final srcs = <String, String>{
    '$pkgName|lib/value.dart': source,
  };

  final writer = new InMemoryAssetWriter();
  await testBuilder(builder, srcs, rootPackage: pkgName, writer: writer);
  print(srcs);
  return new String.fromCharCodes(
      writer.assets[new AssetId(pkgName, 'lib/value.g.dart')]);
}

void main() {
  group('generator', ()  {
    test('generator runs', () async {
      final result = await generate('''
      class Hero {
        int id;
        String name;
      }
      class Zero {
        int NotId;
        String name;
      }
      ''');
      expect(result, contains('Hero'));
    });
  });
}