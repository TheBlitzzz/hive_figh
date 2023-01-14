part of pages;

class MainPage extends StatefulWidget {
  final Widget mainContent;

  const MainPage(this.mainContent, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: SingleChildScrollView(
        child: widget.mainContent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Am an advisor");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("You have activated the advisor"),
            action: SnackBarAction(
              label: 'Dismiss',
              onPressed: () {
                debugPrint("Dismissed");
              },
            ),
          ));
        },
        child: Icon(Icons.chat),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: "Game",
          ),
        ],
      ),
    );
  }
}
