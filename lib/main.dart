import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wisata Religi Jombang',
      theme: ThemeData(),
      home: const DetailScreen(),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: const Text(
                'Pondok Pesantren Denanyar',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0,),
                      Text('Daily Open'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.access_time),
                      SizedBox(height: 8.0,),
                      Text('09.00 - 20.00'),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.attach_money_outlined),
                      SizedBox(height: 8.0,),
                      Text('Free'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: const Text(
                'Terhitung satu abad yang lalu, tepatnya pada tahun 1917M. K.H.M Bishri Sansuri bersama istri beliau, Nyai Hj. Noor Khodijah, atas restu gurunya, K.H Hasyim Asyari, serta dorongan mertua beliau, K.H Hasbullah, mendirikan pesantren di Denanyar yang berjarak 2 Km dari arah barat kota Jombang.',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
