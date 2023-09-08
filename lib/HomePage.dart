import 'package:flutter/material.dart';
import 'package:hero_animation/DetailsPage.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Person> persons = [
    Person(age: 20, emoji: "🧙🏽‍♂", name: "Ahmed"),
    Person(age: 15, emoji: "🦔", name: "Mohamed"),
    Person(age: 52, emoji: "🙋🏽‍♂", name: "Hemdan"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("People"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: persons.length,
        itemBuilder: (context, index) {
          final person = persons[index];
          return ListTile(
            leading: Hero(
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            title: Text(person.name),
            subtitle: Text("${person.age} years old"),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DetailsPage(
                    person: person,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class Person {
  String name;
  String emoji;
  int age;
  Person({
    required this.age,
    required this.emoji,
    required this.name,
  });
}
