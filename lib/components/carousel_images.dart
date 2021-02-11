import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:juventude_umadcac_app/components/dialog_full_scream.dart';
import 'package:juventude_umadcac_app/theme/style.dart';
import 'package:photo_view/photo_view.dart';

class CarouselImages extends StatefulWidget {
  final List<String> images;

  const CarouselImages({Key key, this.images}) : super(key: key);

  @override
  _CarouselImagesState createState() => _CarouselImagesState();
}

class _CarouselImagesState extends State<CarouselImages> {
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    return widget.images.length > 0
        ? Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                    pauseAutoPlayOnTouch: true,
                    autoPlayInterval: Duration(seconds: 5),
                    onPageChanged: (index, _) {
                      setState(() {
                        _current = index;
                      });
                    }),
                items: widget.images.map((item) => buildItem(item)).toList(),
              ),
              buildIndicators(),
            ],
          )
        : Container();
  }

  Widget buildItem(item) {
    return GestureDetector(
      onTap: () async {
        Navigator.of(context).push(DialogFullScream(buildPoupUp(item)));
        // await showDialog(context: context, builder: (_) => buildPoupUp(item));
      },
      child: Container(
        child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            child: Stack(
              children: <Widget>[
                Image.network(
                  item,
                  fit: BoxFit.cover,
                  width: 350.0,
                  height: 200.0,
                ),
              ],
            )),
      ),
    );
  }

  Widget buildIndicators() {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.images.map((url) {
          int index = widget.images.indexOf(url);
          return Container(
            width: 8.0,
            height: 8.0,
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _current == index ? activeIndicatorColor : indicatorColor,
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget buildPoupUp(image) {
    return Container(
      child: Stack(
        children: [
          PhotoView(
            backgroundDecoration:
                BoxDecoration(color: Colors.black.withAlpha(50)),
            minScale: 0.3,
            maxScale: 1.0,
            imageProvider: NetworkImage(image),
          ),
          Positioned(
              top: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    padding: EdgeInsets.only(
                        left: 20, bottom: 20, top: 10, right: 15),
                    decoration: BoxDecoration(
                        gradient: gradientApp,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(50))),
                    child: Icon(
                      Feather.x,
                      color: Colors.white,
                    )),
              ))
        ],
      ),
    );
  }
}
