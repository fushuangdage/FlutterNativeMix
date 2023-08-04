
import 'dart:io';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:args/args.dart';

void main(List<String> arguments) {
  exitCode = 0; // presume success
  final parser = ArgParser()..addFlag("file", negatable: false, abbr: 'f');

  var argResults = parser.parse(arguments);
  final paths = argResults.rest;
  if (paths.isEmpty) {
    stdout.writeln('No file found');
  } else {
    generate(paths[0]);
  }
}

class DemoAstVisitor extends GeneralizingAstVisitor<Map> {
  @override
  Map visitNode(AstNode node) {
    //输出遍历AST Node 节点内容
    stdout.writeln("${node.runtimeType}<---->${node.toSource()}");
    return super.visitNode(node);
  }
  @override
  Map visitMethodInvocation(MethodInvocation node) {
    stdout.write("visitMethodInvocation : ${node.runtimeType} ======== ${node.toSource()}");
    return super.visitMethodInvocation(node);
  }

  @override
  Map visitMethodDeclaration(MethodDeclaration node) {
    stdout.write("visitMethodInvocation : ${node.runtimeType} ======== ${node.toSource()}");
    return super.visitMethodDeclaration(node);
  }

  @override
  Map visitAssignmentExpression(AssignmentExpression node) {
    stdout.write("visitAssignmentExpression : ${node.runtimeType} ======== ${node.toSource()}");
    return super.visitAssignmentExpression(node);
  }
}

//生成AST
Future generate(String path) async {
  if (path.isEmpty) {
    stdout.writeln("No file found");
  } else {
    await _handleError(path);
    if (exitCode == 2) {
      try {
        var parseResult = parseFile(path: path, featureSet: FeatureSet.fromEnableFlags([]));
        var compilationUnit = parseResult.unit;
        //遍历AST
        compilationUnit.accept(DemoAstVisitor());
      } catch (e) {
        stdout.writeln('Parse file error: ${e.toString()}');
      }
    }
  }
}

Future _handleError(String path) async {
  if (await FileSystemEntity.isDirectory(path)) {
    stderr.writeln('error: $path is a directory');
  } else {
    exitCode = 2;
  }
}

