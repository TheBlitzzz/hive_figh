part of pages;

class SocialsPage extends StatefulWidget {
  const SocialsPage({Key? key}) : super(key: key);

  @override
  State<SocialsPage> createState() => _SocialsPageState();
}

class _SocialsPageState extends State<SocialsPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: const [
          SizedBox(height: 60),
          FractionallySizedBox(
              widthFactor: 0.7,
              child: TextField(

              decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                  // borderRadius: BorderRadius.circular(10),
              ),
              hintText: 'Search',
              isDense: true,                      // Added this
              filled: true,
              contentPadding: EdgeInsets.all(6),
              fillColor: Colors.grey,
            ),
          )),
        ],
      ),
    );
  }
}
