//1) Пояснил, зачем языку нужна концепция null.
//2) Назвал причины, почему dart решил поменять подход работы с null, и перейти на nullSafety.
//3) Описал Null, как тип, и указал его место в иерархии типов.
//4) В описании оперировал такими понятиями как: top/bottom-type.
//5) Сравнил типы/объекты Null, null, Never, void и назвал места, в которых стоит их использовать.
//6) Знает и использовал синтаксис nullSafety, в примере с кодом:
//7) MyObject?, .? , !, .!, ??.
//8) Null-типы в generic.
//9) Работа с null в Map

//    До NS ве классы были наследниками Object, а Null был ребенком всех классов.
//  Это означало, что люой класс мог содержать значение null. Например, мы могли сложить два числа.
//  Если одно из них было null, то мы получали ошибку в рантайме.
//  Статический анализатор не находил эту ошибку, так как Null ребенок num,
//  а значит, должен поддерживать его операции.
//  В обновлении NS тип Null перестал быть подтипом всех типов, язык получил возможность гарантировать,
//  что тип, который разработчик не указал как обнуляемый, никогда не получит знчение null.

//5)  Null - тип, null - литерал,
// Never - подтип все типов, функция никогда не будет завершена, void - функция не возвращает значение.

//7)    MyObject? - не имеет методов и полей MyObject
//        /\
//       /  \
//  MyObject  Null
// .? попробует вызвать метод у nullable объекта, может вернуть null
// ! - указывает что nullable объект не Null, может вызвать исключение
// .! как .?, но вызывает исключение, вместо возварата null
// null ?? defaultValue == defaultValue
//8) С generic работатет как с остальными объектами.

class Box<T> {
  T? value;
  Box(this.value);
}

void main() {
  Box<int> box1 = Box(10);
  Box<int?> box2 = Box(null);

  print(box1.value); // 10
  print(box2.value); // null


  Map<String, int?> scores = {'John': null, 'Sarah': 85};

  int? johnScore = scores['John'];
  if (johnScore != null) {
    print('John\'s score: $johnScore');
  } else {
    print('John didn\'t take the test');
  }

  if (scores.containsKey('John')) {
    print('John\'s score: ${scores['John']}');
  } else {
    print('John didn\'t take the test');
  }

  for (var entry in scores.entries) {
    var key = entry.key;
    var value = entry.value;
    print('$key: ${value?.toString() ?? 'N/A'}');
  }
}
