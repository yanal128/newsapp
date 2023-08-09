class Content {
  String? id;
  String? type;
  String? sectionId;
  String? sectionName;
  String? webPublicationDate;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  bool? isHosted;
  String? pillarId;
  String? pillarName;

  Content(
      {this.id,
        this.type,
        this.sectionId,
        this.sectionName,
        this.webPublicationDate,
        this.webTitle,
        this.webUrl,
        this.apiUrl,
        this.isHosted,
        this.pillarId,
        this.pillarName});

  Content.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    webPublicationDate = json['webPublicationDate'];
    webTitle = json['webTitle'];
    webUrl = json['webUrl'];
    apiUrl = json['apiUrl'];
    isHosted = json['isHosted'];
    pillarId = json['pillarId'];
    pillarName = json['pillarName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    data['webPublicationDate'] = this.webPublicationDate;
    data['webTitle'] = this.webTitle;
    data['webUrl'] = this.webUrl;
    data['apiUrl'] = this.apiUrl;
    data['isHosted'] = this.isHosted;
    data['pillarId'] = this.pillarId;
    data['pillarName'] = this.pillarName;
    return data;
  }
  
}

