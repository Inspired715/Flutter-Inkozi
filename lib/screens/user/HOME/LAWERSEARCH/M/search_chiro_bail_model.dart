class ChiroBailModel {
  List<ChiroBailList>? chiroBailList;
  String? status;
  String? error;

  ChiroBailModel({this.chiroBailList, this.status, this.error});

  ChiroBailModel.fromJson(Map<String, dynamic> json) {
    if (json['chiro_bail_list'] != null) {
      chiroBailList = <ChiroBailList>[];
      json['chiro_bail_list'].forEach((v) {
        chiroBailList!.add(new ChiroBailList.fromJson(v));
      });
    }
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.chiroBailList != null) {
      data['chiro_bail_list'] =
          this.chiroBailList!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}

class ChiroBailList {
  String? chirBailId;
  String? categoryId;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? cityId;
  String? lat;
  String? lng;
  String? state;
  String? phone;
  String? image;
  Null advertiserCustomUrl;
  String? statename;
  String? cityname;
  String? imageUrl;
  String? lawtype;
  String? stateName;

  ChiroBailList(
      {this.chirBailId,
      this.categoryId,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.cityId,
      this.lat,
      this.lng,
      this.state,
      this.phone,
      this.image,
      this.advertiserCustomUrl,
      this.statename,
      this.cityname,
      this.imageUrl,
      this.lawtype,
      this.stateName});

  ChiroBailList.fromJson(Map<String, dynamic> json) {
    chirBailId = json['chir_bail_id'];
    categoryId = json['category_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    cityId = json['city_id'];
    lat = json['lat'];
    lng = json['lng'];
    state = json['state'];
    phone = json['phone'];
    image = json['image'];
    advertiserCustomUrl = json['advertiser_custom_url'];
    statename = json['statename'];
    cityname = json['cityname'];
    imageUrl = json['image_url'];
    lawtype = json['lawtype'];
    stateName = json['state_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['chir_bail_id'] = this.chirBailId;
    data['category_id'] = this.categoryId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['city_id'] = this.cityId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['state'] = this.state;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['advertiser_custom_url'] = this.advertiserCustomUrl;
    data['statename'] = this.statename;
    data['cityname'] = this.cityname;
    data['image_url'] = this.imageUrl;
    data['lawtype'] = this.lawtype;
    data['state_name'] = this.stateName;
    return data;
  }
}
