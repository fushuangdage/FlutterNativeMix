class FastClick {
  final int time;
  const FastClick(this.time);
}

@FastClick(100)
class TestModel {
  var foo = const [];
  var test = FastClick(1);

}
