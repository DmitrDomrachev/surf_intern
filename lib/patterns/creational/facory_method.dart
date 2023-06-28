// Используем, когда заранее неизвестны типы и зависимости объектов,
// с которыми должен работать код.

// Фабричный метод отделяет код производства от основого,
// позваляя расширять и изменять код производства, не трогая основной код.
//
// Недостаток - может привести к большому количеству парралельных классов

abstract interface class IProduct {
  int getPrice();
}

class ProductA implements IProduct {
  @override
  int getPrice() {
    return 10;
  }
}

class ProductB implements IProduct {
  @override
  int getPrice() {
    return 20;
  }
}

// Создание объектов - не единственная задача, обычно содержит и другой код работы с продуктом
// Может быть не абстрактным и возвращать какой-то стандартный тип продукта
abstract class Creator {
  //...
  void someLogic() {
    IProduct product = createProduct();
    print(product.getPrice());
  }

  //В подклассе переопределим, чтобы логика выполнялась с нужным типом продукта
  IProduct createProduct();
//...
}

class CreatorA extends Creator {
  @override
  IProduct createProduct() {
    // ...
    return ProductA();
  }
}

class CreatorB extends Creator {
  @override
  IProduct createProduct() {
    // ...
    return ProductB();
  }
}

void main() {
  late IProduct product;
  if (1 < 2) {
    product = CreatorA().createProduct();
  } else {
    product = CreatorA().createProduct();
  }
  print(product.getPrice());
}
