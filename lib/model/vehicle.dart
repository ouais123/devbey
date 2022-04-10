import 'dart:developer';

import 'package:devbey/main.dart';

class Vehicle {
  int id;
  Brand brand;
  Model model;
  String type;
  String color;
  String transmission;
  String fuel;
  String manufactureDate;
  String photos;
  List<Price> prices;

  Vehicle({
    required this.id,
    required this.brand,
    required this.model,
    required this.type,
    required this.color,
    required this.transmission,
    required this.fuel,
    required this.manufactureDate,
    required this.photos,
    required this.prices,
  });
  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'],
      brand: Brand.fromMap(map['brand']),
      model: Model.fromMap(map['model']),
      type: map['type'],
      color: map['color'],
      transmission: map['transmission'],
      fuel: map['fuel'],
      manufactureDate: map['manufacture_date'],
      photos:
          "https://www.leaseplan.com/-/media/leaseplan-digital/dk/public-pages/spotlight/block-2.jpg?iar=0&rev=-1&mw=960",
      prices: (map['price_list'] as List)
          .map((element) => Price.fromMap(element))
          .toList(),
    );
  }
}

class Brand {
  int id;
  String name;
  Brand({
    required this.id,
    required this.name,
  });
  factory Brand.fromMap(Map<String, dynamic> map) => Brand(
        id: map['id'],
        name: map['name'],
      );
}

class Model {
  int id;
  String name;
  Model({required this.id, required this.name});
  factory Model.fromMap(Map<String, dynamic> map) => Model(
        id: map['id'],
        name: map['name'],
      );
}

class Price {
  int id;
  String name;
  int numOfDays;
  int price;
  Price({
    required this.id,
    required this.name,
    required this.numOfDays,
    required this.price,
  });

  factory Price.fromMap(Map<String, dynamic> map) => Price(
        id: map['id'],
        name: map['name'],
        numOfDays: map['num_of_days'],
        price: map['price'],
      );
}
