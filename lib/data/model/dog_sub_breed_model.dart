class DogSubBreed {
  List<String>? message;
  String? status;

  DogSubBreed({this.message, this.status});

  DogSubBreed.fromJson(Map<String, dynamic> json) {
    message = json['message'].cast<String>();
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    return data;
  }
}
