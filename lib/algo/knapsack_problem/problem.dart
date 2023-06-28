import 'dart:math';

//Полный перебор - O(n^2 * n)
// n^2 - перебор, n - суммы

//Динамичческое программирование - O(n^2)

class Item {
  int weight;
  int value;

  Item(this.weight, this.value);
}

int knapsackProblem(List<Item> items, int volume) {
  List<List<int>> tables =
      List.generate(items.length + 1, (_) => List.filled(volume + 1, 0));

  for (int i = 1; i <= items.length; i++) {
    Item currentItem = items[i - 1];
    for (int j = 1; j <= volume; j++) {
      if (currentItem.weight > j) {
        tables[i][j] = tables[i - 1][j];
      } else {
        tables[i][j] = max(tables[i - 1][j],
            currentItem.value + tables[i - 1][j - currentItem.weight]);
      }
    }
  }

  return tables[items.length][volume];
}

void main() {
  List<Item> items = [
    Item(2, 100),
    Item(5, 50),
    Item(10, 90),
    Item(6, 50),
  ];

  print(knapsackProblem(items, 12));
}
