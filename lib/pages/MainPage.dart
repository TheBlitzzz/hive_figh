part of pages;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

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
          // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          //   content: Text("You have activated the advisor"),
          //   action: SnackBarAction(
          //     label: 'Dismiss',
          //     onPressed: () {
          //       debugPrint("Dismissed");
          //     },
          //   ),
          // ));
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ChatDialog(AdvisorMessageModel(
                1,
                "Hi Mr. Jia Wei, what would you like to do today?",
                [
                  ChatBot.MSG_LearnWithRHB,
                  ChatBot.MSG_GeneralFAQ,
                ],
              ));
            },
          );
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
                  _mainContent = const SocialsPage();
                  _title = "Socials";
                  break;
                case 2:
                  _mainContent = const GamesPage();
                  _title = "Games";
                  break;
                case 3:
                  _mainContent = const AccountPage();
                  _title = "Account";
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
            icon: Icon(Icons.people_alt_sharp),
            label: "Socials",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videogame_asset),
            label: "Game",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Account",
          ),
        ],
      ),
    );
  }
}
