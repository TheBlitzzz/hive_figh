part of models;

class AdvisorMessageModel extends ChatMessageModel {
  final List<String> replySuggestions;

  AdvisorMessageModel(int senderIndex, String message, this.replySuggestions)
      : super(senderIndex, message);

  @override
  Widget buildWidget(
      List<ChatProfileModel> profiles, Function(String) userReplyWithCallback) {
    return Card(
      child: Column(
        children: [
          ListTile(
            leading: profiles[senderIndex].buildAvatar(),
            title: Text(profiles[senderIndex].profileName),
            subtitle: Text(message),
          ),
          SizedBox(
            child: ListView.builder(
              itemBuilder: (context, index) {
                return TextButton(
                    onPressed: () =>
                        userReplyWithCallback(replySuggestions[index]),
                    child: Text(replySuggestions[index]));
              },
              itemCount: replySuggestions.length,
              scrollDirection: Axis.horizontal,
            ),
            height: 40,
          )
        ],
      ),
    );
  }
}
