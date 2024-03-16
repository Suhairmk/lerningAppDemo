import 'package:courceapp/data_models/FeedModel.dart';
import 'package:courceapp/data_models/course_Model.dart';
import 'package:courceapp/data_models/homepageModel.dart';
import 'package:dio/dio.dart';

final dio = Dio();

Model? homeData;
CourseModel? coursedata;
FeedModel? feedData;

Future<void> getHomeDetails() async {
  try {
    final response = await Dio().get(
        'https://trogon.info/tutorpro/lms_demo/api/home_page_data?auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ2YWxpZGl0eSI6MSwic3RhdHVzIjoxLCJkZXZpY2VfaWQiOiJhOGMwZWIxYjA3YjEzNTEzIiwidmFsaWRpdHlfbWVzc2FnZSI6IkxvZ2luIFN1Y2Nlc3NmdWwiLCJ1c2VyX2lkIjoiMTQiLCJuYW1lIjoiYWRlZWIgdGVzdCAiLCJlbWFpbCI6IjkxOTY1NjY3MDg2NyIsInJvbGUiOiJ1c2VyIn0.dgRNiQdBNzZ_tGoPMxu3aqBuveTG8zrT3zZheVhYpQ4');

    if (response.statusCode == 200) {
      Model model = Model.fromJson(response.data);
      homeData = model;
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> getCource() async {
  try {
    final response = await Dio().get(
        'https://trogon.info/tutorpro/lms_demo/api/my_course_data?auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ2YWxpZGl0eSI6MSwic3RhdHVzIjoxLCJkZXZpY2VfaWQiOiJhOGMwZWIxYjA3YjEzNTEzIiwidmFsaWRpdHlfbWVzc2FnZSI6IkxvZ2luIFN1Y2Nlc3NmdWwiLCJ1c2VyX2lkIjoiMTQiLCJuYW1lIjoiYWRlZWIgdGVzdCAiLCJlbWFpbCI6IjkxOTY1NjY3MDg2NyIsInJvbGUiOiJ1c2VyIn0.dgRNiQdBNzZ_tGoPMxu3aqBuveTG8zrT3zZheVhYpQ4');

    if (response.statusCode == 200) {
      CourseModel model = CourseModel.fromJson(response.data);
      coursedata = model;

      print(coursedata);
    }
  } catch (e) {
    print('Error: $e');
  }
}

Future<void> getFeedDatas() async {
  try {
    final response = await Dio().get(
        'https://focusarea.in/app/api/feed?auth_token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ2YWxpZGl0eSI6MSwic3RhdHVzIjoxLCJkZXZpY2VfaWQiOiJhOWExZDBjNDYzMjk4Zjc5IiwidmFsaWRpdHlfbWVzc2FnZSI6IkxvZ2luIFN1Y2Nlc3NmdWwiLCJ1c2VyX2lkIjoiMTA5MjEiLCJmaXJzdF9uYW1lIjoiaGlzaGFtIiwibGFzdF9uYW1lIjoiIiwiZW1haWwiOiI5MTg2MDYwMTc1MjciLCJyb2xlIjoidXNlciJ9.fg9qT6E2rPpxlQDHuwJ0Nyr27Vt5noaQoA9uLeDpIwQ');

    if (response.statusCode == 200) {
      FeedModel model = FeedModel.fromJson(response.data);
      feedData = model;

      print(feedData);
    }
  } catch (e) {
    print('Error: $e');
  }
}
