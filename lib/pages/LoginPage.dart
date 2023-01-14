part of pages;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _usernameController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const spacing = 8.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Text("Welcome to RHB"),
              const SizedBox(height: spacing),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Username",
                  hintText: "Enter your username",
                ),
                controller: _usernameController,
              ),
              const SizedBox(height: spacing),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Password",
                  hintText: "Enter your password",
                ),
                obscureText: true,
                controller: _passwordController,
              ),
              const SizedBox(height: spacing),
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: _login,
                  child: const Text("Login"),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ),
        padding: const EdgeInsets.all(spacing * 5),
      ),
    );
  }

  void _login() {
    debugPrint("Login");
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => const HomePage()));
  }
}
