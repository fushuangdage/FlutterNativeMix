import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_module/annotation/test_annotation.dart';
import 'package:source_gen/source_gen.dart';

class TestGenerator extends GeneratorForAnnotation<FastClick> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return "class Testttest{}";
  }
}

Builder testBuilder(BuilderOptions options) =>
    LibraryBuilder(TestGenerator(), generatedExtension: '.info.dart');
