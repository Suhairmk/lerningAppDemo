import 'package:courceapp/utils/api.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseScreen extends StatefulWidget {
  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    getData();
    super.initState();
  }

  void getData() async {
    await getCource();
    setState(() {}); // Update the UI after getting data
  }

  @override
  Widget build(BuildContext context) {
    if (homeData.toString().isEmpty || coursedata.toString().isEmpty) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Color(0XFFEBF5FB),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '${homeData?.data?.userdata?.name ?? 'Null Name'} ${homeData?.data?.userdata?.id ?? 'Null ID'}',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Card(
                            color: Color(0XFFEAFAF1),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Text(
                                    'Digital Marketing Certification',
                                    style: TextStyle(fontSize: 9),
                                  ),
                                  SizedBox(width: 10),
                                  Container(
                                    width: 70,
                                    height: 20,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Change',
                                        style: TextStyle(
                                            fontSize: 6, color: Colors.white),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.blue,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.cyan[100]),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/128/711/711245.png'),
                              ),
                              Text(
                                'Live Class',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.network(
                                  'https://cdn-icons-png.flaticon.com/128/10822/10822387.png',
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                'Practice',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                height: 30,
                                width: 30,
                                child: Image.network(
                                    'https://cdn-icons-png.flaticon.com/128/5164/5164253.png'),
                              ),
                              Text(
                                'Exam',
                                style: TextStyle(fontSize: 10),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 280,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 1),
                    itemCount: coursedata!.data.subjects.length,
                    itemBuilder: (BuildContext context, int index) {
                      if (coursedata.toString().isEmpty) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  coursedata!.data.subjects[index].background),
                              child: Image.network(
                                  coursedata!.data.subjects[index].icon),
                            ),
                            Text(
                              coursedata!.data.subjects[index].title,
                              style: TextStyle(
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
            Positioned(
              right: 35,
              top: 7,
              child: CircleAvatar(
                backgroundImage:
                    NetworkImage(homeData?.data?.userdata?.image ?? ''),
                radius: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
