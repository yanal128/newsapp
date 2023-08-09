

class News {
  String? id;
  String? type;
  String? sectionId;
  String? sectionName;
  String? webPublicationDate;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  Fields? fields;

  List<Tags>? tags;
  bool? isHosted;
  String? pillarId;
  String? pillarName;

  News(
      {this.id,
        this.type,
        this.sectionId,
        this.sectionName,
        this.webPublicationDate,
        this.webTitle,
        this.webUrl,
        this.apiUrl,
        this.fields,
        this.tags,
        this.isHosted,
        this.pillarId,
        this.pillarName});

  News.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    webPublicationDate = json['webPublicationDate'];
    webTitle = json['webTitle'];
    webUrl = json['webUrl'];
    apiUrl = json['apiUrl'];
    fields =
    json['fields'] != null ? new Fields.fromJson(json['fields']) : null;
    if (json['tags'] != null) {
      tags = <Tags>[];
      json['tags'].forEach((v) {
        tags!.add(Tags.fromJson(v));
      });
    }
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

    if (this.fields != null) {
      data['fields'] = this.fields!.toJson();
    }
    if (this.tags != null) {
      data['tags'] = this.tags!.map((v) => v.toJson()).toList();
    }
    data['isHosted'] = this.isHosted;
    data['pillarId'] = this.pillarId;
    data['pillarName'] = this.pillarName;
    return data;
  }
}


class Fields {

  String? thumbnail;

  Fields({ this.thumbnail});

  Fields.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}

class Tags {
  String? id;
  String? type;
  String? sectionId;
  String? sectionName;
  String? webTitle;
  String? webUrl;
  String? apiUrl;
  String? bio;
  String? bylineImageUrl;
  String? bylineLargeImageUrl;
  String? firstName;
  String? lastName;
  String? twitterHandle;

  Tags(
      {this.id,
        this.type,
        this.sectionId,
        this.sectionName,
        this.webTitle,
        this.webUrl,
        this.apiUrl,
        this.bio,
        this.bylineImageUrl,
        this.bylineLargeImageUrl,
        this.firstName,
        this.lastName,
        this.twitterHandle});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    type = json['type'];
    sectionId = json['sectionId'];
    sectionName = json['sectionName'];
    webTitle = json['webTitle'];
    webUrl = json['webUrl'];
    apiUrl = json['apiUrl'];
    bio = json['bio'];
    bylineImageUrl = json['bylineImageUrl'];
    bylineLargeImageUrl = json['bylineLargeImageUrl'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    twitterHandle = json['twitterHandle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['type'] = this.type;
    data['sectionId'] = this.sectionId;
    data['sectionName'] = this.sectionName;
    data['webTitle'] = this.webTitle;
    data['webUrl'] = this.webUrl;
    data['apiUrl'] = this.apiUrl;
    data['bio'] = this.bio;
    data['bylineImageUrl'] = this.bylineImageUrl;
    data['bylineLargeImageUrl'] = this.bylineLargeImageUrl;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['twitterHandle'] = this.twitterHandle;
    return data;
  }
}