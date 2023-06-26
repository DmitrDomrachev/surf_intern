// Программные сущности должны быть открыты для расширения и закрыты для изменения

//У нас есть некий контроллер, одной из функций которого является вывод информации.
//В случае, если нам понадобится изменить способ вывода информации,
// мы сможем написать другой класс, реализующий интерфейс IPresenter.
// Так мы добавить функционал, не внося изменения в существующий класс

//upd:подумал и понял, что это тоже DIP. Понимаю, что OCP более широкий принцип,
// но не могу придумать OCP без DIP

class Controller {
  final IPresenter presenter;

  Controller(this.presenter);

  //...
  drawEntities() {}
//...
}

abstract interface class IPresenter {
  draw();
}

class ConsolePresenter implements IPresenter {
  void _sendToConsole() {}

  @override
  draw() {
    _sendToConsole();
  }
}
