import 'package:flutter/material.dart';
import 'bmi.dart';

void main() => runApp(
    MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF67CDDC),),
      debugShowCheckedModeBanner: false,
      home:  InputBMI(),
    )

);