// Лучшее время O(n log2 n), среднее время O(n log n), худшее - O(n^2)
// Время зависит от значения опорного эллемента.
// O(n log n) - затраты памяти


class QuickSort {
  static List<int> sort(List<int> list, int low, int high) {
    if (low < high) {
      int pi = _partition(list, low, high);
      sort(list, low, pi - 1);
      sort(list, pi + 1, high);
    }
    return list;
  }

  static int _partition(List<int> list, low, high) {
    if (list.isEmpty) {
      return 0;
    }
    int pivot = list[high];
    int i = low - 1;
    for (int j = low; j < high; j++) {
      if (list[j] < pivot) {
        i++;
        _swap(list, i, j);
      }
    }
    _swap(list, i + 1, high);
    return i + 1;
  }

  static void _swap(List list, int i, int j) {
    int temp = list[i];
    list[i] = list[j];
    list[j] = temp;
  }
}

//Сортировка пузырьком
//Лучшее время O(n), среднее время O(n^2), худшее - O(n^2). Память - O(1).

//Сортировка слиянием
//Время - O(n log n). Память - O(n).

//Сортировка кучей (подходит для стуктур с полседовательным дсотупом)
//Лучшее время O(n log n), среднее время O(n log n), O(n log n). Память - O(1).

