import 'package:flutter/material.dart';

class Pengertian extends StatefulWidget {
  const Pengertian({super.key});

  @override
  State<Pengertian> createState() => _PengertianState();
}

class _PengertianState extends State<Pengertian> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pengertian"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                "https://unair.ac.id/wp-content/uploads/2022/11/Ilustrasi-by-Ayo-Guru-Belajar.png",
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
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Stunting adalah masalah kurang gizi kronis yang disebabkan oleh asupan gizi yang kurang dalam waktu yang cukup lama akibat pemberian makanan yang tidak sesuai dengan kebutuhan gizi. Juga diartikan sebagai kondisi gagal tumbuh pada anak balita (bayi di bawah 5 tahun) akibat dari kekurangan gizi kronis sehingga anak terlalu pendek untuk usianya stunting.",
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
