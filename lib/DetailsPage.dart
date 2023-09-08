import 'package:flutter/material.dart';
import 'package:hero_animation/HomePage.dart';

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: person.name,
          flightShuttleBuilder: (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                  color: Colors.transparent,
                  child: toHeroContext.widget,
                );
              case HeroFlightDirection.pop:
                return Material(
                  color: Colors.transparent,
                  child: fromHeroContext.widget,
                );
            }
          },
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 40),
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: double.infinity, height: 20),
          Text(
            person.name,
            style: const TextStyle(fontSize: 18),
          ),
          const SizedBox(width: double.infinity, height: 30),
          Text(
            "${person.age} years old",
            style: const TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
