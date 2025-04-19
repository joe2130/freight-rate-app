import 'package:flutter/material.dart';
import '../models/shipment.dart';

class ShipmentTypeSelector extends StatelessWidget {
  final Shipment shipment;
  final Function(ShipmentType) onChanged;

  const ShipmentTypeSelector({
    required this.shipment,
    required this.onChanged,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RadioListTile<ShipmentType>(
          title: const Text("FCL"),
          value: ShipmentType.FCL,
          groupValue: shipment.shipmentType,
          onChanged: (value) => onChanged(value!),
        ),
        RadioListTile<ShipmentType>(
          title: const Text("LCL"),
          value: ShipmentType.LCL,
          groupValue: shipment.shipmentType,
          onChanged: (value) => onChanged(value!),
        ),
        if (shipment.shipmentType == ShipmentType.FCL)
          DropdownButton<String>(
            value: shipment.containerSize,
            items: ["40' Standard", "20' Standard"].map((size) {
              return DropdownMenuItem(
                value: size,
                child: Text(size),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null) {
                shipment.containerSize = value;
              }
            },
          ),
      ],
    );
  }
}