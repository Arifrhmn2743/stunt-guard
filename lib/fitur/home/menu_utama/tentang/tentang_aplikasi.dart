import 'package:flutter/material.dart';

class TentangAplikasi extends StatefulWidget {
  const TentangAplikasi({super.key});

  @override
  State<TentangAplikasi> createState() => _TentangAplikasiState();
}

class _TentangAplikasiState extends State<TentangAplikasi> {
  final List<String> ciriCiri = [
    "Untuk memfasilitasi identifikasi dan intervensi tepat waktu untuk stunting pada anak-anak berusia 0-59 bulan.",
    "Memanfaatkan teknologi untuk meningkatkan kesadaran orang tua dan pemantauan kesehatan",
    "Untuk memanfaatkan kecerdasan buatan dan antarmuka yang ramah pengguna untuk memudahkan proses deteksi, memastikan bahwa anak-anak berusia 0-59 bulan menerima dukungan nutrisi yang diperlukan segera."
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tentang Aplikasi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Pengertian",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "APEDIS merupakan aplikasi android yang dirancang untuk memantau dan mengidentifikasi stunting pada anak-anak berusia 0-59 bulan. Aplikasi ini memanfaatkan teknologi canggih, termasuk kecerdasan buatan dan berbagai alat pengukuran, untuk memfasilitasi deteksi dini stunting, sehingga memungkinkan intervensi tepat waktu",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Tujuan",
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
                            fontSize: 18,
                            color: Colors.black87,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 20),
              Text(
                "Penyusun Aplikasi ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Gita Wulandari Mahasiswa Keperawatan S1",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              const Text(
                "Ns. Tina Muzaenah, S. Kep,. M. Kep.",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
