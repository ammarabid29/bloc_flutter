import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class EquatableTesting extends StatefulWidget {
  const EquatableTesting({super.key});

  @override
  State<EquatableTesting> createState() => _EquatableTestingState();
}

class _EquatableTestingState extends State<EquatableTesting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Person person1 = const Person(name: 'John', age: 30);
          Person person2 = const Person(name: 'John', age: 30);

          debugPrint(person1.hashCode.toString());
          debugPrint(person2.hashCode.toString());
          // Without Equatable, the following would print false
          print((person1 == person2)); // true, because Equatable is used
        },
      ),
    );
  }
}

// Equatable allows you to compare objects based on their properties
class Person extends Equatable {
  final String name;
  final int age;
  const Person({required this.name, required this.age});

  @override
  List<Object?> get props => [name, age];
}
