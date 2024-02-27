class QuestionREQModel {
  List<UserSendQuestionRequest>? userSendQuestionRequest;
  String? status;
  String? error;

  QuestionREQModel({this.userSendQuestionRequest, this.status, this.error});

  QuestionREQModel.fromJson(Map<String, dynamic> json) {
    if (json['user_send_question_request'] != null) {
      userSendQuestionRequest = <UserSendQuestionRequest>[];
      json['user_send_question_request'].forEach((v) {
        userSendQuestionRequest!.add(new UserSendQuestionRequest.fromJson(v));
      });
    }
    status = json['status'];
    error = json['error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.userSendQuestionRequest != null) {
      data['user_send_question_request'] =
          this.userSendQuestionRequest!.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    data['error'] = this.error;
    return data;
  }
}

class UserSendQuestionRequest {
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
  String? firstName;
  String? lastName;

  UserSendQuestionRequest(
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
      this.firstName,
      this.lastName});

  UserSendQuestionRequest.fromJson(Map<String, dynamic> json) {
    questionId = json['question_id'];
    question = json['question'];
    userId = json['user_id'];
    advisorId = json['advisor_id'];
    advertiseId = json['advertise_id'];
    categoryId = json['category_id'];
    urgency = json['urgency'];
    countryId = json['country_id'];
    state = json['state'] ?? 'FL';
    cityId = json['city_id'] ?? '';
    rating = json['rating'] ?? 0;
    feedback = json['feedback'] ?? '';
    accepted = json['accepted'];
    isPaid = json['is_paid'];
    dateCreated = json['date_created'];
    firstName = json['first_name'];
    lastName = json['last_name'];
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
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}
