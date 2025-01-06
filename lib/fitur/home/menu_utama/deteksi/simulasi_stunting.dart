import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stunting_app/custom_widget/button_bottom.dart';
import 'package:stunting_app/custom_widget/labeled_radio.dart';
import 'package:stunting_app/database/histori_db.dart';
import 'package:stunting_app/database/pb_u_db.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/hasil_deteksi.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/hitung.dart';

enum Jenkel { lakiLaki, perempuan }

class SimulasiStunting extends StatefulWidget {
  const SimulasiStunting({super.key});

  @override
  State<SimulasiStunting> createState() => _SimulasiStuntingState();
}

class _SimulasiStuntingState extends State<SimulasiStunting> {
  var jenkel = Jenkel.lakiLaki;
  final _formKey = GlobalKey<FormState>();

  var namaController = TextEditingController();
  var ttlController = TextEditingController();
  var umurController = TextEditingController();
  var bbController = TextEditingController();
  var tbController = TextEditingController();
  var lkController = TextEditingController();

  String? bbKategori;

  Future<void> findBeratBadanForUmur(int umur, double value, int jenKel) async {
    // Ambil data dari database berdasarkan umur dan jenis kelamin
    DatabasePBUHelper dbHelper = DatabasePBUHelper();

    // Gunakan await untuk menunggu hasil dari getBeratBadanByUmur
    var data = await dbHelper.getPanjangByUmur(umur, jenKel);

    // Cek jika data tidak null
    if (data != null) {
      double median = data['median']; // Mengakses nilai median dari hasil query
      double sdNeg1 = data['sd_neg_1'];
      double sdPos1 = data['sd_pos_1'];
      // Hitung dengan rumus

      double zScore = calculateZScore(value, median, sdNeg1, sdPos1);
      bbKategori = getZScoreCategory(zScore);

      // Tampilkan hasilnya
      print('Umur: $umur bulan');
      print('Jenis Kelamin: ${jenKel == 0 ? "Laki-laki" : "Perempuan"}');
      print('tinggi badan: $value cm');
      print('Nilai median: $median cm');
      // print('Nilai terdekat: $closest kg');
      print('Hasil perhitungan: $zScore');
      print('Hasil kategori: $bbKategori');
    } else {
      print(
          'Data tidak ditemukan untuk umur $umur bulan dan jenis kelamin ${jenKel == 0 ? "Laki-laki" : "Perempuan"}');
    }
  }

  void onSubmit() async {
    DatabaseHistory history = DatabaseHistory();
    if (namaController.text.isEmpty ||
        ttlController.text.isEmpty ||
        umurController.text.isEmpty ||
        bbController.text.isEmpty ||
        tbController.text.isEmpty) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Warning"),
              content: Text("Form isian harus diisi semua"),
              actions: [
                TextButton(
                  child: Text(
                    "Oke",
                    style: const TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    } else if (int.parse(umurController.text) > 60) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Warning"),
              content: Text("Tidak boleh lebih dari 60 bulan"),
              actions: [
                TextButton(
                  child: Text(
                    "Oke",
                    style: const TextStyle(color: Colors.black),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            );
          });
    } else {
      if (jenkel == Jenkel.lakiLaki) {
        if (umurController.text == "24") {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Tunggu"),
                  content: Text("Apakah anak diukur dalam keadaan BERDIRI?"),
                  actions: [
                    TextButton(
                      child: Text(
                        "Ya",
                        style: const TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        await findBeratBadanForUmur(
                            241, double.parse(tbController.text), 0);
                        await history.insertHistory(
                            namaController.text,
                            int.parse(umurController.text),
                            0,
                            ttlController.text,
                            double.parse(bbController.text),
                            double.parse(tbController.text),
                            bbKategori!);
                        pindahHalaman();
                      },
                    ),
                    TextButton(
                      onPressed: () async {
                        await findBeratBadanForUmur(
                            int.parse(umurController.text),
                            double.parse(tbController.text),
                            0);
                        await history.insertHistory(
                            namaController.text,
                            int.parse(umurController.text),
                            0,
                            ttlController.text,
                            double.parse(bbController.text),
                            double.parse(tbController.text),
                            bbKategori!);
                        pindahHalaman();
                      },
                      child: Text(
                        "Tidak",
                        style: TextStyle(color: Colors.red),
                      ),
                    )
                  ],
                );
              });
        } else {
          await findBeratBadanForUmur(int.parse(umurController.text),
              double.parse(tbController.text), 0);
          await history.insertHistory(
              namaController.text,
              int.parse(umurController.text),
              0,
              ttlController.text,
              double.parse(bbController.text),
              double.parse(tbController.text),
              bbKategori!);
          pindahHalaman();
        }
      } else {
        if (umurController.text == "24") {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Tunggu"),
                  content: Text("Apakah anak diukur dalam keadaan BERDIRI?"),
                  actions: [
                    TextButton(
                      child: Text(
                        "Ya",
                        style: const TextStyle(color: Colors.black),
                      ),
                      onPressed: () async {
                        await findBeratBadanForUmur(
                            241, double.parse(tbController.text), 1);
                        await history.insertHistory(
                            namaController.text,
                            int.parse(umurController.text),
                            1,
                            ttlController.text,
                            double.parse(bbController.text),
                            double.parse(tbController.text),
                            bbKategori!);
                        pindahHalaman();
                      },
                    ),
                    TextButton(
                        onPressed: () async {
                          await findBeratBadanForUmur(
                              int.parse(umurController.text),
                              double.parse(tbController.text),
                              1);
                          await history.insertHistory(
                              namaController.text,
                              int.parse(umurController.text),
                              1,
                              ttlController.text,
                              double.parse(bbController.text),
                              double.parse(tbController.text),
                              bbKategori!);
                          pindahHalaman();
                        },
                        child:
                            Text("Tidak", style: TextStyle(color: Colors.red)))
                  ],
                );
              });
        } else {
          await findBeratBadanForUmur(int.parse(umurController.text),
              double.parse(tbController.text), 1);
          await history.insertHistory(
              namaController.text,
              int.parse(umurController.text),
              1,
              ttlController.text,
              double.parse(bbController.text),
              double.parse(tbController.text),
              bbKategori!);
          pindahHalaman();
        }
      }
      // ignore: use_build_context_synchronously
    }
  }

  void pindahHalaman() {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HasilDeteksi(
        nama: namaController.text,
        kategori: bbKategori!,
      );
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deteksi"),
        centerTitle: true,
      ),
      body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                  child: Stack(
                children: [
                  Positioned.fill(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80),
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Masukkan Data Anak"),
                              const SizedBox(
                                height: 30,
                              ),
                              const Text("Nama Anak"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: namaController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text("Tempat, Tanggal Lahir Anak"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: ttlController,
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text("Jenis Kelamin Anak"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      LabeledRadio(
                                        padding: const EdgeInsets.all(0),
                                        label: "Laki-Laki",
                                        groupValue: jenkel,
                                        value: Jenkel.lakiLaki,
                                        onChanged: (Jenkel newValue) {
                                          setState(() {
                                            jenkel = newValue;
                                          });
                                        },
                                      ),
                                      LabeledRadio(
                                        padding: const EdgeInsets.all(0),
                                        label: "Perempuan",
                                        groupValue: jenkel,
                                        value: Jenkel.perempuan,
                                        onChanged: (Jenkel newValue) {
                                          setState(() {
                                            jenkel = newValue;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text("Umur Anak (Dalam Bulan)"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: umurController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(2),
                                  ],
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text("Berat Badan Anak"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: bbController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(5),
                                  ],
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              const Text("Tinggi Badan Anak"),
                              const SizedBox(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondaryContainer,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: TextFormField(
                                  controller: tbController,
                                  keyboardType: TextInputType.number,
                                  inputFormatters: [
                                    LengthLimitingTextInputFormatter(5),
                                  ],
                                  decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                      disabledBorder: InputBorder.none,
                                      contentPadding: EdgeInsets.only(
                                          left: 15,
                                          bottom: 11,
                                          top: 11,
                                          right: 15)),
                                ),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ButtonBottomForm(
                        isLoading: false,
                        title: "Cek Kondisi Anak",
                        onTap: () {
                          onSubmit();
                        },
                        isActive: true,
                        // isLoading: _isLoading.value,
                      ),
                    ),
                  )
                ],
              ))
            ],
          )),
    );
  }
}
