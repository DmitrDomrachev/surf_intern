// Знает про коллекции List, Map, Set и назвал их отличия.
// Показал в коде, какими способами можно создать эти базовые коллекции.
// Показал в примере, какие конструкторы у них существуют.
// Знает отличие const коллекции от final.
// Создал одним из способов не изменяемую коллекцию (immutable) каждого из типа базовых коллекций.
// В примере использовал операторы spread ("..."), control flow и циклы внутри коллекций.
// В примере, использовав один метод, линейно преобразовал одну коллекции в другую (например, из List<String> в List<int>).
// В примере, использовав один метод, отфильтровал значения, опираясь на предикат (например, из списка List<int> получить только чётные числа).
// В примере, использовав один метод, проверил существует ли определённый элемент внутри коллекции.

//List - массив, Map - ассоциативный массив (ключ - значение), Set - множество
// const - неизменяемые коллекции, final - могут менять свое содержимое.

import 'dart:collection';

void main() {
  const List<String> myConstList = ['apple', 'banana', 'orange'];
  final myList = ['apple', 'banana', 'orange'];
  var myUnmodifiableList = UnmodifiableListView<String>(myList);
  const Map<String, int> myConstMap = {
    'apple': 1,
    'banana': 2,
    'orange': 3,
  };
  const Set<String> myConstSet = {'apple', 'banana', 'orange'};

  //spread
  final list1 = [3, 4, 5];
  final list2 = [1, 2, ...list1, 6, 7];

  for (var item in myConstSet){
    print(item);
  }

  final listString = list1.map((e) => '"$e"');
  print(listString);
  
  final listEven = list2.where((element) => element.isEven);
  print(listEven);

  print(list2.contains(1));
  print(list2.contains(9));


}
