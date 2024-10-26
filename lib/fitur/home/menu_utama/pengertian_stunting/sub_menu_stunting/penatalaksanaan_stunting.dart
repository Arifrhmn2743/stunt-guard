import 'package:flutter/material.dart';

class PenatalaksanaanStunting extends StatefulWidget {
  const PenatalaksanaanStunting({super.key});

  @override
  State<PenatalaksanaanStunting> createState() =>
      _PenatalaksanaanStuntingState();
}

class _PenatalaksanaanStuntingState extends State<PenatalaksanaanStunting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Penatalaksanaan Stunting"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/penata.jpg"),
              SizedBox(
                height: 30,
              ),
              // Section 1: Tatalaksana Gizi, Aktivitas Fisik, dan Lama Waktu Tidur
              Text(
                "Tatalaksana Gizi, Aktivitas Fisik, dan Lama Waktu Tidur",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Tatalaksana stunting dilakukan oleh dokter spesialis anak. Terdapat tiga aspek pada tatalaksananya, yaitu:",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              buildIndentedText(
                  "a) Tata laksana nutrisi dengan pemberian makan yang benar dan energi cukup (protein energy ratio, PER 10-15%)."),
              buildIndentedText(
                  "b) Jadwal tidur teratur dengan waktu tidur malam mulai pukul 21.00 untuk mencapai tidur dalam (deep sleep) pada pukul 23.00-03.00."),
              buildIndentedText(
                  "c) Olahraga/aktivitas fisik teratur paling tidak 30-60 menit, minimal 3-5 hari dalam seminggu."),

              // Section 2: Bayi Prematur/KMK
              const SizedBox(height: 18),
              Text(
                "Bayi Prematur/KMK",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Bayi prematur, khususnya bayi sangat prematur (usia gestasi <32 minggu) dan bayi berat lahir sangat rendah (<1500 gram) juga membutuhkan PKMK yang dapat meningkatkan kandungan protein dan mineral ASI yang disebut Human Milk Fortifier (HMF) dan susu formula prematur.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),

              // Section 3: Imunisasi pada Bayi/Anak Stunting
              const SizedBox(height: 18),
              Text(
                "Imunisasi pada Bayi/Anak Stunting",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Pemberian imunisasi pada kasus murni stunting, tidak ada kontraindikasi khusus. Anak yang stunting lebih rentan terhadap infeksi, sehingga pemenuhan vaksin sesuai dengan usia menjadi hal vital.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              const SizedBox(height: 8),
              const Text(
                "Ikuti PD3I (Penyakit yang Dapat Dicegah dengan Imunisasi). Pemberian BCG di awal kehidupan merupakan hal yang penting, serta vaksinasi Difteri-Tetanus-Pertusis (DTP)1 dan campak.",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),

              // Section 4: Stimulasi
              const SizedBox(height: 18),
              Text(
                "Stimulasi",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              buildIndentedText(
                  "a) Anak yang stunting biasanya juga mengalami keterlambatan perkembangan. Diperlukan rehabilitasi medis dan intervensi multidisiplin untuk menangani masalah ini."),
              buildIndentedText(
                  "b) Stimulasi diberikan sesuai dengan usia, ditambah dengan tata laksana gizi."),

              // Section 5: Penyakit Penyerta
              const SizedBox(height: 18),
              Text(
                "Penyakit Penyerta",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                "Jika anak yang stunting memiliki penyakit penyerta, akan diberikan pengobatan untuk penyakit tersebut (Kemenkes RI, 2022).",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildIndentedText(String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontSize: 16, color: Colors.black87),
      ),
    );
  }
}
