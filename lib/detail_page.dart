import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:hy_skymovies/home_page.dart';
import 'package:readmore/readmore.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.movies}) : super(key: key);
  final NewMovies movies;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: SizedBox(
          height: 69,
          width: 319,
          child: FloatingActionButton(
            backgroundColor: Color(0x1AFFFFFF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.play_arrow_rounded,
                  size: 32,
                ),
                SizedBox(width: 13),
                Text(
                  'Дивитись',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Color(0xFF16122B),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 373,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.vertical(
                      bottom: Radius.circular(50),
                    ),
                    image: DecorationImage(
                      image: AssetImage(movies.imageUrl),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 30,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          height: 46,
                          width: 46,
                          decoration: BoxDecoration(
                            color: Color(0x33FFFFFF),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.arrow_back_rounded,
                              size: 24,
                              color: Color(0xFFFFFFFF),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 46,
                        width: 46,
                        decoration: BoxDecoration(
                          color: Color(0x33FFFFFF),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Center(
                          child: Icon(
                            Icons.bookmark_border_rounded,
                            size: 24,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                movies.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFFFFFFFF),
                ),
              ),
            ),
            SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                children: [
                  RatingBar.builder(
                    initialRating: movies.rate.toDouble(),
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
                  SizedBox(width: 20),
                  Text(
                    movies.year.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80FFFFFF),
                    ),
                  ),
                  SizedBox(width: 20),
                  Text(
                    movies.duration,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Color(0x80FFFFFF),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 10),
            TabBar(
              unselectedLabelColor: Color(0x80FFFFFF),
              indicatorColor: Color(0xFF004A90),
              indicatorSize: TabBarIndicatorSize.label,
              tabs: const [
                Tab(
                  text: 'Опис',
                ),
                Tab(
                  text: 'Галерея',
                ),
                Tab(
                  text: 'Відгуки',
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: SizedBox(
                height: 120,
                child: TabBarView(
                  children: const [
                    ReadMoreText(
                      'Джуманджі — захоплююча гра, що притягує до себе любителів пригод. Однак, коли інші члени команди знову повернулися в гру, вони з подивом дізнаються, що діючі правила змінилися. Тепер усе йде шкереберть, і ...',
                      style: TextStyle(
                        height: 1.7,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                      trimLines: 4,
                      // colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      moreStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF004A90),
                      ),
                    ),
                    ReadMoreText(
                      'Джуманджі — захоплююча гра, що притягує до себе любителів пригод. Однак, коли інші члени команди знову повернулися в гру, вони з подивом дізнаються, що діючі правила змінилися. Тепер усе йде шкереберть, і ...',
                      style: TextStyle(
                        height: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                      trimLines: 4,
                      // colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      moreStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF004A90),
                      ),
                    ),
                    ReadMoreText(
                      'Джуманджі — захоплююча гра, що притягує до себе любителів пригод. Однак, коли інші члени команди знову повернулися в гру, вони з подивом дізнаються, що діючі правила змінилися. Тепер усе йде шкереберть, і ...',
                      style: TextStyle(
                        height: 2,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFFFFFFFF),
                      ),
                      trimLines: 4,
                      // colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: 'Read more',
                      moreStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF004A90),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
