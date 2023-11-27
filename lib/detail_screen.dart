import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:wisata_jombang/model/tourism_place.dart';

class DetailScreen extends StatefulWidget {
  final TourismPlace place;
  const DetailScreen({super.key, required this.place});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  var oxygenTextStyle_14 =
      const TextStyle(fontFamily: 'Oxygen', fontSize: 14.0);

  var oxygenTextStyle_12 =
      const TextStyle(fontFamily: 'Oxygen', fontSize: 12.0);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 800) {
          return DetailWebPage(
            widget: widget,
            oxygenTextStyle_12: oxygenTextStyle_12,
            oxygenTextStyle_14: oxygenTextStyle_14,
          );
        } else {
          return DetailMobilePage(
            widget: widget,
            oxygenTextStyle_12: oxygenTextStyle_12,
            oxygenTextStyle_14: oxygenTextStyle_14,
          );
        }
      },
    );
  }
}

class DetailMobilePage extends StatefulWidget {
  const DetailMobilePage({
    super.key,
    required this.widget,
    required this.oxygenTextStyle_12,
    required this.oxygenTextStyle_14,
  });

  final DetailScreen widget;
  final TextStyle oxygenTextStyle_12;
  final TextStyle oxygenTextStyle_14;

  @override
  State<DetailMobilePage> createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: [
                Image.asset(widget.widget.place.imageAsset),
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
                            child: FavoriteButton())
                      ],
                    ),
                  ),
                )
              ],
            ),
            Container(
              margin: const EdgeInsets.only(top: 16.0),
              child: Text(
                widget.widget.place.name,
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
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.widget.place.openDays,
                        style: widget.oxygenTextStyle_12,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.access_time),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.widget.place.openTime,
                        style: widget.oxygenTextStyle_12,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      const Icon(Icons.attach_money_outlined),
                      const SizedBox(
                        height: 8.0,
                      ),
                      Text(
                        widget.widget.place.ticketPrice,
                        style: widget.oxygenTextStyle_12,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding:
                  const EdgeInsets.only(left: 24.0, right: 24.0, bottom: 24.0),
              child: Text(
                widget.widget.place.description,
                style: widget.oxygenTextStyle_14,
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
                children: widget.widget.place.imageUrls.map((url) {
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
                child: Text(
              '<< scroll >>',
              style: TextStyle(
                color: Colors.green,
              ),
            )),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  const DetailWebPage({
    super.key,
    required this.widget,
    required this.oxygenTextStyle_12,
    required this.oxygenTextStyle_14,
  });

  final DetailScreen widget;
  final TextStyle oxygenTextStyle_12;
  final TextStyle oxygenTextStyle_14;

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  final _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: kIsWeb ? null : AppBar(),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 16,
              horizontal: 64,
            ),
            child: SizedBox(
              width: screenWidth <= 1200 ? 800 : 1200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const Text(
                    'Wisata Jombang',
                    style: TextStyle(
                      fontSize: 32,
                      fontFamily: 'Staatliches',
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child:
                                  Image.asset(widget.widget.place.imageAsset),
                            ),
                            Scrollbar(
                              controller: _scrollController,
                              child: Container(
                                height: 150,
                                padding: const EdgeInsets.only(bottom: 16),
                                child: ListView(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  children:
                                      widget.widget.place.imageUrls.map((url) {
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
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 32),
                      Expanded(
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: <Widget>[
                                Text(
                                  widget.widget.place.name,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 30.0,
                                    fontFamily: 'Staatliches',
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: <Widget>[
                                        const Icon(Icons.calendar_today),
                                        const SizedBox(
                                          height: 8.0,
                                        ),
                                        Text(
                                          widget.widget.place.openDays,
                                          style: widget.oxygenTextStyle_12,
                                        ),
                                      ],
                                    ),
                                    const FavoriteButton()
                                  ],
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.access_time),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      widget.widget.place.openTime,
                                      style: widget.oxygenTextStyle_12,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Row(
                                  children: <Widget>[
                                    const Icon(Icons.monetization_on),
                                    const SizedBox(
                                      height: 8.0,
                                    ),
                                    Text(
                                      widget.widget.place.ticketPrice,
                                      style: widget.oxygenTextStyle_12,
                                    ),
                                  ],
                                ),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 16.0),
                                  child: Text(
                                    widget.widget.place.description,
                                    textAlign: TextAlign.justify,
                                    style: const TextStyle(
                                      fontSize: 16.0,
                                      fontFamily: 'Oxygen',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
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
      icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
      color: Colors.red,
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
