// Программные сущности должны быть открыты для расширения и закрыты для изменения

extension on String {
  String toJsonWithDate() {
    final date = DateTime.now();
    return '{value: $this, date: ${date.toString()}}';
  }
}

void main() {
  final String str = 'text';
  print(str.toJsonWithDate());
}
