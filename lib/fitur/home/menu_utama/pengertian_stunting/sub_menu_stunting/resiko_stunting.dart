import 'package:flutter/material.dart';

class ResikoStunting extends StatefulWidget {
  const ResikoStunting({super.key});

  @override
  State<ResikoStunting> createState() => _ResikoStuntingState();
}

class _ResikoStuntingState extends State<ResikoStunting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Risiko Stunting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.network(
                "https://res.cloudinary.com/dk0z4ums3/image/upload/v1657531269/attached_image/stunting-0-alodokter.jpg",
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
              SizedBox(
                height: 20,
              ),
              Text(
                "Risiko Jangka Pendek:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Stunting menyebabkan gagal tumbuh, hambatan perkembangan kognitif dan motorik, dan tidak optimalnya ukuran fisik tubuh serta gangguan metabolisme",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "Risiko Jangka Panjang:",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Stunting menyebabkan menurunnya kapasitas intelektual. Selain itu, kekurangan gizi juga menyebabkan gangguan pertumbuhan (pendek dan atau kurus) dan meningkatkan risiko penyakit tidak menular seperti diabetes mellitus, hipertensi, jantung kroner, dan stroke",
                style: TextStyle(fontSize: 16, color: Colors.black87),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
