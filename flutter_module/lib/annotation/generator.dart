import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:flutter_module/annotation/test_annotation.dart';
import 'package:source_gen/source_gen.dart';

class TestGenerator extends GeneratorForAnnotation<AutoChannel> {
  @override
  generateForAnnotatedElement(Element element, ConstantReader annotation, BuildStep buildStep) {
    (element as ClassElement).methods.forEach((e) {
      var params="";
      e.parameters.forEach((param) {
        params = "$params"+"paramType ${param.type}" +" ,paramName ${param.name}   ;   ";
      });

      print(">>>>>> name : ${e.name} , return Type:${e.returnType} , params $params");
    });
    return "class Testttest{}";
  }
}

Builder testBuilder(BuilderOptions options) =>
    LibraryBuilder(TestGenerator(), generatedExtension: '.info.dart');
