String baseUrl = "https://api.kontenbase.com/query/api/v1";
String key = "2810aabc-9dc5-4d37-8ff1-fd579e9d6f0c";

String urlLogin = "$baseUrl/$key/auth/login";


String urlCourse = "$baseUrl/$key/courses?%24lookup=*";
String urlCourseDetail(String? id) => "$baseUrl/$key/courses/$id?%24lookup=*";
String urlCourseChapter(String? id) => "$baseUrl/$key/chapter/$id?%24lookup=*";
String urlCourseLesson(String? id) => "$baseUrl/$key/lesson/$id?%24lookup=*";

String urlAudio = "$baseUrl/$key/audio?%24lookup=*";
String urlAudioDetail(String? id) => "$baseUrl/$key/audio/$id?%24lookup=*";
