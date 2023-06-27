//Полиморфизм. Какие типы полиморфизма бывают?
//Полиморфизм - возможность метода обработывать разне типы данных.
// Универсальный:
// 1) Полиморфизм параметрический. (Пример Pair ниже)
//
// 2) Полиморфизм подтипов. (Пример Animal->Dog ниже)
//
// Add hoc:
// 3)Полиморфизм перегрузки. Модум создать несколько функций с одним именем
// но разными входными параметрами. в dart нет.
//
// 4)Полиморфизм приведения типов. В слабо типизированных языках.

class Animal {
  void makeSound() {
    print('animal sound');
  }
}

class Dog extends Animal {
  @override
  void makeSound() {
    print('dog sound');
  }
}

class Cat extends Animal {
  @override
  void makeSound() {
    print('cat sound');
  }
}

void sound(Animal animal) {
  animal.makeSound();
}

class Sum<T extends num> {
  T first;
  T second;

  Sum(this.first, this.second);

  num sum() => first + second;
}

void main() {

  sound(Animal());
  sound(Dog());
  sound(Cat());

  print(Sum(2, 4).sum()); //runtimeType - int
  print(Sum(2, 3.4).sum()); //runtimeType - double
}
