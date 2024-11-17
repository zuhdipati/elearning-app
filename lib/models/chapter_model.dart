class ChapterModel {
    String id;
    List<CoursesId> coursesId;
    DateTime createdAt;
    List<CoursesId> lesson;
    String title;

    ChapterModel({
        required this.id,
        required this.coursesId,
        required this.createdAt,
        required this.lesson,
        required this.title,
    });

    factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
        id: json["_id"],
        coursesId: List<CoursesId>.from(json["coursesId"].map((x) => CoursesId.fromJson(x))),
        createdAt: DateTime.parse(json["createdAt"]),
        lesson: List<CoursesId>.from(json["lesson"].map((x) => CoursesId.fromJson(x))),
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "coursesId": List<dynamic>.from(coursesId.map((x) => x.toJson())),
        "createdAt": createdAt.toIso8601String(),
        "lesson": List<dynamic>.from(lesson.map((x) => x.toJson())),
        "title": title,
    };
}

class CoursesId {
    String id;
    String title;

    CoursesId({
        required this.id,
        required this.title,
    });

    factory CoursesId.fromJson(Map<String, dynamic> json) => CoursesId(
        id: json["_id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
    };
}
