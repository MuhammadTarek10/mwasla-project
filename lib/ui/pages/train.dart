import 'package:flutter/material.dart';
import 'package:mwasla_app/ui/images/home_images.dart';
import 'package:mwasla_app/ui/widgets/trip_card_widget.dart';


class TrainPage extends StatefulWidget {
  const TrainPage({Key? key}) : super(key: key);

  @override
  _TrainPageState createState() => _TrainPageState();
}

class _TrainPageState extends State<TrainPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          TripCard(TRIP_CARD7),
          TripCard(TRIP_CARD8),
        ],
      ),
    );
  }
}
