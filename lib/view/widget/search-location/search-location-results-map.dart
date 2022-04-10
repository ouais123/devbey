import 'package:devbey/model/item-search.dart';
import 'package:devbey/view/custom/adaptable-text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import "package:latlong2/latlong.dart" as latLng;

class SearchLocationResultsMap extends StatelessWidget {
  const SearchLocationResultsMap({Key? key, required this.itemSearch})
      : super(key: key);
  final ItemSearch itemSearch;
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        center: latLng.LatLng(
          double.parse(itemSearch.latitude),
          double.parse(itemSearch.longitude),
        ),
        minZoom: 1,
        maxZoom: 18,
        zoom: 10.0,
      ),
      layers: [
        TileLayerOptions(
          urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
          subdomains: ['a', 'b', 'c'],
          attributionBuilder: (_) {
            return Container(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: AdaptableText(
                  itemSearch.timezone,
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            );
          },
        ),
        MarkerLayerOptions(markers: [
          Marker(
            point: latLng.LatLng(
              double.parse(itemSearch.latitude),
              double.parse(itemSearch.longitude),
            ),
            builder: (ctx) => InkWell(
              onTap: () {},
              child: Icon(
                Icons.location_pin,
                color: Colors.red,
                size: 40.sp,
              ),
            ),
          ),
        ]),
      ],
    );
  }
}
