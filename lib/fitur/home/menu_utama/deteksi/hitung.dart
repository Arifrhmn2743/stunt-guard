// double calculateZScore(double beratBadan, double median, double sdNeg3,
//     double sdNeg2, double sdNeg1, double sdPos1, double sdPos2, double sdPos3) {
//   if (beratBadan < median) {
//     // Berat badan di bawah median, pilih SD negatif yang sesuai
//     if (beratBadan < sdNeg3) {
//       print("neg3");
//       return (beratBadan - median) / (median - sdNeg3);
//     } else if (beratBadan < sdNeg2) {
//       print("neg2");

//       return (beratBadan - median) / (median - sdNeg2);
//     } else {
//       print("neg1");

//       return (beratBadan - median) / (median - sdNeg1);
//     }
//   } else {
//     // Berat badan di atas median, pilih SD positif yang sesuai
//     if (beratBadan > sdPos3) {
//       print("pos3");

//       return (beratBadan - median) / (sdPos3 - median);
//     } else if (beratBadan > sdPos2) {
//       print("pos2");

//       return (beratBadan - median) / (sdPos2 - median);
//     } else {
//       print("pos1");

//       return (beratBadan - median) / (sdPos1 - median);
//     }
//   }
// }

double calculateZScore(
    double tbAktual, double tbMedian, double sdNeg1, double sdPos1) {
  if (tbAktual > tbMedian) {
    print("tinggi");
    return (tbAktual - tbMedian) /
        (sdPos1 - tbMedian); // Z-Score untuk TB Aktual > TB Median
  } else {
    print("rendah");
    return (tbAktual - tbMedian) /
        (tbMedian - sdNeg1); // Z-Score untuk TB Aktual < TB Median
  }
}

String getZScoreCategory(double zScore) {
  if (zScore < -3) {
    return "Sangat Pendek (Severely Stunted)";
  } else if (zScore >= -3 && zScore < -2) {
    return "Pendek (Stunted)";
  } else if (zScore >= -2 && zScore <= 3) {
    return "Normal";
  } else if (zScore > 3) {
    return "Tinggi";
  } else {
    return "Unknown";
  }
}
