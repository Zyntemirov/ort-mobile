import 'package:flutter/material.dart';
import 'package:ort_mobile/shared/utils/colors.dart';

class PhoneInputScreen extends StatefulWidget {
  @override
  _PhoneInputScreenState createState() => _PhoneInputScreenState();
}

class _PhoneInputScreenState extends State<PhoneInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.grey,
        appBar: AppBar(
          title: Text('Авторизация'),
          backgroundColor: AppColors.white,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('OРТ',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Text('Введите ваш номер телефона', style: TextStyle(fontSize: 18)),
            SizedBox(height: 20),
            Text('Введите ваш номер телефона', style: TextStyle(fontSize: 18)),
            TextField(
              decoration: InputDecoration(
                hintText: 'Номер телефона',
              ),
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Номер телефона',
              ),
            ),
          ],
        ));
  }
}
