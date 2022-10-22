// To parse this JSON data, do
//
//     final openSourceAutoComplete = openSourceAutoCompleteFromJson(jsonString);

import 'dart:convert';

OpenSourceAutoComplete openSourceAutoCompleteFromJson(String str) => OpenSourceAutoComplete.fromJson(json.decode(str));

String openSourceAutoCompleteToJson(OpenSourceAutoComplete data) => json.encode(data.toJson());

class OpenSourceAutoComplete {
  OpenSourceAutoComplete({
    this.geocoding,
    this.type,
    this.features,
    this.bbox,
  });

  Geocoding? geocoding;
  String? type;
  List<Feature>? features;
  List<double>? bbox;

  factory OpenSourceAutoComplete.fromJson(Map<String, dynamic> json) => OpenSourceAutoComplete(
    geocoding: json["geocoding"] == null ? null : Geocoding.fromJson(json["geocoding"]),
    type: json["type"],
    features: json["features"] == null ? null : List<Feature>.from(json["features"].map((x) => Feature.fromJson(x))),
    bbox: json["bbox"] == null ? null : List<double>.from(json["bbox"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "geocoding": geocoding == null ? null : geocoding!.toJson(),
    "type": type,
    "features": features == null ? null : List<dynamic>.from(features!.map((x) => x.toJson())),
    "bbox": bbox == null ? null : List<dynamic>.from(bbox!.map((x) => x)),
  };
}

class Feature {
  Feature({
    this.type,
    this.geometry,
    this.properties,
    this.bbox,
  });

  FeatureType? type;
  Geometry? geometry;
  Properties? properties;
  List<double>? bbox;

  factory Feature.fromJson(Map<String, dynamic> json) => Feature(
    type: json["type"] == null ? null : featureTypeValues.map![json["type"]],
    geometry: json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
    properties: json["properties"] == null ? null : Properties.fromJson(json["properties"]),
    bbox: json["bbox"] == null ? null : List<double>.from(json["bbox"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : featureTypeValues.reverse![type],
    "geometry": geometry == null ? null : geometry!.toJson(),
    "properties": properties == null ? null : properties!.toJson(),
    "bbox": bbox == null ? null : List<dynamic>.from(bbox!.map((x) => x)),
  };
}

class Geometry {
  Geometry({
    this.type,
    this.coordinates,
  });

  GeometryType? type;
  List<double>? coordinates;

  factory Geometry.fromJson(Map<String, dynamic> json) => Geometry(
    type: json["type"] == null ? null : geometryTypeValues.map![json["type"]],
    coordinates: json["coordinates"] == null ? null : List<double>.from(json["coordinates"].map((x) => x.toDouble())),
  );

  Map<String, dynamic> toJson() => {
    "type": type == null ? null : geometryTypeValues.reverse![type],
    "coordinates": coordinates == null ? null : List<dynamic>.from(coordinates!.map((x) => x)),
  };
}

enum GeometryType { POINT }

final geometryTypeValues = EnumValues({
  "Point": GeometryType.POINT
});

class Properties {
  Properties({
    this.id,
    this.gid,
    this.layer,
    this.source,
    this.sourceId,
    this.name,
    this.housenumber,
    this.street,
    this.postalcode,
    this.accuracy,
    this.country,
    this.countryGid,
    this.countryA,
    this.macroregion,
    this.macroregionGid,
    this.region,
    this.regionGid,
    this.regionA,
    this.county,
    this.countyGid,
    this.localadmin,
    this.localadminGid,
    this.locality,
    this.localityGid,
    this.neighbourhood,
    this.neighbourhoodGid,
    this.continent,
    this.continentGid,
    this.label,
    this.addendum,
  });

  String? id;
  String? gid;
  Layer? layer;
  Source? source;
  String? sourceId;
  String? name;
  String? housenumber;
  String? street;
  String? postalcode;
  Accuracy? accuracy;
  Country? country;
  CountryGid? countryGid;
  CountryA? countryA;
  Macroregion? macroregion;
  MacroregionGid? macroregionGid;
  County? region;
  RegionGid? regionGid;
  RegionA? regionA;
  County? county;
  CountyGid? countyGid;
  Localadmin? localadmin;
  LocaladminGid? localadminGid;
  County? locality;
  LocalityGid? localityGid;
  String? neighbourhood;
  String? neighbourhoodGid;
  Continent? continent;
  ContinentGid? continentGid;
  String? label;
  Addendum? addendum;

  factory Properties.fromJson(Map<String, dynamic> json) => Properties(
    id: json["id"],
    gid: json["gid"],
    layer: json["layer"] == null ? null : layerValues.map![json["layer"]],
    source: json["source"] == null ? null : sourceValues.map![json["source"]],
    sourceId: json["source_id"],
    name: json["name"],
    housenumber: json["housenumber"],
    street: json["street"],
    postalcode: json["postalcode"],
    accuracy: json["accuracy"] == null ? null : accuracyValues.map![json["accuracy"]],
    country: json["country"] == null ? null : countryValues.map![json["country"]],
    countryGid: json["country_gid"] == null ? null : countryGidValues.map![json["country_gid"]],
    countryA: json["country_a"] == null ? null : countryAValues.map![json["country_a"]],
    macroregion: json["macroregion"] == null ? null : macroregionValues.map![json["macroregion"]],
    macroregionGid: json["macroregion_gid"] == null ? null : macroregionGidValues.map![json["macroregion_gid"]],
    region: json["region"] == null ? null : countyValues.map![json["region"]],
    regionGid: json["region_gid"] == null ? null : regionGidValues.map![json["region_gid"]],
    regionA: json["region_a"] == null ? null : regionAValues.map![json["region_a"]],
    county: json["county"] == null ? null : countyValues.map![json["county"]],
    countyGid: json["county_gid"] == null ? null : countyGidValues.map![json["county_gid"]],
    localadmin: json["localadmin"] == null ? null : localadminValues.map![json["localadmin"]],
    localadminGid: json["localadmin_gid"] == null ? null : localadminGidValues.map![json["localadmin_gid"]],
    locality: json["locality"] == null ? null : countyValues.map![json["locality"]],
    localityGid: json["locality_gid"] == null ? null : localityGidValues.map![json["locality_gid"]],
    neighbourhood: json["neighbourhood"],
    neighbourhoodGid: json["neighbourhood_gid"],
    continent: json["continent"] == null ? null : continentValues.map![json["continent"]],
    continentGid: json["continent_gid"] == null ? null : continentGidValues.map![json["continent_gid"]],
    label: json["label"],
    addendum: json["addendum"] == null ? null : Addendum.fromJson(json["addendum"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "gid": gid,
    "layer": layer == null ? null : layerValues.reverse![layer],
    "source": source == null ? null : sourceValues.reverse![source],
    "source_id": sourceId,
    "name": name,
    "housenumber": housenumber,
    "street": street,
    "postalcode": postalcode,
    "accuracy": accuracy == null ? null : accuracyValues.reverse![accuracy],
    "country": country == null ? null : countryValues.reverse![country],
    "country_gid": countryGid == null ? null : countryGidValues.reverse![countryGid],
    "country_a": countryA == null ? null : countryAValues.reverse![countryA],
    "macroregion": macroregion == null ? null : macroregionValues.reverse![macroregion],
    "macroregion_gid": macroregionGid == null ? null : macroregionGidValues.reverse![macroregionGid],
    "region": region == null ? null : countyValues.reverse![region],
    "region_gid": regionGid == null ? null : regionGidValues.reverse![regionGid],
    "region_a": regionA == null ? null : regionAValues.reverse![regionA],
    "county": county == null ? null : countyValues.reverse![county],
    "county_gid": countyGid == null ? null : countyGidValues.reverse![countyGid],
    "localadmin": localadmin == null ? null : localadminValues.reverse![localadmin],
    "localadmin_gid": localadminGid == null ? null : localadminGidValues.reverse![localadminGid],
    "locality": locality == null ? null : countyValues.reverse![locality],
    "locality_gid": localityGid == null ? null : localityGidValues.reverse![localityGid],
    "neighbourhood": neighbourhood,
    "neighbourhood_gid": neighbourhoodGid,
    "continent": continent == null ? null : continentValues.reverse![continent],
    "continent_gid": continentGid == null ? null : continentGidValues.reverse![continentGid],
    "label": label,
    "addendum": addendum == null ? null : addendum!.toJson(),
  };
}

enum Accuracy { POINT }

final accuracyValues = EnumValues({
  "point": Accuracy.POINT
});

class Addendum {
  Addendum({
    this.osm,
  });

  Osm? osm;

  factory Addendum.fromJson(Map<String, dynamic> json) => Addendum(
    osm: json["osm"] == null ? null : Osm.fromJson(json["osm"]),
  );

  Map<String, dynamic> toJson() => {
    "osm": osm == null ? null : osm!.toJson(),
  };
}

class Osm {
  Osm({
    this.wikidata,
    this.wikipedia,
    this.osmOperator,
    this.website,
    this.phone,
    this.openingHours,
    this.wheelchair,
  });

  String? wikidata;
  String? wikipedia;
  String? osmOperator;
  String? website;
  String? phone;
  String? openingHours;
  String? wheelchair;

  factory Osm.fromJson(Map<String, dynamic> json) => Osm(
    wikidata: json["wikidata"],
    wikipedia: json["wikipedia"],
    osmOperator: json["operator"],
    website: json["website"],
    phone: json["phone"],
    openingHours: json["opening_hours"],
    wheelchair: json["wheelchair"],
  );

  Map<String, dynamic> toJson() => {
    "wikidata": wikidata,
    "wikipedia": wikipedia,
    "operator": osmOperator,
    "website": website,
    "phone": phone,
    "opening_hours": openingHours,
    "wheelchair": wheelchair,
  };
}

enum Continent { AMRICA_DO_SUL }

final continentValues = EnumValues({
  "América do Sul": Continent.AMRICA_DO_SUL
});

enum ContinentGid { WHOSONFIRST_CONTINENT_102191577 }

final continentGidValues = EnumValues({
  "whosonfirst:continent:102191577": ContinentGid.WHOSONFIRST_CONTINENT_102191577
});

enum Country { BRASIL }

final countryValues = EnumValues({
  "Brasil": Country.BRASIL
});

enum CountryA { BRA }

final countryAValues = EnumValues({
  "BRA": CountryA.BRA
});

enum CountryGid { WHOSONFIRST_COUNTRY_85633009 }

final countryGidValues = EnumValues({
  "whosonfirst:country:85633009": CountryGid.WHOSONFIRST_COUNTRY_85633009
});

enum County { SO_PAULO, PIRACICABA }

final countyValues = EnumValues({
  "Piracicaba": County.PIRACICABA,
  "São Paulo": County.SO_PAULO
});

enum CountyGid { WHOSONFIRST_COUNTY_102062255, WHOSONFIRST_COUNTY_102061965 }

final countyGidValues = EnumValues({
  "whosonfirst:county:102061965": CountyGid.WHOSONFIRST_COUNTY_102061965,
  "whosonfirst:county:102062255": CountyGid.WHOSONFIRST_COUNTY_102062255
});

enum Layer { VENUE }

final layerValues = EnumValues({
  "venue": Layer.VENUE
});

enum Localadmin { JARDIM_PAULISTA, PIRACICABA }

final localadminValues = EnumValues({
  "Jardim Paulista": Localadmin.JARDIM_PAULISTA,
  "Piracicaba": Localadmin.PIRACICABA
});

enum LocaladminGid { WHOSONFIRST_LOCALADMIN_404567359, WHOSONFIRST_LOCALADMIN_404566975 }

final localadminGidValues = EnumValues({
  "whosonfirst:localadmin:404566975": LocaladminGid.WHOSONFIRST_LOCALADMIN_404566975,
  "whosonfirst:localadmin:404567359": LocaladminGid.WHOSONFIRST_LOCALADMIN_404567359
});

enum LocalityGid { WHOSONFIRST_LOCALITY_101965533, WHOSONFIRST_LOCALITY_101955869 }

final localityGidValues = EnumValues({
  "whosonfirst:locality:101955869": LocalityGid.WHOSONFIRST_LOCALITY_101955869,
  "whosonfirst:locality:101965533": LocalityGid.WHOSONFIRST_LOCALITY_101965533
});

enum Macroregion { SUDESTE }

final macroregionValues = EnumValues({
  "Sudeste": Macroregion.SUDESTE
});

enum MacroregionGid { WHOSONFIRST_MACROREGION_1511777411 }

final macroregionGidValues = EnumValues({
  "whosonfirst:macroregion:1511777411": MacroregionGid.WHOSONFIRST_MACROREGION_1511777411
});

enum RegionA { SP }

final regionAValues = EnumValues({
  "SP": RegionA.SP
});

enum RegionGid { WHOSONFIRST_REGION_85682041 }

final regionGidValues = EnumValues({
  "whosonfirst:region:85682041": RegionGid.WHOSONFIRST_REGION_85682041
});

enum Source { OPENSTREETMAP }

final sourceValues = EnumValues({
  "openstreetmap": Source.OPENSTREETMAP
});

enum FeatureType { FEATURE }

final featureTypeValues = EnumValues({
  "Feature": FeatureType.FEATURE
});

class Geocoding {
  Geocoding({
    this.version,
    this.attribution,
    this.query,
    this.warnings,
    this.engine,
    this.timestamp,
  });

  String? version;
  String? attribution;
  Query? query;
  List<String>? warnings;
  Engine? engine;
  int? timestamp;

  factory Geocoding.fromJson(Map<String, dynamic> json) => Geocoding(
    version: json["version"],
    attribution: json["attribution"],
    query: json["query"] == null ? null : Query.fromJson(json["query"]),
    warnings: json["warnings"] == null ? null : List<String>.from(json["warnings"].map((x) => x)),
    engine: json["engine"] == null ? null : Engine.fromJson(json["engine"]),
    timestamp: json["timestamp"],
  );

  Map<String, dynamic> toJson() => {
    "version": version,
    "attribution": attribution,
    "query": query == null ? null : query!.toJson(),
    "warnings": warnings == null ? null : List<dynamic>.from(warnings!.map((x) => x)),
    "engine": engine == null ? null : engine!.toJson(),
    "timestamp": timestamp,
  };
}

class Engine {
  Engine({
    this.name,
    this.author,
    this.version,
  });

  String? name;
  String? author;
  String? version;

  factory Engine.fromJson(Map<String, dynamic> json) => Engine(
    name: json["name"],
    author: json["author"],
    version: json["version"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "author": author,
    "version": version,
  };
}

class Query {
  Query({
    this.text,
    this.parser,
    this.parsedText,
    this.size,
    this.layers,
    this.private,
    this.boundaryCountry,
    this.lang,
    this.querySize,
  });

  String? text;
  String? parser;
  ParsedText? parsedText;
  int? size;
  List<String>? layers;
  bool? private;
  List<CountryA>? boundaryCountry;
  Lang? lang;
  int? querySize;

  factory Query.fromJson(Map<String, dynamic> json) => Query(
    text: json["text"],
    parser: json["parser"],
    parsedText: json["parsed_text"] == null ? null : ParsedText.fromJson(json["parsed_text"]),
    size: json["size"],
    layers: json["layers"] == null ? null : List<String>.from(json["layers"].map((x) => x)),
    private: json["private"],
    boundaryCountry: json["boundary.country"] == null ? null : List<CountryA>.from(json["boundary.country"].map((x) => countryAValues.map![x])),
    lang: json["lang"] == null ? null : Lang.fromJson(json["lang"]),
    querySize: json["querySize"],
  );

  Map<String, dynamic> toJson() => {
    "text": text,
    "parser": parser,
    "parsed_text": parsedText == null ? null : parsedText!.toJson(),
    "size": size,
    "layers": layers == null ? null : List<dynamic>.from(layers!.map((x) => x)),
    "private": private,
    "boundary.country": boundaryCountry == null ? null : List<dynamic>.from(boundaryCountry!.map((x) => countryAValues.reverse![x])),
    "lang": lang == null ? null : lang!.toJson(),
    "querySize": querySize,
  };
}

class Lang {
  Lang({
    this.name,
    this.iso6391,
    this.iso6393,
    this.via,
    this.defaulted,
  });

  String? name;
  String? iso6391;
  String? iso6393;
  String? via;
  bool? defaulted;

  factory Lang.fromJson(Map<String, dynamic> json) => Lang(
    name: json["name"],
    iso6391: json["iso6391"],
    iso6393: json["iso6393"],
    via: json["via"],
    defaulted: json["defaulted"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "iso6391": iso6391,
    "iso6393": iso6393,
    "via": via,
    "defaulted": defaulted,
  };
}

class ParsedText {
  ParsedText({
    this.subject,
  });

  String? subject;

  factory ParsedText.fromJson(Map<String, dynamic> json) => ParsedText(
    subject: json["subject"],
  );

  Map<String, dynamic> toJson() => {
    "subject": subject,
  };
}

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
