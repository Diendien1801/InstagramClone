import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            // logo + noti + mess
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 20, top: 20),
                    width: 130,
                    child: const Image(
                      image: AssetImage('assets/img/logoIns.png'),
                      color: Colors.white,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12),
                    child: Transform.rotate(
                      angle: 270 * 3.14 / 180,
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                        size: 12,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 200),
                    child: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 16),
                    child: const Image(
                      image: AssetImage('assets/img/mess.png'),
                      color: Colors.white,
                      width: 16,
                      height: 16,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            // story

            Container(
              height: 110,
              width: double.infinity,
              child: ListView.builder(
                itemCount: userList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Story(index),
                ),
                scrollDirection: Axis.horizontal,
                physics: SlowScrollPhysics(),
              ),
            ),
            // post

            Expanded(
              child: ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                  child: PostWidget(index),
                ),
              ),
            ),
          ],
        ),
        // navigation bar

        bottomSheet: Container(
          height: 40,
          width: double.infinity,
          decoration: const BoxDecoration(
              color: Colors.black,
              border: Border(top: BorderSide(color: Colors.white60))),
          child: NavigatorBottom(),
        ),
      ),
    );
  }
}

class NavigatorBottom extends StatefulWidget {
  const NavigatorBottom({Key? key}) : super(key: key);

  @override
  _NavigatorBottomState createState() => _NavigatorBottomState();
}

class _NavigatorBottomState extends State<NavigatorBottom> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Home(),
        Container(
          margin: EdgeInsets.only(left: 40, right: 20),
          height: 20,
          width: 20,
          child: const Image(
            image: AssetImage('assets/img/searchActive.png'),
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 20),
          height: 20,
          width: 20,
          child: const Image(
            image: AssetImage('assets/img/more.png'),
            color: Colors.white,
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 40, right: 20),
          height: 26,
          width: 26,
          child: const Image(
            image: AssetImage('assets/img/reelUnActive.png'),
            color: Colors.white,
          ),
        ),
        //Search(),
        InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ProFile(),
            ),
          ),
          child: Container(
            margin: EdgeInsets.only(left: 40, right: 20),
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: const ClipOval(
              child: Image(
                image: AssetImage('assets/img/my.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}

// Profile Screen
class ProFile extends StatefulWidget {
  const ProFile({Key? key}) : super(key: key);

  @override
  _ProFileState createState() => _ProFileState();
}

class _ProFileState extends State<ProFile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: Column(
          children: [
            // Appbar
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: const Text(
                    '_di3n.qipq_',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 16, left: 10),
                  child: Transform.rotate(
                    angle: 270 * 3.14 / 180,
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 12,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 28, left: 180),
                  child: const Image(
                    image: AssetImage('assets/img/more.png'),
                    color: Colors.white,
                    width: 20,
                    height: 20,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: 26, left: 20),
                    child: const Icon(
                      Icons.menu,
                      color: Colors.white,
                      size: 26,
                    ))
              ],
            ),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, left: 20),
                  child: Story(0),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 40),
                  child: const Column(
                    children: [
                      Text(
                        '1',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Bài viết',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: const Column(
                    children: [
                      Text(
                        '95',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Người theo dõi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20, left: 20),
                  child: const Column(
                    children: [
                      Text(
                        '114',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Đang theo dõi',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: () => setState(() {
        isActive = !isActive;
      }),
      child: isActive
          ? Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 20,
              width: 20,
              child: const Image(
                image: AssetImage('assets/img/searchActive.png'),
                color: Colors.white60,
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 22,
              width: 22,
              child: const Image(
                image: AssetImage('assets/img/searchActive.png'),
                color: Colors.white,
              ),
            ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isActive = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() {
        isActive = !isActive;
      }),
      child: isActive
          ? Container(
              margin: EdgeInsets.only(left: 30, right: 20),
              height: 20,
              width: 20,
              child: const Image(
                image: AssetImage('assets/img/homeActive.png'),
                color: Colors.white,
              ),
            )
          : Container(
              margin: EdgeInsets.only(left: 30, right: 20),
              height: 20,
              width: 20,
              child: const Image(
                image: AssetImage('assets/img/homeUnActive.png'),
                color: Colors.white,
              ),
            ),
    );
  }
}

//  PostWidget
Widget PostWidget(index) {
  return Column(
    children: [
      Container(
        height: 1,
        color: Colors.white54,
      ),
      // Header of post
      Container(
        height: 40,
        width: double.infinity,
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 8, top: 8),
              height: 30,
              width: 30,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
              ),
              child: ClipOval(
                child: Image(
                  image: AssetImage(postList[index].img.toString()),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 50, top: 14),
              child: Text(
                postList[index].name.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            Positioned(
              top: 12,
              right: 8,
              child: Container(
                  height: 20,
                  width: 20,
                  child: const Icon(Icons.more_horiz, color: Colors.white)),
            ),
          ],
        ),
      ),
      // Image of post
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Image.asset(postList[index].imgPost.toString()),
      ),
      // Footer of post

      //1. Like, comment, share
      Container(
        margin: EdgeInsets.only(left: 16, top: 16, bottom: 12),
        child: Row(
          children: [
            likeButton(),
            Text(
              postList[index].like.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 3),
              height: 18,
              width: 18,
              child: const Image(
                image: AssetImage('assets/img/comment.png'),
                color: Colors.white,
              ),
            ),
            Text(
              postList[index].comment.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Container(
              margin: EdgeInsets.only(left: 10, right: 3),
              height: 16,
              width: 16,
              child: const Image(
                image: AssetImage('assets/img/share.png'),
                color: Colors.white,
              ),
            ),
            Text(
              postList[index].share.toString(),
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
            ),
            Favor(),
          ],
        ),
      ),
      //2. UserName + Caption

      Container(
        margin: EdgeInsets.only(left: 16, right: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 0),
                child: Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: '${postList[index].name} ',
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: postList[index].caption,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Container(
        margin: EdgeInsets.only(right: 248, top: 4),
        child: Text(
          'Xem tất cả bình luận',
          style: TextStyle(color: Colors.white60, fontSize: 12),
        ),
      ),

      // addComment
      Container(
        margin: EdgeInsets.only(left: 16, right: 16, top: 8),
        child: Row(
          children: [
            Container(
              height: 26,
              width: 26,
              decoration: const BoxDecoration(
                  color: Colors.white12, shape: BoxShape.circle),
              child: const ClipOval(
                child: Image(
                  image: AssetImage('assets/img/my.png'),
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 8),
              child: const Text(
                'Thêm bình luận...',
                style: TextStyle(color: Colors.white60, fontSize: 12),
              ),
            )
          ],
        ),
      ),
      //time
      Container(
        margin: EdgeInsets.only(right: 315, top: 8, bottom: 16),
        child: Text(
          postList[index].time.toString() + ' trước',
          style: TextStyle(color: Colors.white60, fontSize: 12),
        ),
      )
    ],
  );
}

// LikeButton with animation when tap
class likeButton extends StatefulWidget {
  const likeButton({Key? key}) : super(key: key);

  @override
  _likeButtonState createState() => _likeButtonState();
}

class _likeButtonState extends State<likeButton>
    with SingleTickerProviderStateMixin {
  bool isActive = false;
  late AnimationController _controller;
  late Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
    _animation = Tween<double>(begin: 1.0, end: 1.2).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isActive = !isActive;
        });
        _controller.forward().then((_) {
          _controller.reverse();
        });
      },
      child: ScaleTransition(
        scale: _animation!,
        child: isActive == false
            ? Container(
                margin: EdgeInsets.only(right: 3),
                child: const Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              )
            : Container(
                margin: EdgeInsets.only(right: 3),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                  size: 20,
                ),
              ),
      ),
    );
  }
}

// favor icon
class Favor extends StatefulWidget {
  const Favor({Key? key}) : super(key: key);

  @override
  _FavorState createState() => _FavorState();
}

class _FavorState extends State<Favor> {
  bool isFavor = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavor = !isFavor;
        });
      },
      child: Container(
        margin: EdgeInsets.only(left: 160, right: 3),
        height: 18,
        width: 18,
        child: isFavor
            ? const Image(
                image: AssetImage('assets/img/favor.png'),
                color: Colors.white,
              )
            : const Image(
                image: AssetImage('assets/img/favorActive.png'),
                color: Colors.white,
              ),
      ),
    );
  }
}

// scroll story slower
class SlowScrollPhysics extends BouncingScrollPhysics {
  const SlowScrollPhysics({ScrollPhysics? parent}) : super(parent: parent);

  @override
  SpringDescription get spring => SpringDescription.withDampingRatio(
        mass: 16,
        stiffness: 100.0,
        ratio: 6,
      );
}

// Story model
Widget Story(int index) {
  return index != 0
      ? Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(userList[index].img!),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                CustomPaint(
                  size: Size(70, 70),
                  painter: _BorderGradientPainter(),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              userList[index].name!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          ],
        )
      : Column(
          children: [
            Stack(
              children: [
                Container(
                  width: 70,
                  height: 70,
                  child: ClipOval(
                    child: Image(
                      image: AssetImage(userList[index].img!),
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                  ),
                ),
                Positioned(
                  height: 110,
                  right: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.add, color: Colors.white, size: 20),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              userList[index].name!,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 11,
                  fontWeight: FontWeight.w400),
            ),
          ],
        );
}

// CustomPainter for border gradient
class _BorderGradientPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final rect = Offset.zero & size;
    const gradient = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Color(0xFFfeda75), // Yellow
        Color(0xFFfa7e1e), // Orange
        Color(0xFFd62976), // Pink
        Color(0xFF4f5bd5), // Blue
      ],
      stops: [0.0, 0.33, 0.66, 1.0],
    );
    final paint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3;
    canvas.drawOval(rect, paint);

    // Draw a black border inside the gradient border
    final innerRect = rect.deflate(
        2); // Adjust this value to change the width of the black border
    final innerPaint = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth =
          2; // Adjust this value to change the thickness of the black border
    canvas.drawOval(innerRect, innerPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class User {
  String? img;
  String? name;

  User({this.img, this.name});
}

final List<User> userList = [
  User(img: 'assets/img/my.png', name: '_di3n.qipq_'),
  User(img: 'assets/img/mono.png', name: 'mono.hng'),
  User(img: 'assets/img/mtp.png', name: 'sontungmtp'),
  User(img: 'assets/img/soobin.png', name: 'soobin.hoangson'),
  User(img: 'assets/img/taylor.png', name: 'taylorSwift'),
  User(img: 'assets/img/drake.png', name: 'chamagnepapi'),
  User(img: 'assets/img/wren.png', name: 'wrenevans___'),
];

// Post model
class Post {
  String? img;
  String? name;
  String? time;
  String? imgPost;
  String? like;
  String? comment;
  String? share;
  String? caption;

  Post(
      {this.img,
      this.name,
      this.time,
      this.imgPost,
      this.like,
      this.comment,
      this.share,
      this.caption});
}

final List<Post> postList = [
  Post(
      img: 'assets/img/mono.png',
      name: 'mono.hng',
      time: '1h',
      imgPost: 'assets/img/post1.png',
      like: '1.1k',
      comment: '1.3k',
      share: '6.4k',
      caption:
          'Xin chào cả nhà. Vào này 26/4/2021, mình sẽ tham gia chương trình STORII Teller. Mọi người hãy cùng chờ đón nhé'),
  Post(
      img: 'assets/img/mtp.png',
      name: 'sontungmtp',
      time: '2h',
      imgPost: 'assets/img/post2.png',
      like: '2.1k',
      comment: '2.3k',
      share: '7.4k',
      caption: 'Ừ thì 🌼'),
  Post(
      img: 'assets/img/wren.png',
      name: 'wren___',
      time: '3h',
      imgPost: 'assets/img/post3.png',
      like: '3.1k',
      comment: '3.3k',
      share: '8.4k',
      caption: 'Thành tựu nho nhỏ ✨'),
];
