import 'package:easy_image_viewer/easy_image_viewer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Penatalaksanaan extends StatefulWidget {
  const Penatalaksanaan({super.key});

  @override
  State<Penatalaksanaan> createState() => _PenatalaksanaanState();
}

class _PenatalaksanaanState extends State<Penatalaksanaan> {
  final Uri _url1 = Uri.parse('https://bit.ly/3AFvN4L');
  Future<void> _launchUrl1() async {
    if (!await launchUrl(_url1)) {
      throw Exception('Could not launch $_url1');
    }
  }

  final Uri _url2 = Uri.parse('https://bit.ly/3DSsuZ2');
  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw Exception('Could not launch $_url2');
    }
  }

  final Uri _url3 = Uri.parse('https://bit.ly/423FSDQ');
  Future<void> _launchUrl3() async {
    if (!await launchUrl(_url3)) {
      throw Exception('Could not launch $_url3');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penatalaksanaan"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Upaya Kementrian PPN",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 12),
              Center(
                child: Text(
                  "1. Intervensi gizi spesifik",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/gizi-spesifik-1.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/gizi-spesifik-1.png')),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/gizi-spesifik-2.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/gizi-spesifik-2.png')),
              const SizedBox(height: 16),
              Center(
                child: Text(
                  "2. Intervensi gizi sensitif",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                  onTap: () {
                    final imageProvider =
                        Image.asset('assets/images/gizi-sensitif.png').image;
                    showImageViewer(context, imageProvider,
                        onViewerDismissed: () {
                      print("dismissed");
                    });
                  },
                  child: Image.asset('assets/images/gizi-sensitif.png')),
              const SizedBox(height: 10),
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
                    text: "1. Buku Saku Kader Pintar Cegah Stunting. ",
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                  text: "Tekan disini untuk melihat sumber.",
                  recognizer: TapGestureRecognizer()..onTap = () => _launchUrl1,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ])),

              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(),
              //       borderRadius: BorderRadius.circular(20),
              //       color: Theme.of(context).colorScheme.tertiary),
              //   child: ListTile(
              //     title: Text(
              //       "Pelajari lebih lanjut tentang pencegahan stunting dari Kementerian Kesehatan tahun 2021 – tekan di sini.",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     trailing: Icon(
              //       Icons.arrow_forward_ios,
              //       color: Colors.white,
              //     ),
              //     onTap: () {
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) {
              //       //   return WebviewLink();
              //       // }));
              //       _launchUrl1();
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text: "2. Peraturan Mentri PPN 1 tahun 2018. ",
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                  text: "Tekan disini untuk melihat sumber.",
                  recognizer: TapGestureRecognizer()..onTap = () => _launchUrl2,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ])),
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(),
              //       borderRadius: BorderRadius.circular(20),
              //       color: Theme.of(context).colorScheme.tertiary),
              //   child: ListTile(
              //     title: Text(
              //       "Pelajari lebih lanjut tentang peraturan menteri PPN tahun 2018 – tekan di sini.",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     trailing: Icon(
              //       Icons.arrow_forward_ios,
              //       color: Colors.white,
              //     ),
              //     onTap: () {
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) {
              //       //   return WebviewLink();
              //       // }));
              //       _launchUrl2();
              //     },
              //   ),
              // ),
              const SizedBox(height: 10),
              RichText(
                  text: TextSpan(children: <TextSpan>[
                TextSpan(
                    text:
                        "3. Pedoman Pelaksanaan Intervensi Penurunan Stunting Terintegrasi Di Kabupaten Kota. ",
                    style: const TextStyle(color: Colors.black)),
                TextSpan(
                  text: "Tekan disini untuk melihat sumber.",
                  recognizer: TapGestureRecognizer()..onTap = () => _launchUrl3,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                )
              ])),
              // Container(
              //   decoration: BoxDecoration(
              //       border: Border.all(),
              //       borderRadius: BorderRadius.circular(20),
              //       color: Theme.of(context).colorScheme.tertiary),
              //   child: ListTile(
              //     title: Text(
              //       "Pelajari lebih lanjut tentang pedoman pelaksanaan intervensi penurunan stunting – tekan di sini.",
              //       style: TextStyle(color: Colors.white),
              //     ),
              //     trailing: Icon(
              //       Icons.arrow_forward_ios,
              //       color: Colors.white,
              //     ),
              //     onTap: () {
              //       // Navigator.push(context,
              //       //     MaterialPageRoute(builder: (context) {
              //       //   return WebviewLink();
              //       // }));
              //       _launchUrl3();
              //     },
              //   ),
              // ),
              const SizedBox(height: 70),
            ],
          ),
        ),
      ),
    );
  }
}
