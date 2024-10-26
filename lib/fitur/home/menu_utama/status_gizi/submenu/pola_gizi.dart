import 'package:flutter/material.dart';

class PolaGizi extends StatefulWidget {
  const PolaGizi({super.key});

  @override
  State<PolaGizi> createState() => _PolaGiziState();
}

class _PolaGiziState extends State<PolaGizi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pola Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset("assets/images/baby_food.png"),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Pola makan yang lengkap untuk balita adalah 3 kali makan lengkap (nasi, lauk pauk hewani dan nabati, sayur dan buah), 2 kali makanan selingan berupa buah, kue atau minuman, dan 2-3 kali minum (Kemenkes RI, 2019) ",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              )
            ],
          ),
        ),
      ),
    );
  }
}
