import 'package:hive_figh/models/models_lib.dart';

class ChatBot {
  static const MSG_LearnWithRHB = "Learn with RHB";
  static const MSG_BeginnerInvestor =
      "I am a beginner, how to start investing?";
  static const MSG_WhatIsTrading =
      "What is trading and how do I start trading?";
  static const MSG_WhoToInvest = "Who should I invest first as a beginner?";
  static const MSG_SimplestWayToBudget = "What are The Simplest Way to Budget?";

  static const MSG_RHBInsurance = "Tell me more about RHB Insurance.";

  static ChatMessageModel ReceiveMessage(String message) {
    if (message == MSG_LearnWithRHB) {
      return AdvisorMessageModel(
          1,
          "I found several articles for today, which one would you like to view?",
          [
            MSG_BeginnerInvestor,
            MSG_WhatIsTrading,
            MSG_WhoToInvest,
            MSG_SimplestWayToBudget,
          ]);
    }
    if (message == MSG_BeginnerInvestor) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : https://www.investopedia.com/articles/basics/11/3-s-simple-investing.asp");
    }
    if (message == MSG_WhatIsTrading) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : https://www.investopedia.com/articles/trading/05/011705.asp");
    }
    if (message == MSG_WhoToInvest) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : https://www.bankrate.com/investing/best-investments-for-beginners/");
    }
    if (message == MSG_SimplestWayToBudget) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : https://n26.com/en-eu/blog/50-30-20-rule");
    }

    if (message == MSG_RHBInsurance) {}

    return ChatMessageModel(1, "I'm sorry, I don't understand");
  }
}
