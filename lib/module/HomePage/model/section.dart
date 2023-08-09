class Section  {
  String id="home";
  String webTitle="home";


  Section({required this.id, required this.webTitle});

  Section.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    webTitle = json['webTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['webTitle'] = this.webTitle;

    return data;
  }


}