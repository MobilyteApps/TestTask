class VerifySubscriptionWithToken {
  String msg;
  bool status;
  VerifySubscriptionWithToken({this.msg, this.status});
  factory VerifySubscriptionWithToken.fromJson(Map<String, dynamic> json) {
    return VerifySubscriptionWithToken(
      msg: json['msg'],
      status: json['status'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['msg'] = this.msg;
    data['status'] = this.status;
    return data;
  }
}