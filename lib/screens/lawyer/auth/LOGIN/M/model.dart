class LawyerModel {
  LawyerInfo? lawyerInfo;
  int? status;
  String? msg;

  LawyerModel({this.lawyerInfo, this.status, this.msg});

  LawyerModel.fromJson(Map<String, dynamic> json) {
    lawyerInfo = json['lawyer_info'] != null
        ? new LawyerInfo.fromJson(json['lawyer_info'])
        : null;
    status = json['status'];
    msg = json['msg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lawyerInfo != null) {
      data['lawyer_info'] = this.lawyerInfo!.toJson();
    }
    data['status'] = this.status;
    data['msg'] = this.msg;
    return data;
  }
}

class LawyerInfo {
  String? advisorId;
  String? isPreferredLawyer;
  String? userType;
  String? username;
  String? password;
  String? firstName;
  String? middleName;
  String? lastName;
  String? email;
  String? address;
  String? city;
  String? countryId;
  String? lat;
  String? lng;
  String? state;
  String? cityId;
  String? zipcode;
  String? dob;
  String? paypalEmail;
  String? phone;
  String? image;
  String? videoLink;
  String? briefDescription;
  String? currJobTitle;
  String? currEmployer;
  String? hobbies;
  String? workHistory;
  String? otherSkills;
  String? advDegree;
  String? school;
  String? majorEmphasis;
  String? graduationYear;
  String? professionalLicenses;
  String? issuingLicenseAgency;
  String? licenseAgencyWebsite;
  String? featured;
  String? token;
  String? isPaid;
  String? isPendingToClaim;
  String? planId;
  String? paidAmount;
  String? paidOn;
  String? subscriptionId;
  String? subscrStartDate;
  String? subscrExpiryDate;
  String? lastUsed;
  String? showOnHomepage;
  String? created;
  String? status;
  String? profileViewCount;
  String? video;
  String? advertiserId;
  String? fattMerchantAccount;
  String? fattMerchantAccountActive;
  String? barAssocNo;
  String? active;
  String? verifiedStatus;
  String? profileImageBase64;
  String? ratePerHour;
  String? website;
  String? facebook;
  String? instagram;
  String? linkedIn;
  String? twitter;
  String? youtube;
  String? podcast;
  String? blog;

  LawyerInfo(
      {this.advisorId,
      this.isPreferredLawyer,
      this.userType,
      this.username,
      this.password,
      this.firstName,
      this.middleName,
      this.lastName,
      this.email,
      this.address,
      this.city,
      this.countryId,
      this.lat,
      this.lng,
      this.state,
      this.cityId,
      this.zipcode,
      this.dob,
      this.paypalEmail,
      this.phone,
      this.image,
      this.videoLink,
      this.briefDescription,
      this.currJobTitle,
      this.currEmployer,
      this.hobbies,
      this.workHistory,
      this.otherSkills,
      this.advDegree,
      this.school,
      this.majorEmphasis,
      this.graduationYear,
      this.professionalLicenses,
      this.issuingLicenseAgency,
      this.licenseAgencyWebsite,
      this.featured,
      this.token,
      this.isPaid,
      this.isPendingToClaim,
      this.planId,
      this.paidAmount,
      this.paidOn,
      this.subscriptionId,
      this.subscrStartDate,
      this.subscrExpiryDate,
      this.lastUsed,
      this.showOnHomepage,
      this.created,
      this.status,
      this.profileViewCount,
      this.video,
      this.advertiserId,
      this.fattMerchantAccount,
      this.fattMerchantAccountActive,
      this.barAssocNo,
      this.active,
      this.verifiedStatus,
      this.profileImageBase64,
      this.ratePerHour,
      this.website,
      this.facebook,
      this.instagram,
      this.linkedIn,
      this.twitter,
      this.youtube,
      this.podcast,
      this.blog});

  LawyerInfo.fromJson(Map<String, dynamic> json) {
    advisorId = json['advisor_id'];
    isPreferredLawyer = json['is_preferred_lawyer'];
    userType = json['user_type'];
    username = json['username'];
    password = json['password'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    email = json['email'];
    address = json['address'];
    city = json['city'];
    countryId = json['country_id'];
    lat = json['lat'];
    lng = json['lng'];
    state = json['state'];
    cityId = json['city_id'];
    zipcode = json['zipcode'];
    dob = json['dob'];
    paypalEmail = json['paypal_email'];
    phone = json['phone'];
    image = json['image'];
    videoLink = json['video_link'];
    briefDescription = json['brief_description'];
    currJobTitle = json['curr_job_title'];
    currEmployer = json['curr_employer'];
    hobbies = json['hobbies'];
    workHistory = json['work_history'];
    otherSkills = json['other_skills'];
    advDegree = json['adv_degree'];
    school = json['school'];
    majorEmphasis = json['major_emphasis'];
    graduationYear = json['graduation_year'];
    professionalLicenses = json['professional_licenses'];
    issuingLicenseAgency = json['issuing_license_agency'];
    licenseAgencyWebsite = json['license_agency_website'];
    featured = json['featured'];
    token = json['token'];
    isPaid = json['is_paid'];
    isPendingToClaim = json['is_pending_to_claim'];
    planId = json['plan_id'];
    paidAmount = json['paid_amount'];
    paidOn = json['paid_on'];
    subscriptionId = json['subscription_id'];
    subscrStartDate = json['subscr_start_date'];
    subscrExpiryDate = json['subscr_expiry_date'];
    lastUsed = json['last_used'];
    showOnHomepage = json['show_on_homepage'];
    created = json['created'];
    status = json['status'];
    profileViewCount = json['profile_view_count'];
    video = json['video'];
    advertiserId = json['advertiser_id'];
    fattMerchantAccount = json['fatt_merchant_account'];
    fattMerchantAccountActive = json['fatt_merchant_account_active'];
    barAssocNo = json['bar_assoc_no'];
    active = json['active'];
    verifiedStatus = json['verified_status'];
    profileImageBase64 = json['profile_image_base64'];
    ratePerHour = json['rate_per_hour'];
    website = json['website'];
    facebook = json['facebook'];
    instagram = json['instagram'];
    linkedIn = json['linkedIn'];
    twitter = json['twitter'];
    youtube = json['youtube'];
    podcast = json['podcast'];
    blog = json['blog'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['advisor_id'] = this.advisorId;
    data['is_preferred_lawyer'] = this.isPreferredLawyer;
    data['user_type'] = this.userType;
    data['username'] = this.username;
    data['password'] = this.password;
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['address'] = this.address;
    data['city'] = this.city;
    data['country_id'] = this.countryId;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['state'] = this.state;
    data['city_id'] = this.cityId;
    data['zipcode'] = this.zipcode;
    data['dob'] = this.dob;
    data['paypal_email'] = this.paypalEmail;
    data['phone'] = this.phone;
    data['image'] = this.image;
    data['video_link'] = this.videoLink;
    data['brief_description'] = this.briefDescription;
    data['curr_job_title'] = this.currJobTitle;
    data['curr_employer'] = this.currEmployer;
    data['hobbies'] = this.hobbies;
    data['work_history'] = this.workHistory;
    data['other_skills'] = this.otherSkills;
    data['adv_degree'] = this.advDegree;
    data['school'] = this.school;
    data['major_emphasis'] = this.majorEmphasis;
    data['graduation_year'] = this.graduationYear;
    data['professional_licenses'] = this.professionalLicenses;
    data['issuing_license_agency'] = this.issuingLicenseAgency;
    data['license_agency_website'] = this.licenseAgencyWebsite;
    data['featured'] = this.featured;
    data['token'] = this.token;
    data['is_paid'] = this.isPaid;
    data['is_pending_to_claim'] = this.isPendingToClaim;
    data['plan_id'] = this.planId;
    data['paid_amount'] = this.paidAmount;
    data['paid_on'] = this.paidOn;
    data['subscription_id'] = this.subscriptionId;
    data['subscr_start_date'] = this.subscrStartDate;
    data['subscr_expiry_date'] = this.subscrExpiryDate;
    data['last_used'] = this.lastUsed;
    data['show_on_homepage'] = this.showOnHomepage;
    data['created'] = this.created;
    data['status'] = this.status;
    data['profile_view_count'] = this.profileViewCount;
    data['video'] = this.video;
    data['advertiser_id'] = this.advertiserId;
    data['fatt_merchant_account'] = this.fattMerchantAccount;
    data['fatt_merchant_account_active'] = this.fattMerchantAccountActive;
    data['bar_assoc_no'] = this.barAssocNo;
    data['active'] = this.active;
    data['verified_status'] = this.verifiedStatus;
    data['profile_image_base64'] = this.profileImageBase64;
    data['rate_per_hour'] = this.ratePerHour;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['instagram'] = this.instagram;
    data['linkedIn'] = this.linkedIn;
    data['twitter'] = this.twitter;
    data['youtube'] = this.youtube;
    data['podcast'] = this.podcast;
    data['blog'] = this.blog;
    return data;
  }
}
