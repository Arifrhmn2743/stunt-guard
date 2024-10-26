import 'package:flutter/material.dart';

class PenangananGizi extends StatefulWidget {
  const PenangananGizi({super.key});

  @override
  State<PenangananGizi> createState() => _PenangananGiziState();
}

class _PenangananGiziState extends State<PenangananGizi> {
  final List<String> ciriCiri = [
    "Memberikan asi ekslusif",
    "Memenuhi asupan nutrisi dalam jumlah seimbang ",
    "Memberikan suplemen",
    "Memenuhi kebutuhan yodium",
    "Mengatasi kondisi medis tertentu"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penanganan Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset('assets/images/nutrisi.jpg'),
              SizedBox(
                height: 30,
              ),
              Text(
                "Cara Mengatasi Ketidakseimbangan Gizi atau Malnutrisi pada Anak",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
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
            ],
          ),
        ),
      ),
    );
  }
}
