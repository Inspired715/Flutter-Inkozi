// class Geometry {
//   final Location? location;

//   Geometry({this.location});

//   Geometry.fromJson(Map<dynamic, dynamic> parsedJson)
//       : location = Location.fromJson(parsedJson['location']);
// }

// class Location {
//   final double? lat;
//   final double? lng;

//   Location({this.lat, this.lng});

//   factory Location.fromJson(Map<dynamic, dynamic> parsedJson) {
//     return Location(lat: parsedJson['lat'], lng: parsedJson['lng']);
//   }
// }

// class PlaceSearch {
//   final String? description;
//   final String? placeId;

//   PlaceSearch({this.description, this.placeId});

//   factory PlaceSearch.fromJson(Map<String, dynamic> json) {
//     return PlaceSearch(
//         description: json['description'], placeId: json['place_id']);
//   }
// }

// class Place {
//   final Geometry? geometry;
//   final String? name;
//   final String? vicinity;

//   Place({this.geometry, this.name, this.vicinity});

//   factory Place.fromJson(Map<String, dynamic> json) {
//     return Place(
//       geometry: Geometry.fromJson(json['geometry']),
//       name: json['formatted_address'],
//       vicinity: json['vicinity'],
//     );
//   }
// }

// class CategoriesModel {
//   List<Categories>? categories;
//   int? status;
//   String? error;

//   CategoriesModel({this.categories, this.status, this.error});

//   CategoriesModel.fromJson(Map<String, dynamic> json) {
//     if (json['categories'] != null) {
//       categories = <Categories>[];
//       json['categories'].forEach((v) {
//         categories!.add(new Categories.fromJson(v));
//       });
//     }
//     status = json['status'];
//     error = json['error'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.categories != null) {
//       data['categories'] = this.categories!.map((v) => v.toJson()).toList();
//     }
//     data['status'] = this.status;
//     data['error'] = this.error;
//     return data;
//   }
// }

// class Categories {
//   String? categoryId;
//   String? categoryName;

//   Categories({this.categoryId, this.categoryName});

//   Categories.fromJson(Map<String, dynamic> json) {
//     categoryId = json['category_id'];
//     categoryName = json['category_name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['category_id'] = this.categoryId;
//     data['category_name'] = this.categoryName;
//     return data;
//   }
// }
