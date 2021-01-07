class VerifySubscriptionRes {
  String app_logo;
  String app_name;
  String background_color;
  String facebook_link;
  String font_family;
  String foreground_color;
  String home_view;
  String instagram_link;
  String msg;
  String pinterest_link;
  String recipe_plgin;
  String selected_blogs;
  String selected_theme;
  String splash;
  bool status;
  String text_color;
  String twitter_link;
  String youtube_link;
  VerifySubscriptionRes({this.app_logo, this.app_name, this.background_color, this.facebook_link, this.font_family, this.foreground_color, this.home_view, this.instagram_link, this.msg, this.pinterest_link, this.recipe_plgin, this.selected_blogs, this.selected_theme, this.splash, this.status, this.text_color, this.twitter_link, this.youtube_link});
  factory VerifySubscriptionRes.fromJson(Map<String, dynamic> json) {
    return VerifySubscriptionRes(
      app_logo: json['app_logo'],
      app_name: json['app_name'],
      background_color: json['background_color'],
      facebook_link: json['facebook_link'],
      font_family: json['font_family'],
      foreground_color: json['foreground_color'],
      home_view: json['home_view'],
      instagram_link: json['instagram_link'],
      msg: json['msg'],
      pinterest_link: json['pinterest_link'],
      recipe_plgin: json['recipe_plgin'],
      selected_blogs: json['selected_blogs'],
      selected_theme: json['selected_theme'],
      splash: json['splash'],
      status: json['status'],
      text_color: json['text_color'],
      twitter_link: json['twitter_link'],
      youtube_link: json['youtube_link'],
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['app_logo'] = this.app_logo;
    data['app_name'] = this.app_name;
    data['background_color'] = this.background_color;
    data['facebook_link'] = this.facebook_link;
    data['font_family'] = this.font_family;
    data['foreground_color'] = this.foreground_color;
    data['home_view'] = this.home_view;
    data['instagram_link'] = this.instagram_link;
    data['msg'] = this.msg;
    data['pinterest_link'] = this.pinterest_link;
    data['recipe_plgin'] = this.recipe_plgin;
    data['selected_blogs'] = this.selected_blogs;
    data['selected_theme'] = this.selected_theme;
    data['splash'] = this.splash;
    data['status'] = this.status;
    data['text_color'] = this.text_color;
    data['twitter_link'] = this.twitter_link;
    data['youtube_link'] = this.youtube_link;
    return data;
  }
}