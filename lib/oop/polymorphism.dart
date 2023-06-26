//Полиморфизм. Какие типы полиморфизма бывают?
//Полиморфизм - возможность метода/части программы обработки разных типов данных.
// 1) Полиморфизм наследования. Обекты потомков могут использоватья вместо родителей
//
// 2) Полиморфизм интерфейсов. Если некий модуль будет зависеть от интерфейса,
// то он может работать с любым классом, реализующим этот интерфейс
//
// 3)Полиморфизм дженериков. Можем создать обобщенный код, который работает с разными типами данных.

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

void main() {
  sound(Animal());
  sound(Dog());
  sound(Cat());
}
