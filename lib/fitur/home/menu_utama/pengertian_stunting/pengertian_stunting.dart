import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PengertianStunting extends StatefulWidget {
  const PengertianStunting({super.key});

  @override
  State<PengertianStunting> createState() => _PengertianStuntingState();
}

class _PengertianStuntingState extends State<PengertianStunting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stunting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.asset("assets/images/stunting.jpg"),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Icons.question_mark),
                        title: Text("Pengertian"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Symbols.genetics),
                        title: Text("Klasifikasi"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Symbols.sick),
                        title: Text("Penyebab"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Symbols.visibility),
                        title: Text("Tanda Gejala"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Symbols.dangerous),
                        title: Text("Risiko"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Symbols.shield),
                        title: Text("Pencegahan"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        leading: Icon(Symbols.medical_services),
                        title: Text("Penatalaksanaan"),
                        trailing: Icon(Icons.arrow_forward_ios),
                        onTap: () {
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) {
                          //   return const HistorySimulasi();
                          // }));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
