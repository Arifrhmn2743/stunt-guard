// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';

// class ZScoreChart extends StatelessWidget {
//   final List<double> ages;
//   final List<double> heights;
//   final List<double> referenceLine;

//   const ZScoreChart({
//     super.key,
//     required this.ages,
//     required this.heights,
//     required this.referenceLine,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return LineChart(
//       LineChartData(
//         gridData: FlGridData(show: true),
//         titlesData: FlTitlesData(
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, _) {
//                 int index = value.toInt();
//                 if (index >= 0 && index < ages.length) {
//                   return Text("${ages[index].toStringAsFixed(0)} bln");
//                 } else {
//                   return const Text(""); // Atau bisa diisi placeholder lain
//                 }
//               },
//               interval: 1,
//             ),
//           ),
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(showTitles: true, reservedSize: 50),
//           ),
//           topTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               reservedSize: 30,
//               getTitlesWidget: (value, _) {
//                 return const Text("Grafik Z-Score",
//                     style: TextStyle(fontWeight: FontWeight.bold));
//               },
//             ),
//           ),
//         ),
//         borderData: FlBorderData(show: true),
//         lineBarsData: [
//           // Garis referensi
//           LineChartBarData(
//             spots: List.generate(
//               referenceLine.length,
//               (index) => FlSpot(index.toDouble(), referenceLine[index]),
//             ),
//             isCurved: true,
//             color: Colors.blue,
//             barWidth: 2,
//             dotData: FlDotData(show: false),
//           ),
//           // Data Anak
//           LineChartBarData(
//             spots: List.generate(
//               heights.length,
//               (index) => FlSpot(index.toDouble(), heights[index]),
//             ),
//             isCurved: false,
//             color: Colors.red,
//             barWidth: 4,
//             dotData: FlDotData(show: true),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../../database/list_data/list_pb_u.dart';

class ZScoreChart extends StatelessWidget {
  final List<Map<String, dynamic>> chartData;
  final int jenisKelamin;

  const ZScoreChart(
      {super.key, required this.chartData, required this.jenisKelamin});

  List<FlSpot> getMedianSpotsByGender(int jenkel) {
    // Filter data berdasarkan jenis kelamin
    List<Map<String, dynamic>> filteredList =
        panjangBadanList.where((data) => data['jenkel'] == jenkel).toList();

    // Buat FlSpot dari data yang difilter
    List<FlSpot> medianSpots = filteredList.map((data) {
      // Ubah umur jika umur == 241 menjadi 24
      double umur = data['umur'] == 241 ? 24.0 : data['umur'].toDouble();
      return FlSpot(
        umur,
        data['median'],
      );
    }).toList();

    // Urutkan medianSpots berdasarkan umur
    medianSpots.sort((a, b) => a.x.compareTo(b.x));

    return medianSpots;
  }

  @override
  Widget build(BuildContext context) {
    return LineChart(
        // LineChartData(
        //   gridData: FlGridData(show: true),
        //   titlesData: FlTitlesData(
        //     leftTitles: AxisTitles(
        //       sideTitles: SideTitles(showTitles: true, reservedSize: 30),
        //     ),
        //     bottomTitles: AxisTitles(
        //       sideTitles: SideTitles(showTitles: true, reservedSize: 30),
        //     ),
        //   ),
        //   borderData: FlBorderData(show: true),
        //   lineBarsData: _getLineBars(),
        //   minX: 40, // Batas minimum tinggi badan
        //   maxX: 130, // Batas maksimum tinggi badan
        //   minY: 0, // Batas minimum usia
        //   maxY: 60, // Batas maksimum usia
        // ),
        LineChartData(
      minX: 0, // Usia minimum dalam bulan
      maxX: 60, // Usia maksimum dalam bulan
      minY: 40, // Tinggi badan minimum (sesuai data median terendah)
      maxY: 130, // Tinggi badan maksimum (sesuai data median tertinggi)
      gridData: FlGridData(show: true),
      extraLinesData: ExtraLinesData(
        verticalLines: [
          VerticalLine(
            x: 24.0, // Posisi garis vertikal pada umur 24
            color: Colors.grey,
            strokeWidth: 2,
            dashArray: [
              10,
              5
            ], // Garis putus-putus, bisa dihapus jika ingin garis penuh
          ),
        ],
      ),
      titlesData: FlTitlesData(
        leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
        bottomTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: true, reservedSize: 30)),
      ),
      borderData: FlBorderData(show: true),
      lineBarsData: _getLineBars(),
    ));
  }

  List<LineChartBarData> _getLineBars() {
    List<FlSpot> medianSpots =
        getMedianSpotsByGender(jenisKelamin); // 1 untuk perempuan

// Urutkan medianSpots berdasarkan usia
    medianSpots.sort((a, b) => a.x.compareTo(b.x));

// Log hasil untuk verifikasi
    print("MedianSpots populated: $medianSpots");
    return [
      LineChartBarData(
        spots: List.generate(medianSpots.length, (index) => medianSpots[index]),
        isCurved: true, // Mengatur garis menjadi melengkung
        color: Colors.blue,
        barWidth: 3,
        isStrokeCapRound: true,
        belowBarData: BarAreaData(show: false),
        dotData: FlDotData(show: false),
      ),
      LineChartBarData(
        spots: chartData
            .map((data) => FlSpot(
                  data['umur'].toDouble(),
                  data['tb'],
                ))
            .toList(),
        isCurved: false,
        color: Colors.red,
        dotData: FlDotData(show: true),
        barWidth: 0,
      ),
    ];
  }
}
