// import 'package:easy_image_viewer/easy_image_viewer.dart';
// import 'package:flutter/material.dart';
// import 'package:stunting_app/fitur/home/menu_utama/status_gizi/submenu/tabel/tabel_bbu.dart';

// class KlasifikasiGizi extends StatefulWidget {
//   const KlasifikasiGizi({super.key});

//   @override
//   State<KlasifikasiGizi> createState() => _KlasifikasiGiziState();
// }

// class _KlasifikasiGiziState extends State<KlasifikasiGizi> {
//   final bbU = Image.asset('assets/images/tabel_bbu.png').image;
//   final tbU = Image.asset('assets/images/tabel_tbu.png').image;
//   final bbPB = Image.asset('assets/images/tabel_bbpb.png').image;
//   final imtu = Image.asset('assets/images/tabel_imtu.png').image;
//   final imptu_2 = Image.asset('assets/images/tabel_imtu_2.png').image;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Klasifikasi Gizi"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             children: [
//               const Text(
//                 "Tabel Status Gizi Berdasarkan Indeks Berat Badan Menurut Umur (BB/U) Anak Usia 0 - 60 Bulan",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               // GestureDetector(
//               //     onTap: () {
//               //       showImageViewer(context, bbU, onViewerDismissed: () {
//               //         print("dismissed");
//               //       });
//               //     },
//               //     child: Image.asset('assets/images/tabel_bbu.png')),
//               BBUTable(),
//               const SizedBox(height: 20),
//               const Text(
//                 "Tabel Status Gizi Berdasarkan Indeks Tinggi Badan Menurut Umur (TB/U) Anak Usia 0 - 60 Bulan",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                   onTap: () {
//                     showImageViewer(context, tbU, onViewerDismissed: () {
//                       print("dismissed");
//                     });
//                   },
//                   child: Image.asset('assets/images/tabel_tbu.png')),
//               const SizedBox(height: 20),
//               const Text(
//                 "Tabel Status Gizi Berdasarkan Indeks Panjang Badan Menurut Tinggi Badan (BB/PB) Anak Usia 0 - 60 Bulan",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                   onTap: () {
//                     showImageViewer(context, bbPB, onViewerDismissed: () {
//                       print("dismissed");
//                     });
//                   },
//                   child: Image.asset('assets/images/tabel_bbpb.png')),
//               const SizedBox(height: 20),
//               const Text(
//                 "Tabel Status Gizi Berdasarkan Indeks Massa Tubuh Menurut Umur (IMT/U) Anak Usia 0 - 60 Bulan",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                   onTap: () {
//                     showImageViewer(context, imtu, onViewerDismissed: () {
//                       print("dismissed");
//                     });
//                   },
//                   child: Image.asset('assets/images/tabel_imtu.png')),
//               const SizedBox(height: 20),
//               const Text(
//                 "Tabel Status Gizi Berdasarkan Indeks Massa Tubuh Menurut Umur (IMT/U) Anak Usia 5 - 18 tahun",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 16),
//               GestureDetector(
//                   onTap: () {
//                     showImageViewer(context, imptu_2, onViewerDismissed: () {
//                       print("dismissed");
//                     });
//                   },
//                   child: Image.asset('assets/images/tabel_imtu_2.png')),
//               const SizedBox(height: 20),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class KlasifikasiGizi extends StatelessWidget {
  const KlasifikasiGizi({super.key});

  Widget buildTable(String title, List<TableRow> rows) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        Table(
          border: TableBorder.all(color: Colors.grey),
          columnWidths: const {
            0: FlexColumnWidth(2),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(1),
          },
          children: rows,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Klasifikasi Gizi"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildTable(
                "Tabel Status Gizi Berdasarkan Indeks Berat Badan Menurut Umur (BB/U) Anak Usia 0 - 60 Bulan",
                [
                  // Header
                  TableRow(
                    decoration: BoxDecoration(color: Colors.green[300]),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Indeks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kategori Status Gizi',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Ambang Batas Z-Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  // Data
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat badan sangat kurang'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('< -3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat badan kurang (underweight)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('< -3 SD s/d -2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Resiko berat badan lebih (overweight)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +1 SD'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildTable(
                "Tabel Status Gizi Berdasarkan Indeks Tinggi Badan Menurut Umur (TB/U) Anak Usia 0 - 60 Bulan",
                [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.blue[300]),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Indeks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Batas Z-Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tinggi Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Sangat Pendek (severely stunted)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('<-3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tinggi Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Pendek (stunted)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-3 SD sd -2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tinggi Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Normal'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-2 SD sd +3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tinggi Badan menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Tinggi'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('>+3 SD '),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Tambahkan lebih banyak tabel
              buildTable(
                "Tabel Status Gizi Berdasarkan Indeks Panjang Badan Menurut Tinggi Badan (BB/PB) Anak Usia 0 - 60 Bulan",
                [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.red[300]),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Indeks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Batas Z-Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Tinggi Badan'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Buruk (wasted)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('<-3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Tinggi Badan'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Kurang (thin)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-3 SD sd < -2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Tinggi Badan'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Baik (normal)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-2 SD sd +1 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Tinggi Badan'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berisiko berat badan lebih (overweight)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +1 SD s/d +2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Tinggi Badan'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Lebih (obese)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +2 SD s/d +3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Berat Badan menurut Tinggi Badan'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Obeesitas'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +3 SD'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildTable(
                "Tabel Status Gizi Berdasarkan Indeks Massa Tubuh Menurut Umur (IMT/U) Anak Usia 0 - 60 Bulan",
                [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.grey),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Indeks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Batas Z-Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Massa Tubuh menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Buruk (wasted)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('<-3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Massa Tubuh menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Kurang (thin)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-3 SD sd -2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Massa Tubuh menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Baik (normal)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-2 SD sd +1 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Massa Tubuh menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Beresiko berat badan lebih (overweight)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +1 SD s/d +2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Massa Tubuh menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Lebih (obese)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +2 SD s/d +3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Indeks Massa Tubuh menurut Umur'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Obesitas'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +3 SD'),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              buildTable(
                "Tabel Status Gizi Berdasarkan Indeks Massa Tubuh Menurut Umur (IMT/U) Anak Usia 5 - 18 tahun",
                [
                  TableRow(
                    decoration: BoxDecoration(color: Colors.blue[300]),
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Indeks',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Kategori',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Batas Z-Score',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Indeks Massa Tubuh menurut Umur anak usia 5-18 tahun'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Buruk (severely thinness)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('<-3 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Indeks Massa Tubuh menurut Umur anak usia 5-18 tahun'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Kurang (thinness)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-3 SD sd -2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Indeks Massa Tubuh menurut Umur anak usia 5-18 tahun'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Baik (normal)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('-2 SD sd +1 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Indeks Massa Tubuh menurut Umur anak usia 5-18 tahun'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Gizi Lebih (overweight)'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +1 SD s/d +2 SD'),
                      ),
                    ],
                  ),
                  TableRow(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                            'Indeks Massa Tubuh menurut Umur anak usia 5-18 tahun'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('Obesitas'),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text('> +2 SD'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
