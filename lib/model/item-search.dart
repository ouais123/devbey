class ItemSearch {
  int id;
  int geonameid;
  String name;
  String asciiname;
  String alternatenames;
  String latitude;
  String longitude;
  String timezone;
  Country country;
  ItemSearch({
    required this.id,
    required this.geonameid,
    required this.name,
    required this.asciiname,
    required this.alternatenames,
    required this.latitude,
    required this.longitude,
    required this.timezone,
    required this.country,
  });

  factory ItemSearch.fromMap(Map<String, dynamic> map) => ItemSearch(
        id: map['id'] ?? 0,
        geonameid: map['geonameid'] ?? 0,
        name: map['name'] ?? '',
        asciiname: map['asciiname'] ?? '',
        alternatenames: map['alternatenames'] ?? '',
        latitude: map['latitude'] ?? '',
        longitude: map['longitude'] ?? '',
        timezone: map['timezone'] ?? '',
        country: Country.fromMap(map['country']),
      );
}

class Country {
  int id;
  String name;
  Country({
    required this.id,
    required this.name,
  });

  factory Country.fromMap(Map<String, dynamic> map) =>
      Country(id: map['id'] ?? 0, name: map['name'] ?? '');
}
