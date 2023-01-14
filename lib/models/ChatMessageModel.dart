part of models;

class ChatMessageModel {
  final int senderIndex;
  final String message;

  ChatMessageModel(this.senderIndex, this.message);

  Widget buildWidget(
      List<ChatProfileModel> profiles, Function(String) userReplyWithCallback) {
    return Card(
      child: ListTile(
        leading: profiles[senderIndex].buildAvatar(),
        title: Text(profiles[senderIndex].profileName),
        subtitle: Text(message),
      ),
    );
  }
}
