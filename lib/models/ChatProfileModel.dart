part of models;

class ChatProfileModel {
  final String profileName;

  const ChatProfileModel(this.profileName);

  Widget buildAvatar() {
    return const Icon(Icons.account_circle_outlined);
  }
}
