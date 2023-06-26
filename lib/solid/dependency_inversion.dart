//Зависеть не от реализаций, а от абстракций. Это позволит легко расширять систему.

class Application {
  final IService service;

  Application(this.service);

  void logic() {
    // ...
    service.doSomeone();
    // ...
  }
}

abstract interface class IService {
  void doSomeone();
}

class Service1 implements IService {
  @override
  void doSomeone() {
    print('service1 work');
  }
}

class Service2 implements IService {
  @override
  void doSomeone() {
    print('service2 work');
  }
}

void main() {
  var application = Application(Service1());
  application.logic();
  application = Application(Service2());
  application.logic();
}
