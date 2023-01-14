part of pages;

class MainPage extends StatefulWidget {
  final String title;
  final Widget mainContent;

  const MainPage(this.title, this.mainContent, {Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  String _title = "Home";
  Widget _mainContent = const HomePage();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(_title),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: _mainContent,
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
        onTap: (index) {
          if (currentIndex != index) {
            setState(() {
              switch (index) {
                case 0:
                  _mainContent = const HomePage();
                  _title = "Home";
                  break;
                case 1:
                  _mainContent = const AccountPage();
                  _title = "Account";
                  break;
                case 2:
                  _mainContent = const SocialsPage();
                  _title = "Socials";
                  break;
                case 3:
                  _mainContent = const GamesPage();
                  _title = "Games";
                  break;
              }
              currentIndex = index;
            });
          }
        },
        currentIndex: currentIndex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_sharp),
            label: "Socials",
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
