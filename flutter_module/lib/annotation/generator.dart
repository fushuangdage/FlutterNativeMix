library source_gen_example.builder;
import 'package:analyzer/dart/element/element.dart';
import 'package:build/src/builder/build_step.dart';
import 'package:flutter_module/annotation/test_annotation.dart';
import 'package:source_gen/source_gen.dart';
import 'package:build/build.dart';

class TestGenerator extends GeneratorForAnnotation<FastClick> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    return "class Testtest{}";
  }
}


Builder testBuilder(BuilderOptions options) =>
    LibraryBuilder(TestGenerator());


