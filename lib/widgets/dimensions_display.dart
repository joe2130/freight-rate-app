import 'package:flutter/material.dart';
import '../models/shipment.dart';

class DimensionsDisplay extends StatelessWidget {
  final Shipment shipment;

  const DimensionsDisplay({
    required this.shipment,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (shipment.shipmentType == ShipmentType.FCL) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text("Container Internal Dimensions :", 
              style: TextStyle(fontWeight: FontWeight.bold)),
          Text("Length: 39.46 ft"),
          Text("Width: 7.70 ft"),
          Text("Height: 7.84 ft"),
        ],
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}