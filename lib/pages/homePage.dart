import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> images = [
    "assets/images/user_1.jpeg",
    "assets/images/user_2.jpeg",
    "assets/images/user_3.jpeg"
  ];
  List<String> feeds = [
    "assets/images/feed_1.jpeg",
    "assets/images/feed_2.jpeg",
    "assets/images/feed_3.jpeg"
  ];
  List<String> names = ["Sylvester", "Lavina", "Jazmin"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Feather.camera,
            color: Colors.grey,
          ),
        ),
        title: Text(
          "Instagram",
          style: TextStyle(color: Colors.grey),
        ),
        actions: [
          Icon(
            Feather.tv,
            color: Colors.grey,
          ),
          SizedBox(
            width: 16,
          ),
          Icon(
            Feather.send,
            color: Colors.grey,
          ),
          SizedBox(
            width: 8,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //
            Container(
              height: 20,
              margin: EdgeInsets.symmetric(vertical: 8, horizontal: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Stories",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                  Text(
                    "Watch All",
                    style: TextStyle(color: Colors.grey, fontSize: 14),
                  ),
                ],
              ),
            ),
            //
            Container(
              width: double.infinity,
              height: 108,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return StoryCard(
                        images: images[index % 3], names: names[index % 3]);
                  }),
            ),
            //
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return PostCard(
                      images: images[index % 3],
                      names: names[index % 3],
                      feeds: feeds[index % 3]);
                })
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    Key key,
    @required this.images,
    @required this.names,
    @required this.feeds,
  }) : super(key: key);

  final String images;
  final String names;
  final String feeds;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage("$images"), fit: BoxFit.cover)),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$names",
                style: TextStyle(color: Colors.grey, fontSize: 12),
              ),
              Spacer(),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_horiz,
                  color: Colors.grey,
                  size: 20,
                ),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          FadeInImage(
            placeholder: Image.asset("assets/image/placeholder.png").image,
            image: Image.asset("$feeds").image,
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Icons.favorite_border,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    MaterialCommunityIcons.chat_outline,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 4,
                ),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Feather.send,
                    color: Colors.grey,
                  ),
                ),
                Spacer(),
                InkWell(
                  onTap: () {},
                  child: Icon(
                    Feather.bookmark,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          //
          Container(
            width: double.infinity,
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Liked by ",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: "Sigmud, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Yessenia, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "Diana, ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                  TextSpan(
                    text: "1233 others ",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                  TextSpan(
                    text: "February 2020 ",
                    style: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryCard extends StatelessWidget {
  const StoryCard({
    Key key,
    @required this.images,
    @required this.names,
  }) : super(key: key);

  final String images;
  final String names;

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 100,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 2, color: Colors.purple[700]),
              image: DecorationImage(
                  image: AssetImage("$images"), fit: BoxFit.cover),
            ),
          ),
          Text(
            "$names",
            style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w600),
          ),
        ],
      ),
    );
  }
}
