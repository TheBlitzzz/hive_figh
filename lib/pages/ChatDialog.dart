part of pages;

class ChatDialog extends StatefulWidget {
  const ChatDialog({Key? key}) : super(key: key);

  @override
  State<ChatDialog> createState() => _ChatDialogState();
}

class _ChatDialogState extends State<ChatDialog> {
  late TextEditingController _chatInputController;

  @override
  void initState() {
    super.initState();
    _chatInputController = TextEditingController();
  }

  @override
  void dispose() {
    _chatInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Flex(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.0),
              color: Colors.blue,
            ),
            child: Container(
              child: ListTile(
                title: const Text(
                  "Advisor",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  color: Colors.white,
                  icon: const Icon(Icons.close),
                ),
              ),
              width: double.infinity,
            ),
          ),
          Flexible(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.account_circle_outlined),
                  title: const Text("Advisor"),
                  subtitle: const Text("Hello how are you"),
                );
              },
              itemCount: 4,
            ),
          ),
          Container(
            child: TextField(
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: ("Text"),
              ),
              controller: _chatInputController,
            ),
            padding: const EdgeInsets.all(16.0),
            color: Colors.grey[100],
            height: 100,
          ),
        ],
        direction: Axis.vertical,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
  }
}
