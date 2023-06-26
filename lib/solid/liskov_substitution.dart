//если q(x) является свойством, верным относительно объектов x некоторого типа T,
//тогда q(y) также должно быть верным для объектов y типа S,
// где S является подтипом типа T.

class Animal {
  void makeSound() {
    print('animal sound');
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

//Если sound работает для Animal, то должно работать и для Cat,
//являющегося его наследником