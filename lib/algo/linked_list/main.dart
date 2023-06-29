
import 'package:surf_intern/algo/linked_list/linked_list.dart';
import 'package:surf_intern/algo/linked_list/node.dart';

void main() {
  LinkedList list = LinkedList<int>();

  list.add(1);
  list.add(3);
  list.addFirst(0);
  list.addAfter(list.nodeAt(1)!, 2);

  print(list);

  // list.removeLast();
  // list.removeFirst();
  // print(list);

  // print(list.last);
  // print(list.first);
  // print(list.contains(-1));
  // print(list.contains(2));

  for (var e in list){
    print(e);
  }
}
