class BusStop {
  final String name;
  final String time;

  BusStop({this.name, this.time});


  static List<BusStop> sampleStops() {
    List<BusStop> stops = [];

    stops..add(BusStop(name: "JTL", time: "7:00am"))
      ..add(BusStop(name: "Al Quoz Mall", time: "7:50am"))
      ..add(BusStop(name: "Burj Khalifa", time: "8:30pm"))
      ..add(BusStop(name: "Knowledge Park", time: "9:00am"))
      ..add(BusStop(name: "Sharja", time: "9:15pm"))
      ..add(BusStop(name: "JTL", time: "9:52pm"));

    return stops;
  }
}