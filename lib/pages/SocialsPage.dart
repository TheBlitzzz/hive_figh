part of pages;

class SocialsPage extends StatefulWidget {
  const SocialsPage({Key? key}) : super(key: key);

  @override
  State<SocialsPage> createState() => _SocialsPageState();
}

class _SocialsPageState extends State<SocialsPage> {
  List<SocialPostModel> posts = [
    SocialPostModel(
        "john123",
        "I found a fun way to use this app!\nSimply go into the ‘Protect’ tab, then...",
        ["Protect"],
        false,
        numberOfLikes: 1242),
    SocialPostModel(
        "kaiqin",
        "Pizza Hut has partnered up with RHB to provide free coupons! Click here to..",
        ["Earn"],
        false,
        numberOfLikes: 834),
    SocialPostModel(
        "cactus_bread",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation",
        ["Protect"],
        true,
        numberOfLikes: 130),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> postWidgets = [];
    for (var post in posts) {
      Widget postWidget = post.buildPostWidget();
      postWidgets.add(postWidget);
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
      child: Center(
        child: Column(
          children: [
            const FractionallySizedBox(
              widthFactor: 0.7,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      // borderRadius: BorderRadius.circular(10),
                      ),
                  hintText: 'Search',
                  isDense: true, // Added this
                  filled: true,
                  contentPadding: EdgeInsets.all(6),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              child:
                  const Text("Trends for you", style: TextStyle(fontSize: 20)),
              alignment: Alignment.centerLeft,
            ),
            const SizedBox(height: 5),
            Container(
              child: const Text("#RHB Benefits"),
              alignment: Alignment.centerLeft,
            ),
            Column(children: postWidgets),
          ],
        ),
      ),
    );
  }
}

class SocialPostModel {
  final String author;
  final String message;
  final List<String> tags;
  final bool isLong;

  int numberOfLikes = 0;

  SocialPostModel(this.author, this.message, this.tags, this.isLong,
      {this.numberOfLikes = 0});

  Widget buildPostWidget() {
    String tagsConcat = "";
    for (var element in tags) {
      tagsConcat += "#" + element;
    }

    return Card(
      color: Colors.grey[300],
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(4.0),
              color: Colors.grey[100],
              child: Text(tagsConcat, style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 10),
            Text(message),
            SizedBox(height: 10),
            Row(
              children: [
                const Icon(Icons.thumb_up_alt_sharp),
                Text(numberOfLikes.toString()),
                SizedBox(width: 200),
                Text(author)
              ],
            ),
          ],
        ),
      ),
      margin: EdgeInsets.all(10.0),
    );
  }
}
