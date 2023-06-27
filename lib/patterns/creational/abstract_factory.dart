// Позваляет создавать семейства объектов, не привязываясь к конкретным классам

abstract interface class Button {
  void render();
}

class MacButton implements Button {
  @override
  void render() {
    print('mac btn render');
  }
}

class WinButton implements Button {
  @override
  void render() {
    print('win btn render');
  }
}

abstract interface class CheckBox {
  void render();
}

class MacCheckBox implements CheckBox {
  @override
  void render() {
    print('mac checkBox render');
  }
}

class WinCheckBox implements CheckBox {
  @override
  void render() {
    print('win checkBox render');
  }
}

abstract interface class GUIFactory {
  Button createButton();

  CheckBox createCheckBox();
}

class MacFactory implements GUIFactory {
  @override
  Button createButton() {
    return MacButton();
  }

  @override
  CheckBox createCheckBox() {
    return MacCheckBox();
  }
}

class WinFactory implements GUIFactory {
  @override
  Button createButton() {
    return WinButton();
  }

  @override
  CheckBox createCheckBox() {
    return WinCheckBox();
  }
}

void main() {
  if (1 < 2) {
    initGui(MacFactory());
  } else {
    initGui(WinFactory());
  }
}

void initGui(GUIFactory factory) {
  final Button button = factory.createButton();
  final CheckBox checkBox = factory.createCheckBox();
  button.render();
  checkBox.render();
}
