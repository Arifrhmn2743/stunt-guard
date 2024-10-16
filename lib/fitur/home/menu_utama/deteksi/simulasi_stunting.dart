import 'package:flutter/material.dart';
import 'package:stunting_app/custom_widget/button_bottom.dart';
import 'package:stunting_app/fitur/home/menu_utama/deteksi/hasil_deteksi.dart';
import 'package:stunting_app/custom_widget/labeled_radio.dart';

enum Jenkel { lakiLaki, perempuan }

class SimulasiStunting extends StatefulWidget {
  const SimulasiStunting({super.key});

  @override
  State<SimulasiStunting> createState() => _SimulasiStuntingState();
}

class _SimulasiStuntingState extends State<SimulasiStunting> {
  var jenkel = Jenkel.lakiLaki;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Deteksi & Penatalaksanaan"),
        centerTitle: true,
      ),
      body: Form(
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
                          const Text("Lingkar Kepala / Lingkar Lengan Anak"),
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
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HasilDeteksi();
                      }));
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
