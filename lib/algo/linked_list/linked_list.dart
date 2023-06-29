import 'dart:math';

import 'package:surf_intern/algo/linked_list/node.dart';

class LinkedList<E> extends Iterable<E> {
  Node<E>? _head;
  Node<E>? _tail;

  E? get firstOrNull => _head?.value;

  E? get lastOrNull => _tail?.value;

  @override
  E get first {
    if (isEmpty) {
      throw StateError('No such element');
    }
    return _head!.value;
  }

  @override
  E get last {
    if (isEmpty) {
      throw StateError('No such element');
    }
    return _tail!.value;
  }

  @override
  bool get isEmpty => _head == null;

  Node<E>? nodeAt(int index) {
    var currentNode = _head;
    var currentIndex = 0;

    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.next;
      currentIndex += 1;
    }
    return currentNode;
  }

  @override
  String toString() {
    if (isEmpty) {
      return 'Empty LinkedList';
    } else {
      return _head.toString();
    }
  }

  void addFirst(E element) {
    _head = Node(value: element, next: _head);
    _tail ??= _head;
  }

  void add(E element) {
    if (isEmpty) {
      _head = Node(value: element);
      _tail = _head;
    } else {
      _tail!.next = Node(value: element);
      _tail = _tail!.next;
    }
  }

  void addAfter(Node<E> node, E value) {
    if (_tail == node) {
      add(value);
    }
    node.next = Node(value: value, next: node.next);
  }

  void removeFirst() {
    _head = _head?.next;
    if (isEmpty) {
      _tail == null;
    }
  }

  void removeLast() {
    if (_head?.next == null) return removeFirst();

    var currentNode = _head;
    while (currentNode!.next != _tail) {
      currentNode = currentNode.next;
    }

    _tail = currentNode;
    _tail!.next = null;
  }

  void removeAfter(Node<E> node) {
    if (node.next == _tail) {
      _tail = node;
    }
    node.next = node.next?.next;
  }

  @override
  Iterator<E> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<E> implements Iterator<E> {
  _LinkedListIterator(LinkedList<E> list) : _list = list;
  final LinkedList<E> _list;
  Node<E>? _currentNode;
  bool _firstPass = true;

  @override
  E get current => _currentNode!.value;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list._head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.next;
    }
    return _currentNode != null;
  }
}
