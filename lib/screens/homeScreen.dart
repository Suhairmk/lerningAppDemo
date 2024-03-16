import 'package:carousel_slider/carousel_slider.dart';
import 'package:courceapp/screens/courseScreen.dart';
import 'package:courceapp/data_models/homepageModel.dart';
import 'package:courceapp/screens/feedScreen.dart';
import 'package:courceapp/utils/api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  int _currentIndex = 0;
  int _current = 0;
  final CarouselController _controller = CarouselController();

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIndex);
    getData();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void getData() async {
    await getHomeDetails();
    await getCource();
    await getFeedDatas();
    setState(() {}); 
  }

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 300), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    var mediaqry = MediaQuery.of(context).size;
    List<Widget> images = [];
    for (AdBanner banner in homeData!.data.adBanner) {
      images.add(
        ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            banner.image.toString(),
            width: double.infinity,
            height: 150,
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    if (images.length == null || homeData == null) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Color(0XFFEBF5FB),
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Color(0XFFEBF5FB),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _currentIndex = 2;
              });
            },
            icon: Icon(
              Icons.notifications,
              color: Colors.blue,
            ),
          )
        ],
      ),
      body: homeData == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          CarouselSlider(
                            carouselController: _controller,
                            items: images,
                            options: CarouselOptions(
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                              autoPlay: true,
                              enlargeCenterPage: true,
                              viewportFraction: 0.9,
                              aspectRatio: 2.0,
                              initialPage: 2,
                            ),
                          ),
                          Positioned(
                            bottom: 2,
                            left: mediaqry.width * 0.40,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: images.asMap().entries.map((entry) {
                                return GestureDetector(
                                  onTap: () =>
                                      _controller.animateToPage(entry.key),
                                  child: Container(
                                    width: 8.0,
                                    height: 8.0,
                                    margin: EdgeInsets.symmetric(
                                        vertical: 8.0, horizontal: 4.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: (Theme.of(context).brightness ==
                                                    Brightness.dark
                                                ? Colors.white
                                                : Colors.yellow)
                                            .withOpacity(_current == entry.key
                                                ? 0.9
                                                : 0.4)),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Our Programmes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            height: mediaqry.height * .0015,
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemCount: homeData!.data.trendingCourses.length,
                          itemBuilder: (BuildContext context, int index) {
                            List<Course> coursedata =
                                homeData!.data.trendingCourses;

                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                coursedata[index].thumbnail ??
                                                    ''),
                                            fit: BoxFit.cover)),
                                    height: 70,
                                    width: double.infinity,
                                  ),
                                  Text(
                                    coursedata[index].title,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 80,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(15)),
                              child: ListTile(
                                title: Text(
                                  'Explore',
                                  style: TextStyle(fontSize: 10),
                                ),
                                subtitle: Text('Monthly Current Affires',
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold)),
                                trailing: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        shape: CircleBorder()),
                                    onPressed: () {},
                                    child: Icon(Icons.arrow_forward)),
                                leading: SizedBox(
                                  width: 40,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: -1,
                            left: 25,
                            child: Container(
                              height: 70,
                              width: 50,
                              child: Image(
                                  image: AssetImage('assets/images/books.png')),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                CourseScreen(),
                Notifications(),
                FeedScreen()
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets_outlined),
            label: 'My Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Transform.rotate(
              angle: .8,
              child: Icon(
                Icons.wifi,
                grade: 3,
              ),
            ),
            label: 'Feed',
          ),
        ],
        currentIndex: _currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        selectedIconTheme: IconThemeData(size: 28),
        unselectedIconTheme: IconThemeData(size: 25),
        selectedFontSize: 10,
        onTap: _onItemTapped,
      ),
    );
  }
}

//Notification Screen
class Notifications extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('No Notifications'),
      ),
    );
  }
}
