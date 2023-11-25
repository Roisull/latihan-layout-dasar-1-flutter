import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Image.asset(
              'assets/images/banner_pondok.jpeg',
            ),
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
                      Text('Rp 25.000'),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              child: const Text(
                'Terhitung satu abad yang lalu, tepatnya pada tahun 1917M. K.H.M Bishri Sansuri bersama istri beliau, Nyai Hj. Noor Khodijah, atas restu gurunya, K.H Hasyim Asyari, serta dorongan mertua beliau, K.H Hasbullah, mendirikan pesantren di Denanyar yang berjarak 2 Km dari arah barat kota Jombang.',
                textAlign: TextAlign.center,
              ),
            ),
            // Image.network(
            //   'https://cdn.timesmedia.co.id/images/2020/10/03/Pondok-Pesantren-Mambaul-Maarif.jpg'
            // ),
            // const SizedBox(height: 10.0),
            // Image.network(
            //   'https://storage.nu.or.id/storage/post/16_9/mid/1600849777.jpg'
            // ),
            SizedBox(
              height: 250,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      child: Image.network(
                          'https://cdn.timesmedia.co.id/images/2021/02/09/KH-Abdussalam-Shokhib.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      child: Image.network(
                          'https://www.laduni.id/panel/themes/default/uploads/post/400x250/15D-Anyar.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(30.0)),
                      child: Image.network(
                          'https://faktualnews.co/images/2020/07/ponpes-denanyar-jombang.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            const Center(child: Text('<< scroll >>')),
          ],
        ),
      ),
    );
  }

}
