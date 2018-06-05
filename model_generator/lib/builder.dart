import 'dart:async';
import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:analyzer/dart/element/element.dart';

Builder modelBuilder(BuilderOptions options) => new LibraryBuilder(
      const HasIdGenerator(),
      generatedExtension: '.g.dart',
      header: options?.config['header'] as String,
    );

class HasIdGenerator extends Generator {
  const HasIdGenerator();

  @override
  Future<String> generate(LibraryReader library, _) async {
    var output = new StringBuffer();
    final classElements = library.allElements.where(_hasIdField);
    classElements.forEach((e) => output.writeln('// "$e" has the id field'));
    return '$output';
  }

  bool _hasIdField(Element e) {
    if (e is ClassElement) {
      print(e.fields);
      return e.fields.any((FieldElement f) => f.name == 'id');
    }
    return false;
  }
}
