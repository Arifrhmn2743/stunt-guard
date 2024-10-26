import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/material.dart';

class KlasifikasiStunting extends StatefulWidget {
  const KlasifikasiStunting({super.key});

  @override
  State<KlasifikasiStunting> createState() => _KlasifikasiStuntingState();
}

class _KlasifikasiStuntingState extends State<KlasifikasiStunting> {
  final imageProvider =
      Image.asset('assets/images/tabel_klasifikasi.png').image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Klasifikasi Stunting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                  onTap: () {
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/tabel_klasifikasi.png'))
            ],
          ),
        ),
      ),
    );
  }
}
