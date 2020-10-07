import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'bmi_result.dart';

class InputBMI extends StatefulWidget {
  @override
  _InputBMIState createState() => _InputBMIState();
}

class _InputBMIState extends State<InputBMI> {
  int tinggi = 0;
  int berat = 0;
  String nama;
  String jk;
  DateTime tl = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: tl, // Refer step 1
      firstDate: DateTime(1950),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != tl)
      setState(() {
        tl = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFEFEFE),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 50, left: 30, right: 30),
              child: Image.asset(
                'images/bmi.jpg',
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              alignment: Alignment.center,
              child: Text(
                'Body Mass Index (BMI)',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Text(
                'Angka yang menjadi penilaian standar '
                'untuk menentukan apakah berat badan Anda '
                'tergolong normal, kurang, berlebih, atau obesitas.',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Text(
                'Nama',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              child: TextField(
                onChanged: (txt) {
                  setState(() {
                    nama = txt;
                  });
                },
                keyboardType: TextInputType.name,
                style: GoogleFonts.poppins(
                  fontSize: 18,
                ),
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.contacts),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  fillColor: Colors.white,
                  filled: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Text(
                'Jenis Kelamin',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              padding: EdgeInsets.only( right: 20, top: 5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all()),
              child: DropdownButtonFormField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(FontAwesomeIcons.transgender),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white10))),
                  isExpanded: true,
                  value: jk,
                  items: [
                    DropdownMenuItem(
                      child: Text("Laki-Laki"),
                      value: 'Laki-Laki',
                    ),
                    DropdownMenuItem(
                      child: Text("Perempuan"),
                      value: 'Perempuan',
                    ),
                  ],
                  onChanged: (value) {
                    setState(() {
                      jk = value;
                    });
                  }),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 50, right: 50),
              child: Text(
                'Tanggal Lahir',
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ),
            Container(
              height: 60,
              margin: EdgeInsets.only(left: 30, right: 30, top: 10),
              padding: EdgeInsets.only(left:10,right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all()),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    "${tl.toLocal()}".split(' ')[0],
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    width: 100,
                  ),
                  FlatButton(
                    onPressed: () => _selectDate(context), // Refer step 3
                    child: Icon(
                      Icons.arrow_drop_down,
                    ),
                    padding: EdgeInsets.only(left:66),
                  ),
                ],
              )
            ),
            Container(
                margin: EdgeInsets.only(top: 50, right: 30, left: 30),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Column(children: <Widget>[
                        Text(
                          'Tinggi (cm)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (txt) {
                            setState(() {
                              tinggi = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                              prefixIcon: Icon(Icons.accessibility_new),
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                              fillColor: Colors.white,
                              filled: true),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Expanded(
                      child: Column(children: <Widget>[
                        Text(
                          'Berat (kg)',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        TextField(
                          onChanged: (txt) {
                            setState(() {
                              berat = int.parse(txt);
                            });
                          },
                          keyboardType: TextInputType.number,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                          ),
                          decoration: InputDecoration(
                            prefixIcon: Icon(FontAwesomeIcons.weight),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            fillColor: Colors.white,
                            filled: true,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ]),
                    ),
                  ],
                )),
            Container(
              //height: double.infinity,
              margin: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 30),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BMIResult(
                            tinggi_badan: tinggi, berat_badan: berat, tanggal_lahir:tl, nama: nama, jenis_kelamin:jk )),
                  );
                },
                padding: EdgeInsets.only(top: 10, bottom: 10),
                color: Color(0xFF67CDDC),
                child: Text(
                  'Proses',
                  style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
