class Shipment {
  String origin = '';
  String destination = '';
  String commodity = '';
  ShipmentType shipmentType = ShipmentType.FCL;
  String containerSize = "40' Standard";
  DateTime? cutOffDate;
  bool includeNearbyOrigin = false;
  bool includeNearbyDestination = false;
}

enum ShipmentType { FCL, LCL }