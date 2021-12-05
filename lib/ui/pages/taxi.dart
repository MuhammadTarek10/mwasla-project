// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/images/home_images.dart';
import 'package:mwasla_app/ui/widgets/trip_card_widget.dart';



class TaxiPage extends StatefulWidget {
  const TaxiPage({Key? key}) : super(key: key);

  @override
  _TaxiPageState createState() => _TaxiPageState();
}

class _TaxiPageState extends State<TaxiPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TripCard(TRIP_CARD13),
          TripCard(TRIP_CARD14),
        ],
      ),
    );
  }
}
