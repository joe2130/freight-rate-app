import 'package:flutter/material.dart';
import '../models/shipment.dart';
import '../widgets/shipment_type_selector.dart';
import '../widgets/date_picker.dart';
import '../widgets/dimensions_display.dart';
import '../widgets/auto_complete_field.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Shipment shipment = Shipment();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search the best Freight Rates"),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("History", 
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            
            AutoCompleteTextField(
              label: "Origin",
              onSelected: (value) {
                setState(() {
                  shipment.origin = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text("Include nearby origin ports"),
              value: shipment.includeNearbyOrigin,
              onChanged: (value) => setState(() => shipment.includeNearbyOrigin = value),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 16),
            
            TextField(
              decoration: const InputDecoration(
                labelText: "Commodity",
                border: OutlineInputBorder(),
              ),
              onChanged: (value) => shipment.commodity = value,
            ),
            const SizedBox(height: 20),
            
            const Text("Shipment Type :", 
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            ShipmentTypeSelector(
              shipment: shipment,
              onChanged: (value) => setState(() => shipment.shipmentType = value),
            ),
            const SizedBox(height: 20),
            
            AutoCompleteTextField(
              label: "Destination",
              onSelected: (value) {
                setState(() {
                  shipment.destination = value;
                });
              },
            ),
            SwitchListTile(
              title: const Text("Include nearby destination ports"),
              value: shipment.includeNearbyDestination,
              onChanged: (value) => setState(() => shipment.includeNearbyDestination = value),
              contentPadding: EdgeInsets.zero,
            ),
            const SizedBox(height: 20),
            
            const Text("Cut Off Date :", 
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            CustomDatePicker(
              selectedDate: shipment.cutOffDate,
              onDateSelected: (date) => setState(() => shipment.cutOffDate = date),
            ),
            const SizedBox(height: 20),
            
            DimensionsDisplay(shipment: shipment),
            const SizedBox(height: 30),
            
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  print({
                    'origin': shipment.origin,
                    'destination': shipment.destination,
                    'commodity': shipment.commodity,
                    'type': shipment.shipmentType.toString(),
                    'containerSize': shipment.containerSize,
                    'cutOffDate': shipment.cutOffDate?.toString(),
                  });
                },
                child: const Padding(
                  padding: EdgeInsets.symmetric(vertical: 12),
                  child: Text("Search Rates", style: TextStyle(fontSize: 16)),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}