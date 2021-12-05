import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/images/home_images.dart';
import 'package:mwasla_app/ui/widgets/trip_card_widget.dart';


class BusPage extends StatefulWidget {
  const BusPage({Key? key}) : super(key: key);

  @override
  _BusPageState createState() => _BusPageState();
}

class _BusPageState extends State<BusPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TripCard(TRIP_CARD4),
          TripCard(TRIP_CARD5),
        ],
      ),
    );
  }
}

