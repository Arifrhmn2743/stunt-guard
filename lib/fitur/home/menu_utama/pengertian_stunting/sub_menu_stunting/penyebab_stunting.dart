import 'package:flutter/material.dart';

class PenyebabStunting extends StatefulWidget {
  const PenyebabStunting({super.key});

  @override
  State<PenyebabStunting> createState() => _PenyebabStuntingState();
}

class _PenyebabStuntingState extends State<PenyebabStunting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penyebab Stunting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                "https://unair.ac.id/wp-content/uploads/2020/08/Stunting.jpg",
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, color: Colors.red, size: 50),
                        SizedBox(height: 8),
                        Text(
                          'Gambar gagal dimuat',
                          style: TextStyle(color: Colors.red),
                        ),
                      ],
                    ),
                  );
                },
              ),
              const SizedBox(height: 18),
              Text(
                "Penyebab Langsung:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 16, color: Colors.black87),
                  children: [
                    TextSpan(
                        text: "a) ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Faktor yang berhubungan dengan ketahanan pangan khususnya akses terhadap pangan bergizi (makanan).\n"),
                    TextSpan(
                        text: "b) ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Lingkungan sosial yang terkait dengan praktik pemberian makanan bayi dan anak (pengasuhan).\n"),
                    TextSpan(
                        text: "c) ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Akses terhadap pelayanan kesehatan untuk pencegahan dan pengobatan (kesehatan).\n"),
                    TextSpan(
                        text: "d) ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                        text:
                            "Kesehatan lingkungan yang meliputi tersedianya sarana air bersih dan sanitasi (lingkungan).\n"),
                    TextSpan(
                        text: "e) ",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    TextSpan(
                      text:
                          "Ibu hamil dengan konsumsi asupan gizi yang rendah dan mengalami penyakit infeksi akan melahirkan bayi dengan Berat Lahir Rendah (BBLR), dan/atau panjang badan bayi di bawah standar.\n",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "Penyebab Tidak Langsung:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Meliputi pendapatan dan kesenjangan ekonomi, perdagangan, urbanisasi, globalisasi, sistem pangan, jaminan sosial, sistem kesehatan, pembangunan pertanian, dan pemberdayaan perempuan.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
