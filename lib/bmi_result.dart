import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_ideal/about.dart';

class BMIResult extends StatelessWidget {
  BMIResult(
      {@required this.tinggi_badan,
      @required this.berat_badan,
      this.tanggal_lahir,
      this.jenis_kelamin,
      this.nama});

  final int tinggi_badan;
  final int berat_badan;
  final DateTime tanggal_lahir;
  final String jenis_kelamin;
  final String nama;

  @override
  Widget build(BuildContext context) {
    double bmi = berat_badan / pow(tinggi_badan / 100, 2);
    String cBMI;
    if (bmi >= 28)
      cBMI = "Status BMI: Obese";
    else if (bmi >= 23)
      cBMI = "Status BMI: Overweight";
    else if (bmi >= 17.5)
      cBMI = "Status BMI: Normal";
    else
      cBMI = "Status BMI: Underweight";

    DateTime currentDate = DateTime.now();
    int umur;
    umur = currentDate.year - tanggal_lahir.year;
    int bulan1 = currentDate.month;
    int bulan2 = tanggal_lahir.month;
    if (bulan2 > bulan1) {
      umur--;
    } else if (bulan1 == bulan2) {
      int hari1 = currentDate.day;
      int hari2 = tanggal_lahir.day;
      if (hari2 > hari1) {
        umur--;
      }
    }
    String umur_user = '$umur';

    return Scaffold(
      backgroundColor: Color(0xFFdcf8df),
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop()),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.contacts, color: Colors.black),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => about()));
            },
          ),
        ],
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(top: 50),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('$nama',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            SizedBox(
              height: 3,
            ),
            Text('$jenis_kelamin',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            SizedBox(
              height: 3,
            ),
            Text('Umur $umur_user tahun',
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
              child: Image.asset(
                'images/timbangan.png',
              ),
            ),
            Text(cBMI,
                style: GoogleFonts.poppins(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.red)),
            Text(bmi.toStringAsFixed(2),
                style: GoogleFonts.poppins(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.green)),
          ],
        ),
      ),
    );
  }
}
