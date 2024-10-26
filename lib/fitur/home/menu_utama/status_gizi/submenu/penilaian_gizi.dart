import 'package:flutter/material.dart';

class PenilaianGizi extends StatefulWidget {
  const PenilaianGizi({super.key});

  @override
  State<PenilaianGizi> createState() => _PenilaianGiziState();
}

class _PenilaianGiziState extends State<PenilaianGizi> {
  final List<String> ciriCiri = [
    "Penimbangan Berat Badan (BB) dan pengukuran Tinggi Badan (TB) ",
    "Penentuan umur anak berdasarkan bulan.",
    "Penilaian status gizi berdasarkan indeks tinggi badan menurut umur (TB/U)",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penilaian Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/menu.jpg'),
              const SizedBox(height: 20),
              ...ciriCiri.asMap().entries.map((entry) {
                int index = entry.key;
                String ciri = entry.value;
                return Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${index + 1}. ",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      SizedBox(
                        width: 2,
                      ),
                      Expanded(
                        child: Text(
                          ciri,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              SizedBox(
                height: 8,
              ),
              Image.asset("assets/images/zscore1.png"),
              SizedBox(
                height: 8,
              ),
              Image.asset("assets/images/zscore2.png"),
              SizedBox(
                height: 8,
              ),
              Text(
                "Keterangan:",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "+1 : Apabila TB Aktual > TB Median",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                "-1  : Apabila TB Aktual < TB Median",
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
