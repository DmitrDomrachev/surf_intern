//Несколько маленьких интерфейсов лучше одного общего

//Антипример. Собрал общий интерфейс для фигур, но он не подходит для прямой.
// Лучше разделить его на несколько интерфейсов, и имплементировать только необходимые
abstract interface class IFigure {
  String getColor();

  double getArea();

  double getLength();
}

class Rectangle implements IFigure {
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

class Line implements IFigure {
  @override
  double getArea() {
    throw UnimplementedError();
  }

  @override
  String getColor() {
    return 'black';
  }

  @override
  double getLength() {
    return 0.2;
  }
}
