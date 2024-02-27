class QuestionAdvisorModel {
  List<AdvisorQuestions>? advisorQuestions;
  String? status;
  String? error;

  QuestionAdvisorModel({this.advisorQuestions, this.status, this.error});

  QuestionAdvisorModel.fromJson(Map<String, dynamic> json) {
    if (json['advisor_questions'] != null) {
      advisorQuestions = <AdvisorQuestions>[];
      json['advisor_questions'].forEach((v) {
        advisorQuestions!.add(new AdvisorQuestions.fromJson(v));
      });
    }
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.advisorQuestions != null) {
      data['advisor_questions'] =
          this.advisorQuestions!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}

class AdvisorQuestions {
  String? questionId;
  String? question;
  String? userId;
  String? advisorId;
  String? advertiseId;
  String? categoryId;
  String? urgency;
  String? countryId;
  String? state;
  String? cityId;
  int? rating;
  String? feedback;
  String? accepted;
  String? isPaid;
  String? dateCreated;
  String? userFirstname;
  String? userLastname;
  String? userEmail;
  String? userPhone;

  AdvisorQuestions(
      {this.questionId,
      this.question,
      this.userId,
      this.advisorId,
      this.advertiseId,
      this.categoryId,
      this.urgency,
      this.countryId,
      this.state,
      this.cityId,
      this.rating,
      this.feedback,
      this.accepted,
      this.isPaid,
      this.dateCreated,
      this.userFirstname,
      this.userLastname,
      this.userEmail,
      this.userPhone});

  AdvisorQuestions.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    question = json['question'];
    userId = json['user_id'];
    advisorId = json['advisor_id'];
    advertiseId = json['advertise_id'];
    categoryId = json['category_id'];
    urgency = json['urgency'];
    countryId = json['country_id'];
    state = json['state'];
    cityId = json['city_id'];
    rating = json['rating'] ?? 0;
    feedback = json['feedback'] ?? '';
    accepted = json['accepted'];
    isPaid = json['is_paid'];
    dateCreated = json['date_created'];
    userFirstname = json['user_firstname'];
    userLastname = json['user_lastname'];
    userEmail = json['user_email'];
    userPhone = json['user_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['question_id'] = this.questionId;
    data['question'] = this.question;
    data['user_id'] = this.userId;
    data['advisor_id'] = this.advisorId;
    data['advertise_id'] = this.advertiseId;
    data['category_id'] = this.categoryId;
    data['urgency'] = this.urgency;
    data['country_id'] = this.countryId;
    data['state'] = this.state;
    data['city_id'] = this.cityId;
    data['rating'] = this.rating;
    data['feedback'] = this.feedback;
    data['accepted'] = this.accepted;
    data['is_paid'] = this.isPaid;
    data['date_created'] = this.dateCreated;
    data['user_firstname'] = this.userFirstname;
    data['user_lastname'] = this.userLastname;
    data['user_email'] = this.userEmail;
    data['user_phone'] = this.userPhone;
    return data;
  }
}
