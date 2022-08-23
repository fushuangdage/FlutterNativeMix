void main() {
  TestClass().say();
  TestClass().show();
}

class TestClass with Manager,Manager1 {
  void say() {
    print('call say');
    run();
  }
// void show() {
//   print('call inner show');
// }
}

mixin Manager{
  void run() {
    print('call run');
  }
}
mixin Manager1{
  void run() {
    print('call run');
  }
}

extension on TestClass {
  void show() {
    print('call show');
  }
}
