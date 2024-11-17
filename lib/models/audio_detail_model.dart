class AudioDetailModel {
    String? id;
    String? artist;
    DateTime? createdAt;
    String? description;
    String? isPremium;
    String? jobTitle;
    String? languange;
    List<Path>? path;
    List<Path>? thumbnail;
    int? time;
    String? title;

    AudioDetailModel({
        this.id,
        this.artist,
        this.createdAt,
        this.description,
        this.isPremium,
        this.jobTitle,
        this.languange,
        this.path,
        this.thumbnail,
        this.time,
        this.title,
    });

    factory AudioDetailModel.fromJson(Map<String, dynamic> json) => AudioDetailModel(
        id: json["_id"],
        artist: json["artist"],
        createdAt: DateTime.parse(json["createdAt"]),
        description: json["description"],
        isPremium: json["isPremium"],
        jobTitle: json["jobTitle"],
        languange: json["languange"],
        path: List<Path>.from(json["path"].map((x) => Path.fromJson(x))),
        thumbnail: List<Path>.from(json["thumbnail"].map((x) => Path.fromJson(x))),
        time: json["time"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "artist": artist,
        "createdAt": createdAt,
        "description": description,
        "isPremium": isPremium,
        "jobTitle": jobTitle,
        "languange": languange,
        "path": List<dynamic>.from(path!.map((x) => x.toJson())),
        "thumbnail": List<dynamic>.from(thumbnail!.map((x) => x.toJson())),
        "time": time,
        "title": title,
    };
}

class Path {
    String fileName;
    String url;

    Path({
        required this.fileName,
        required this.url,
    });

    factory Path.fromJson(Map<String, dynamic> json) => Path(
        fileName: json["fileName"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "fileName": fileName,
        "url": url,
    };
}
