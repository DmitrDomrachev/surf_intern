//Несколько маленьких интерфейсов лучше одного общего

//Антипример. Собрал общий интерфейс для фигур, но он не подходит для прямой.
// Лучше разделить его на несколько интерфейсов, и имплементировать только необходимые

abstract interface class IFigure {
  String getColor();

  double getArea();

  double getLength();
}

abstract interface class IColor {
  String getColor();
}

abstract interface class IArea {
  double getArea();
}

abstract interface class ILength {
  double getLength();
}

class Rectangle implements IColor, IArea, ILength {
  @override
  double getArea() {
    return 0.3;
  }

  @override
  String getColor() {
    return 'red';
  }

  @override
  double getLength() {
    return 0.4;
  }
}

class Line implements IColor, ILength {
  @override
  String getColor() {
    return 'black';
  }

  @override
  double getLength() {
    return 0.2;
  }
}
