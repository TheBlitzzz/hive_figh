part of pages;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10.0),
            color: Colors.amber.withOpacity(0.01),
            width: 1000.0,
            height: 500.0,
            alignment: Alignment.topCenter,
            child: Column(
                children: [
                  SizedBox(height: 40.0),
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.cyan.withOpacity(0.5),

                          border: Border.all(
                            color: Colors.cyan.withOpacity(0),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                    margin: const EdgeInsets.all(10.0),
                    width: 300.0,
                    height: 150.0,
                    child: Column(
                      children: [
                        Text("Hello")
                      ],
                    )
                  ),
                ]
            )

          ),
          // const Text("HomePage"),
        ],
      ),
    );
  }
}
