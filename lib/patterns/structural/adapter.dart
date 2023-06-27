// Позволяет связать два класса, имеющие несовместимые интерфейсы

class OldClass {
  void oldMethod() {
    print("Метод в старом классе");
  }
}

abstract class TargetInterface {
  void targetMethod();
}

class Adapter implements TargetInterface {
  final OldClass _oldClass;

  Adapter(this._oldClass);

  @override
  void targetMethod() {
    _oldClass.oldMethod();
  }
}

void main() {
  OldClass oldClass = OldClass();
  TargetInterface adapter = Adapter(oldClass);
  adapter.targetMethod();
}
