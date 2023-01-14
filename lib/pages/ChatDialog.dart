part of pages;

const profiles = [
  ChatProfileModel("You"),
  ChatProfileModel("Advisor"),
];
final List<ChatMessageModel> chatMessages = [];

class ChatDialog extends StatefulWidget {
  final AdvisorMessageModel initialDialog;

  const ChatDialog(this.initialDialog, {Key? key}) : super(key: key);

  @override
  State<ChatDialog> createState() => _ChatDialogState();
}

class _ChatDialogState extends State<ChatDialog> {
  late TextEditingController _chatInputController;

  @override
  void initState() {
    super.initState();
    chatMessages.clear();
    chatMessages.add(widget.initialDialog);
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
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.blue,
            ),
            child: SizedBox(
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
                List<Widget> rowWidgets = [
                  Flexible(
                      child: chatMessages[index]
                          .buildWidget(profiles, chooseProvidedDialog))
                ];
                if (chatMessages[index].senderIndex == 0) {
                  rowWidgets.insert(0, const SizedBox(width: 50));
                } else {
                  rowWidgets.add(const SizedBox(width: 50));
                }
                return Flex(
                  direction: Axis.horizontal,
                  children: rowWidgets,
                );
              },
              padding: const EdgeInsets.all(8.0),
              itemCount: chatMessages.length,
            ),
          ),
          Container(
            child: TextField(
              decoration: InputDecoration(
                suffix: TextButton(
                  onPressed: () async {
                    final message = _chatInputController.text.trim();
                    chatMessages.add(ChatMessageModel(0, message));

                    if (message.toLowerCase() == "clear") {
                      setState(() {
                        chatMessages.clear();
                        chatMessages.add(widget.initialDialog);
                      });
                    } else {
                      var reply = ChatBot.ReceiveMessage(message);
                      if (reply.message == "EXIT") {
                        Navigator.of(context).pop();
                      } else {
                        await Future.delayed(const Duration(seconds: 1));
                        setState(() {
                          chatMessages.add(reply);
                        });
                      }
                    }

                    _chatInputController.text = "";
                  },
                  child: const Text("Send"),
                ),
                isCollapsed: true,
              ),
              maxLines: null,
              controller: _chatInputController,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.grey[100],
            ),
            padding: const EdgeInsets.all(8.0),
          ),
        ],
        direction: Axis.vertical,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      backgroundColor: Colors.grey[300],
    );
  }

  void chooseProvidedDialog(String providedDialog) async {
    setState(() {
      chatMessages.add(ChatMessageModel(0, providedDialog));
    });
    var reply = ChatBot.ReceiveMessage(providedDialog);
    if (reply.message == "EXIT") {
      Navigator.of(context).pop();
    } else {
      await Future.delayed(const Duration(seconds: 1));
      setState(() {
        chatMessages.add(reply);
      });
    }
  }
}
