import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:juventude_umadcac_app/components/custom_app_bar.dart';
import 'package:juventude_umadcac_app/utils/imagens.dart';
import 'package:latlong/latlong.dart';

class LocalScreen extends StatefulWidget {
  @override
  _LocalScreenState createState() => _LocalScreenState();
}

class _LocalScreenState extends State<LocalScreen> {
  List<LatLng> latlngList = List<LatLng>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: 'LOCAIS',
      ),
      body: Center(
        child: FlutterMap(
          options: MapOptions(
            center: LatLng(-23.646219, -46.664337),
            zoom: 14.0,
          ),
          layers: [
            TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/janilso/ckl19tydi09g517qvilh8n28t/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiamFuaWxzbyIsImEiOiJja2c3NjB2cXQwNDYzMnprYzdsYjNmZGhrIn0.VoGxX0DJkSSMoVRnJi8naA",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiamFuaWxzbyIsImEiOiJja2c3NjB2cXQwNDYzMnprYzdsYjNmZGhrIn0.VoGxX0DJkSSMoVRnJi8naA',
                'id': 'mapbox.streets',
              },
            ),
            MarkerLayerOptions(
              markers: [
                Marker(
                  width: 50.0,
                  height: 50.0,
                  point: LatLng(-23.646219, -46.664337),
                  builder: (ctx) => Container(
                    child: Image.asset(ImagesAssets.imgMarker),
                  ),
                  // builder: (ctx) => Container(
                  //   child: Image.asset(ImagesAssets.imgMarker),
                  // ),
                )
              ],
            ),
            // PolylineLayerOptions(polylines: [
            //   Polyline(
            //     points: latlngList,
            //     // isDotted: true,
            //     color: Color(0xFF669DF6),
            //     strokeWidth: 3.0,
            //     borderColor: Color(0xFF1967D2),
            //     borderStrokeWidth: 0.1,
            //   )
            // ])
          ],
        ),
      ),
    );
  }
}
