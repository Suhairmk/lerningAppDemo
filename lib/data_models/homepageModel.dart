// To parse this JSON data, do
//
//     final model = modelFromJson(jsonString);

import 'dart:convert';

Model modelFromJson(String str) => Model.fromJson(json.decode(str));

String modelToJson(Model data) => json.encode(data.toJson());

class Model {
    int status;
    String message;
    Data data;

    Model({
        required this.status,
        required this.message,
        required this.data,
    });

    factory Model.fromJson(Map<String, dynamic> json) => Model(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
    };
}

class Data {
    Userdata userdata;
    List<dynamic> testimonial;
    List<AdBanner> adBanner;
    List<Course> topCourses;
    List<Course> trendingCourses;
    List<dynamic> demoVideos;
    List<dynamic> demoQuizzes;
    String currentAffairsImageUrl;
    String showScholarshipRegistration;
    String imageScholarshipRegistration;
    String urlScholarshipRegistration;
    String showScholarshipExam;
    String imageScholarshipExam;
    String urlScholarshipExam;

    Data({
        required this.userdata,
        required this.testimonial,
        required this.adBanner,
        required this.topCourses,
        required this.trendingCourses,
        required this.demoVideos,
        required this.demoQuizzes,
        required this.currentAffairsImageUrl,
        required this.showScholarshipRegistration,
        required this.imageScholarshipRegistration,
        required this.urlScholarshipRegistration,
        required this.showScholarshipExam,
        required this.imageScholarshipExam,
        required this.urlScholarshipExam,
    });

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        userdata: Userdata.fromJson(json["userdata"]),
        testimonial: List<dynamic>.from(json["testimonial"].map((x) => x)),
        adBanner: List<AdBanner>.from(json["ad_banner"].map((x) => AdBanner.fromJson(x))),
        topCourses: List<Course>.from(json["top_courses"].map((x) => Course.fromJson(x))),
        trendingCourses: List<Course>.from(json["trending_courses"].map((x) => Course.fromJson(x))),
        demoVideos: List<dynamic>.from(json["demo_videos"].map((x) => x)),
        demoQuizzes: List<dynamic>.from(json["demo_quizzes"].map((x) => x)),
        currentAffairsImageUrl: json["current_affairs_image_url"],
        showScholarshipRegistration: json["show_scholarship_registration"],
        imageScholarshipRegistration: json["image_scholarship_registration"],
        urlScholarshipRegistration: json["url_scholarship_registration"],
        showScholarshipExam: json["show_scholarship_exam"],
        imageScholarshipExam: json["image_scholarship_exam"],
        urlScholarshipExam: json["url_scholarship_exam"],
    );

    Map<String, dynamic> toJson() => {
        "userdata": userdata.toJson(),
        "testimonial": List<dynamic>.from(testimonial.map((x) => x)),
        "ad_banner": List<dynamic>.from(adBanner.map((x) => x.toJson())),
        "top_courses": List<dynamic>.from(topCourses.map((x) => x.toJson())),
        "trending_courses": List<dynamic>.from(trendingCourses.map((x) => x.toJson())),
        "demo_videos": List<dynamic>.from(demoVideos.map((x) => x)),
        "demo_quizzes": List<dynamic>.from(demoQuizzes.map((x) => x)),
        "current_affairs_image_url": currentAffairsImageUrl,
        "show_scholarship_registration": showScholarshipRegistration,
        "image_scholarship_registration": imageScholarshipRegistration,
        "url_scholarship_registration": urlScholarshipRegistration,
        "show_scholarship_exam": showScholarshipExam,
        "image_scholarship_exam": imageScholarshipExam,
        "url_scholarship_exam": urlScholarshipExam,
    };
}

class AdBanner {
    String id;
    String image;
    String link;

    AdBanner({
        required this.id,
        required this.image,
        required this.link,
    });

    factory AdBanner.fromJson(Map<String, dynamic> json) => AdBanner(
        id: json["id"],
        image: json["image"],
        link: json["link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "link": link,
    };
}

class Course {
    String id;
    String title;
    String description;
    String shortDescription;
    String thumbnail;
    String price;
    dynamic isFreeCourse;
    int rating;
    int numberOfRatings;
    String totalEnrollment;
    String duration;
    int totalLessons;
    String shareableLink;

    Course({
        required this.id,
        required this.title,
        required this.description,
        required this.shortDescription,
        required this.thumbnail,
        required this.price,
        required this.isFreeCourse,
        required this.rating,
        required this.numberOfRatings,
        required this.totalEnrollment,
        required this.duration,
        required this.totalLessons,
        required this.shareableLink,
    });

    factory Course.fromJson(Map<String, dynamic> json) => Course(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        shortDescription: json["short_description"],
        thumbnail: json["thumbnail"],
        price: json["price"],
        isFreeCourse: json["is_free_course"],
        rating: json["rating"],
        numberOfRatings: json["number_of_ratings"],
        totalEnrollment: json["total_enrollment"],
        duration: json["duration"],
        totalLessons: json["total_lessons"],
        shareableLink: json["shareable_link"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "short_description": shortDescription,
        "thumbnail": thumbnail,
        "price": price,
        "is_free_course": isFreeCourse,
        "rating": rating,
        "number_of_ratings": numberOfRatings,
        "total_enrollment": totalEnrollment,
        "duration": duration,
        "total_lessons": totalLessons,
        "shareable_link": shareableLink,
    };
}

class Userdata {
    String id;
    String userId;
    String name;
    String phone;
    String deviceId;
    String deviceIdMessage;
    String courseId;
    bool isPurchased;
    String courseName;
    String batchName;
    String batchId;
    String image;
    String queryNumber;
    String instContactPhone;
    String instContactEmail;
    String instContactAddress;
    String privacyPolicy;
    String dynamicLink;
    String information;
    String androidVersion;
    String iosVersion;
    String showSwitchCourse;
    int showAddLiveClass;
    String showExam;
    String showPractice;
    String showMaterial;
    int showExternalExam;
    String zoomId;
    String zoomPassword;
    String zoomApiKey;
    String zoomSecretKey;
    String zoomWebDomain;

    Userdata({
        required this.id,
        required this.userId,
        required this.name,
        required this.phone,
        required this.deviceId,
        required this.deviceIdMessage,
        required this.courseId,
        required this.isPurchased,
        required this.courseName,
        required this.batchName,
        required this.batchId,
        required this.image,
        required this.queryNumber,
        required this.instContactPhone,
        required this.instContactEmail,
        required this.instContactAddress,
        required this.privacyPolicy,
        required this.dynamicLink,
        required this.information,
        required this.androidVersion,
        required this.iosVersion,
        required this.showSwitchCourse,
        required this.showAddLiveClass,
        required this.showExam,
        required this.showPractice,
        required this.showMaterial,
        required this.showExternalExam,
        required this.zoomId,
        required this.zoomPassword,
        required this.zoomApiKey,
        required this.zoomSecretKey,
        required this.zoomWebDomain,
    });

    factory Userdata.fromJson(Map<String, dynamic> json) => Userdata(
        id: json["id"],
        userId: json["user_id"],
        name: json["name"],
        phone: json["phone"],
        deviceId: json["device_id"],
        deviceIdMessage: json["device_id_message"],
        courseId: json["course_id"],
        isPurchased: json["is_purchased"],
        courseName: json["course_name"],
        batchName: json["batch_name"],
        batchId: json["batch_id"],
        image: json["image"],
        queryNumber: json["query_number"],
        instContactPhone: json["inst_contact_phone"],
        instContactEmail: json["inst_contact_email"],
        instContactAddress: json["inst_contact_address"],
        privacyPolicy: json["privacy_policy"],
        dynamicLink: json["dynamic_link"],
        information: json["information"],
        androidVersion: json["android_version"],
        iosVersion: json["ios_version"],
        showSwitchCourse: json["show_switch_course"],
        showAddLiveClass: json["show_add_live_class"],
        showExam: json["show_exam"],
        showPractice: json["show_practice"],
        showMaterial: json["show_material"],
        showExternalExam: json["show_external_exam"],
        zoomId: json["zoom_id"],
        zoomPassword: json["zoom_password"],
        zoomApiKey: json["zoom_api_key"],
        zoomSecretKey: json["zoom_secret_key"],
        zoomWebDomain: json["zoom_web_domain"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "name": name,
        "phone": phone,
        "device_id": deviceId,
        "device_id_message": deviceIdMessage,
        "course_id": courseId,
        "is_purchased": isPurchased,
        "course_name": courseName,
        "batch_name": batchName,
        "batch_id": batchId,
        "image": image,
        "query_number": queryNumber,
        "inst_contact_phone": instContactPhone,
        "inst_contact_email": instContactEmail,
        "inst_contact_address": instContactAddress,
        "privacy_policy": privacyPolicy,
        "dynamic_link": dynamicLink,
        "information": information,
        "android_version": androidVersion,
        "ios_version": iosVersion,
        "show_switch_course": showSwitchCourse,
        "show_add_live_class": showAddLiveClass,
        "show_exam": showExam,
        "show_practice": showPractice,
        "show_material": showMaterial,
        "show_external_exam": showExternalExam,
        "zoom_id": zoomId,
        "zoom_password": zoomPassword,
        "zoom_api_key": zoomApiKey,
        "zoom_secret_key": zoomSecretKey,
        "zoom_web_domain": zoomWebDomain,
    };
}
