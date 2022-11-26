import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hy_skymovies/detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF16122B),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 130,
                    height: 21,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.search,
                      size: 24,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Stack(
                children: [
                  Container(
                    height: 130,
                    width: 315,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/banner.jpeg'),
                        fit: BoxFit.fill,
                        scale: 50,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  Container(
                    height: 130,
                    width: 315,
                    decoration: BoxDecoration(
                      color: Color(0xFF0A3068).withOpacity(.69),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        '-50% На сімейну підписку!',
                        style: TextStyle(
                          color: Color(0xFFFFFFFF),
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 26),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Новинки',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 278,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.horizontal,
                itemCount: listNewMovies.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 18);
                },
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPage(
                            movies: listNewMovies[index],
                          ),
                        ),
                      );
                    },
                    child: SizedBox(
                      height: 278,
                      width: 146,
                      child: Column(
                        children: [
                          Container(
                            height: 211,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                image:
                                    AssetImage(listNewMovies[index].imageUrl),
                              ),
                            ),
                          ),
                          Text(
                            listNewMovies[index].title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                          Text(
                            listNewMovies[index].genre,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFFFFFFFF).withOpacity(0.5),
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: listNewMovies[index].rate.toDouble(),
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemSize: 20,
                            itemCount: 5,
                            unratedColor: Color(0xFF004A90).withOpacity(0.5),
                            itemBuilder: (context, _) => Icon(
                              Icons.star,
                              color: Color(0xFF004A90),
                            ),
                            onRatingUpdate: (rating) {
                              // print(rating);
                            },
                          ),
                          // Text(listNewMovies[index].rate.toString()),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Жанри',
                style: TextStyle(
                  color: Color(0xFFFFFFFF),
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 82,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 30),
                scrollDirection: Axis.horizontal,
                itemCount: listCategory.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(width: 18);
                },
                itemBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 82,
                    width: 91,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0x1AFFFFFF),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 16),
                            ImageIcon(
                              AssetImage(listCategory[index].imageUrl),
                              size: 32,
                              color: index == _selectedIndex
                                  ? Color(0xFF004A90)
                                  : Color(0xFFFFFFFF),
                            ),
                            SizedBox(height: 6),
                            Text(
                              listCategory[index].category,
                              style: TextStyle(
                                color: index == _selectedIndex
                                    ? Color(0xFF004A90)
                                    : Color(0xFFFFFFFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xFF16122B),
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Color(0xFF004A90),
        unselectedItemColor: Color(0xFFFFFFFF),
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Home.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Download.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Bookmark.png'),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/images/Profile.png'),
            ),
            label: '',
          ),
        ],
      ),
    );
  }
}

class CategoryMovies {
  final String imageUrl;
  final String category;
  CategoryMovies({
    required this.imageUrl,
    required this.category,
  });
}

List<CategoryMovies> listCategory = [
  CategoryMovies(
    imageUrl: 'assets/images/theatre1.png',
    category: 'Комедії',
  ),
  CategoryMovies(
    imageUrl: 'assets/images/theatre2.png',
    category: 'Драми',
  ),
  CategoryMovies(
    imageUrl: 'assets/images/gun1.png',
    category: 'Бойовики',
  ),
  CategoryMovies(
    imageUrl: 'assets/images/theatre1.png',
    category: 'Комедії',
  ),
];

class NewMovies {
  final String imageUrl;
  final String title;
  final String genre;
  final String duration;
  final int year;
  final int rate;
  NewMovies({
    required this.imageUrl,
    required this.title,
    required this.genre,
    required this.duration,
    required this.year,
    required this.rate,
  });
}

List<NewMovies> listNewMovies = [
  NewMovies(
    imageUrl: 'assets/images/film1.png',
    title: 'Небеса зачекають',
    genre: 'Комедія',
    rate: 4,
    duration: '1 jam 30 menit',
    year: 2021,
  ),
  NewMovies(
    imageUrl: 'assets/images/film2.png',
    title: 'Світ майбутнього',
    genre: 'Бойовик',
    rate: 5,
    duration: '1 jam 50 menit',
    year: 2020,
  ),
  NewMovies(
    imageUrl: 'assets/images/film3.png',
    title: 'Полювання на Са...',
    genre: 'Комедія',
    rate: 4,
    duration: '1 jam 45 menit',
    year: 2022,
  ),
];
