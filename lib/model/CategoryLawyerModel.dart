class CategoryLawyerModel {
  String? advisorId;
  String? firstName;
  String? lastName;
  String? email;
  String? address;
  String? cityId;
  String? lat;
  String? lng;
  String? state;
  String? zipcode;
  String? phone;
  String? image;
  String? videoLink;
  String? briefDescription;
  String? currJobTitle;
  String? currEmployer;
  String? workHistory;
  String? graduationYear;
  String? active;
  String? rateperhour;
  String? website;
  String? lawtype;
  String? cityname;
  String? categoryId;
  String? advisorUrl;
  String? statename;
  String? imageUrl;
  String? feedbacks;
  String? ratings;
  String? stateName;
  String? business_logo;

  CategoryLawyerModel(
      {this.advisorId,
      this.firstName,
      this.lastName,
      this.email,
      this.address,
      this.cityId,
      this.lat,
      this.rateperhour,
      this.lng,
      this.state,
      this.zipcode,
      this.phone,
      this.image,
      this.videoLink,
      this.briefDescription,
      this.currJobTitle,
      this.business_logo,
      this.currEmployer,
      this.workHistory,
      this.graduationYear,
      this.active,
      this.website,
      this.lawtype,
      this.cityname,
      this.categoryId,
      this.advisorUrl,
      this.statename,
      this.imageUrl,
      this.feedbacks,
      this.ratings,
      this.stateName});

  CategoryLawyerModel.fromJson(Map<String, dynamic> json) {
    advisorId = json['advisor_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    rateperhour = json['rate_per_hour'];
    address = json['address'];
    cityId = json['city_id'];
    lat = json['lat'];
    lng = json['lng'];
    business_logo = json['business_logo'];
    state = json['state'];
    zipcode = json['zipcode'];
    phone = json['phone'];
    image = json['image'];
    videoLink = json['video_link'];
    briefDescription = json['brief_description'];
    currJobTitle = json['curr_job_title'];
    currEmployer = json['curr_employer'];
    workHistory = json['work_history'];
    graduationYear = json['graduation_year'];
    active = json['active'];
    website = json['website'];
    lawtype = json['lawtype'];
    cityname = json['cityname'];
    categoryId = json['category_id'];
    advisorUrl = json['advisor_url'];
    statename = json['statename'];
    imageUrl = json['image_url'];
    feedbacks = json['feedbacks'];
    ratings = json['ratings'];
    stateName = json['state_name'];
  }
}
