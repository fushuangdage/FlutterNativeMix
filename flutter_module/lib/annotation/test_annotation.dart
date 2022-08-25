class FastClick {
  final int time;
  const FastClick(this.time);
}

class AutoChannel {
  final int nativeType;
  const AutoChannel(this.nativeType);
}

@AutoChannel(1)class TestModel {
  var foo = const [];
  var test = FastClick(1);
  bool showToast(String content,int duration){
    return true;
  }

}
