class MessageModel {
  final String title;
  final String subTitle;
  final String time;
  final String image;
  final String numberOfMessages;
  final bool isRead;

  MessageModel({
    required this.title,
    required this.subTitle,
    required this.time,
    required this.image,
    required this.numberOfMessages,
    required this.isRead,
  });
}
