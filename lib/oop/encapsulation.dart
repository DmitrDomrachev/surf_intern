// Инкапсуляция. В чем разница с сокрытием данных/реализации?
//
// Инкапсуляция - объедининие данных и методов в одном классе,
// защищая их от внешнего досступа.
// Инкапсуляция ограничевает доступную для пользователя информацию
// и предоставляет интерфейс, сокрытие реализации - предотвращает зависимость
// пользователя от конкретной реализации,
// сокрытие данных - защищает поля от прямого доступа пользователя.

class Car {
  final String _engine;

  String get engineInfo => _engine;

  Car(this._engine);

  void drive() {
    _controlEngine();
    _controlWheels();
    _controlTransmission();
  }

  void stop() {
    _controlTransmission();
    _controlWheels();
  }

  void _controlWheels() {}

  void _controlTransmission() {}

  void _controlEngine() {}
}
