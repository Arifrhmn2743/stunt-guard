import 'package:flutter/material.dart';

class HistorySimulasi extends StatefulWidget {
  const HistorySimulasi({super.key});

  @override
  State<HistorySimulasi> createState() => _HistorySimulasiState();
}

class _HistorySimulasiState extends State<HistorySimulasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("History Simulasi"),
        centerTitle: true,
      ),
    );
  }
}
