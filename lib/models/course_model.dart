class CourseModel {
    String id;
    String? author;
    String? category;
    List<Chapter> chapter;
    DateTime createdAt;
    List<Path>? path;
    String title;

    CourseModel({
        required this.id,
        required this.author,
        required this.category,
        required this.chapter,
        required this.createdAt,
        required this.path,
        required this.title,
    });

    factory CourseModel.fromJson(Map<String, dynamic> json) => CourseModel(
        id: json["_id"],
        author: json["author"],
        category: json["category"],
        chapter: List<Chapter>.from(json["chapter"].map((x) => Chapter.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        path: json["path"] == null ? [] : List<Path>.from(json["path"]!.map((x) => Path.fromJson(x))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "author": author,
        "category": category,
        "chapter": List<dynamic>.from(chapter.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "path": path == null ? [] : List<dynamic>.from(path!.map((x) => x.toJson())),
        "title": title,
    };
}

class Chapter {
    String id;
    String title;

    Chapter({
        required this.id,
        required this.title,
    });

    factory Chapter.fromJson(Map<String, dynamic> json) => Chapter(
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
