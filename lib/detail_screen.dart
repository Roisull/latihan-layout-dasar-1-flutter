import 'package:flutter/material.dart';
import 'package:wisata_jombang/model/tourism_place.dart';

class DetailScreen extends StatefulWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  var oxygenTextStyle_14 = const TextStyle(fontFamily: 'Oxygen', fontSize: 14.0);

  var oxygenTextStyle_12 = const TextStyle(fontFamily: 'Oxygen', fontSize: 12.0);

  // late TourismPlace _place;
  // @override
  // void initState() {
  //   super.initState();
  //   _place = place;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(
                  widget.place.imageAsset
                ),
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back), 
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                        ),
                        const CircleAvatar(
                          backgroundColor: Colors.white,
                          child: FavoriteButton()
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.place.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  fontFamily: 'Staatliches',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      const Icon(Icons.calendar_today),
                      const SizedBox(height: 8.0,),
                      Text(
                        widget.place.openDays,
                        style: oxygenTextStyle_12,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(height: 8.0,),
                      Text(
                        widget.place.openTime,
                        style: oxygenTextStyle_12,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(height: 8.0,),
                      Text(
                        widget.place.ticketPrice,
                        style: oxygenTextStyle_12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              child: Text(
                widget.place.description,
                style: oxygenTextStyle_14,
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
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: widget.place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url),
                    ),
                  );
                }).toList(),
              ),
            ),
            const Center(
              child: Text('<< scroll >>',
              style: TextStyle(
                color: Colors.green,
              ),
              )
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  const FavoriteButton({super.key});

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border),
        color: Colors.red,
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
