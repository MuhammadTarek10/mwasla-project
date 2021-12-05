import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/images/home_images.dart';
import 'package:mwasla_app/ui/widgets/trip_card_widget.dart';


class TramPage extends StatefulWidget {
  const TramPage({Key? key}) : super(key: key);

  @override
  _TramPageState createState() => _TramPageState();
}

class _TramPageState extends State<TramPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TripCard(TRIP_CARD10),
          TripCard(TRIP_CARD11),
        ],
      ),
    );
  }
}
