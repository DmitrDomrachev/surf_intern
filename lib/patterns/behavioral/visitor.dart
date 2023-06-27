// Используем, если нужно добавить в классы новые операции, но эти классы нельзя изменять

abstract interface class Shape {
  void draw();

  String accept(Visitor visitor);
}

class Rectangle implements Shape {
  final int square;

  Rectangle(this.square);

  @override
  String accept(Visitor visitor) {
    return visitor.visitRectangle(this);
  }

  @override
  void draw() {
    print('Draw rectangle, square = $square');
  }
}

class Circle implements Shape {
  final int radius;

  Circle(this.radius);

  @override
  String accept(Visitor visitor) {
    return visitor.visitCircle(this);
  }

  @override
  void draw() {
    print('Draw circle, radius = $radius');
  }
}

class Dot implements Shape {
  final int x;
  final int y;

  Dot(this.x, this.y);

  @override
  String accept(Visitor visitor) {
    return visitor.visitDot(this);
  }

  @override
  void draw() {
    print('Draw dot, x,y = ($x,$y)');
  }
}

abstract interface class Visitor {
  String visitDot(Dot dot);

  String visitCircle(Circle circle);

  String visitRectangle(Rectangle rectangle);
}

class ToStringVisitor implements Visitor {
  @override
  String visitCircle(Circle circle) {
    return 'Circle{radius: ${circle.radius}}';
  }

  @override
  String visitDot(Dot dot) {
    return 'Dot{x: ${dot.x}, y: ${dot.y}}';
  }

  @override
  String visitRectangle(Rectangle rectangle) {
    return 'Rectangle{square: ${rectangle.square}}';
  }
}

void main() {
  final rectangle = Rectangle(2);
  final circle = Circle(4);
  final dot = Dot(3, 4);

  final visitor = ToStringVisitor();

  print(dot.accept(visitor));
  print(circle.accept(visitor));
  print(rectangle.accept(visitor));
}
