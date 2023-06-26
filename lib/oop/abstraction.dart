//Абстракция - позволяет выделяя важные характеристики объектов и
//игнорироуя незначительные детали создать базавый класс в иерархии наследования

// Объявляем абстрактный класс Vehicle (транспортное средство)
abstract class Vehicle {
  String _color;

  String model;

  Vehicle(this.model) : _color = 'Черный';

  void makeSound();

  String get color => _color;

  set color(String newColor) => _color = newColor;

  void getInfo() {
    print('Модель: $model');
    print('Цвет: $_color');
  }
}

class Car extends Vehicle {
  Car(String model) : super(model);

  @override
  void makeSound() {
    print('Автомобиль издает звук - Вром!');
  }
}

class Bicycle extends Vehicle {
  Bicycle(String model) : super(model);

  @override
  void makeSound() {
    print('Велосипед издает звук - Дзинь дзинь!');
  }
}

void main() {
  Car car = Car('Toyota');
  car.color = 'Красный';
  car.getInfo();
  car.makeSound();

  Bicycle bicycle = Bicycle('Trek');
  bicycle.color = 'Синий';
  bicycle.getInfo();
  bicycle.makeSound();
}
