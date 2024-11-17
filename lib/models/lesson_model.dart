class LessonModel {
    String id;
    List<ChapterId> chapterId;
    DateTime createdAt;
    List<Path> path;
    String title;

    LessonModel({
        required this.id,
        required this.chapterId,
        required this.createdAt,
        required this.path,
        required this.title,
    });

    factory LessonModel.fromJson(Map<String, dynamic> json) => LessonModel(
        id: json["_id"],
        chapterId: List<ChapterId>.from(json["chapterId"].map((x) => ChapterId.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        path: List<Path>.from(json["path"].map((x) => Path.fromJson(x))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "chapterId": List<dynamic>.from(chapterId.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "path": List<dynamic>.from(path.map((x) => x.toJson())),
        "title": title,
    };
}

class ChapterId {
    String id;
    String title;

    ChapterId({
        required this.id,
        required this.title,
    });

    factory ChapterId.fromJson(Map<String, dynamic> json) => ChapterId(
        id: json["_id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
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
