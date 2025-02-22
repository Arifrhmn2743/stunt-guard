import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final Uri _url1 =
      Uri.parse('https://evifebriyanti21.com/rumus-z-score-tb-u-pb-u/');
  Future<void> _launchUrl1() async {
    print("object");
    if (!await launchUrl(_url1)) {
      throw Exception('Could not launch $_url1');
    }
  }

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
              GestureDetector(
                onTap: () {
                  final imageProvider = Image.network(
                          "https://i0.wp.com/evifebriyanti21.com/wp-content/uploads/2021/10/Tabel-Blog-1.png?resize=1536%2C864&ssl=1")
                      .image;
                  showImageViewer(context, imageProvider,
                      onViewerDismissed: () {
                    print("dismissed");
                  });
                },
                child: Image.network(
                    "https://i0.wp.com/evifebriyanti21.com/wp-content/uploads/2021/10/Tabel-Blog-1.png?resize=1536%2C864&ssl=1"),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Sumber",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "1. Rumus Z-score TB/U & PB/U. oleh evifebriyanti ",
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                  text: "Tekan disini untuk melihat sumber.",
                  recognizer: TapGestureRecognizer()
                    ..onTap = () async {
                      await _launchUrl1();
                    },
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ])),
              SizedBox(
                height: 100,
              )
            ],
          ),
        ),
      ),
    );
  }
}
