// Объяснил концепт Stream в языке и объяснил зачем он нужен.
// Назвал разницу между Future и Stream, и когда стоит использовать тот или другой концепт.
// Знает отличие Stream и StreamController. Создал и настроил взаимодействие между ними в примере.
// Умеет обрабатывать ошибки и показал это на примере.
// Объяснил, зачем нужно закрывать Stream.
// Знает про два типа подписок Stream.
// Объяснил разницу между ними.
// Реализовал их создание в коде.
// Знает про ValueNotifier и рассудил, когда стоит использовать его, а не Stream.


// Stream - асинхронных поток данных, передающий пользовательские события и данные, прочитанные из файла.
// Потоки можно прослушать, используя await for или .listen(), у них есть система обработки данных,
// потоки бывают для одного слушателя и для нескольких

// future - для единоразового аснихронного выполнения функции и возвращения значения
// stream - для услонвно бескогечного, постоянного обмена данными (аналог websocket?)
// StreamController - класс для создания и управления Stream. С его помощью мы можем
// управлять состоянием стрима, уведомлять подписчиков, генерировать события.
// Закрываем стримы чтобы освободить ресурсы и оповестить слушателей
// Single subscription стримы имеют одного подписчика, гарантируют, что слушатель получит все данные
// Broadcast стримы могут иметь несколько подписчиков, слушатели получают только те данне,
//  которые были отправлены после их подписки

// ValueNotifier следует использовать в простых случаях,
// когда требуется немедленное обновление значения, и количество подписчиков ограничено.
// Stream более подходит для асинхронного доступа к значениям или сохранения истории

import 'dart:async';

void main() {
  StreamController<String> streamController = StreamController<String>();

  Stream<String> stream = streamController.stream;

  StreamSubscription subscription = stream.listen(
        (data) {
      print('Получено: $data');
    },
    onError: (error) {
      print('Ошибка: $error');
    },
    onDone: () {
      print('Поток завершен');
    },
  );

  streamController.sink.add('Привет');
  streamController.sink.addError('Ошибка в потоке');
  streamController.sink.add('Мир');

  Future.delayed(Duration(seconds: 1), () {
    streamController.close();
    // subscription.cancel();
  });


  // У меня не flutter проект, поэтому код не запустится. Но вроде, должно работать
  // final valueNotifier = ValueNotifier<int>(0);
  // final listener = () {
  //   print('Значение изменено: ${valueNotifier.value}');
  // };
  // valueNotifier.addListener(listener);
  // valueNotifier.value = 10;  // Вызовет функцию listener
  // valueNotifier.removeListener(listener);
}