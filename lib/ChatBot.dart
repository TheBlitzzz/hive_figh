import 'package:hive_figh/models/models_lib.dart';

class ChatBot {
  static const MSG_LearnWithRHB = "Learn with RHB";
  static const MSG_BeginnerInvestor =
      "I am a beginner, how to start investing?";
  static const MSG_WhatIsTrading =
      "What is trading and how do I start trading?";
  static const MSG_WhoToInvest = "Who should I invest first as a beginner?";
  static const MSG_SimplestWayToBudget = "What are The Simplest Way to Budget?";

  static const MSG_RHBInsurance = "RHB Insurance";

  static const MSG_ReorganiseBudget = "Reorganise my budget";
  static const MSG_LetMeBe = "Let me be";

  static const MSG_GeneralFAQ = "General FAQs";

  static bool inQuizQ1 = false;
  static bool inQuizQ2 = false;
  static bool inQuizQ3 = false;

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
      return AdvisorMessageModel(
          1,
          "I found this article that explains this topic in detail : \nhttps://www.investopedia.com/articles/basics/11/3-s-simple-investing.asp\n(We can also fit different interactive models here)\n\nIf you have finished reading, do you want to take a quiz with our verified partners?",
          [
            "Yes, give me the quiz",
            "No, thank you",
          ]);
    }
    if (message == "Yes, give me the quiz") {
      inQuizQ1 = true;
      return AdvisorMessageModel(
          1, "Which would be considered the highest risk investment type?", [
        "Stock",
        "Mutual Fund",
        "Bond",
      ]);
    }
    if (inQuizQ1) {
      if (message == "Stock") {
        inQuizQ1 = false;
        inQuizQ2 = true;
        return AdvisorMessageModel(
            1,
            "Yay, you got that right! Now, The relationship between risk and return can be stated as",
            [
              "Higher risk indicates higher return",
              "Higher risk indicates lower return",
              "Lower risk indicates higher return",
            ]);
      } else {
        return ChatMessageModel(1, "That's the wrong answer!");
      }
    }

    if (inQuizQ2) {
      if (message == "Higher risk indicates higher return") {
        inQuizQ2 = false;
        inQuizQ3 = true;
        return AdvisorMessageModel(
            1,
            "Yay, you got that right! Now, Which is NOT a stock market index?",
            [
              "New York Stock Exchange",
              "Dow Jones Industrial Average",
              "S&P 500",
            ]);
      } else {
        return ChatMessageModel(1, "That's the wrong answer!");
      }
    }

    if (inQuizQ3) {
      if (message == "New York Stock Exchange") {
        inQuizQ3 = false;
        return ChatMessageModel(1,
            "Yay, you got that right! You passed the quiz! Hope you learned something new today!");
      } else {
        return ChatMessageModel(1, "That's the wrong answer!");
      }
    }

    if (message == "No, thank you") {
      return ChatMessageModel(
          1, "That's alright, let me know if you have a change of heart!");
    }

    if (message == MSG_WhatIsTrading) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : \nhttps://www.investopedia.com/articles/trading/05/011705.asp\n(We can also fit different interactive models here)");
    }
    if (message == MSG_WhoToInvest) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : \nhttps://www.bankrate.com/investing/best-investments-for-beginners/\n(We can also fit different interactive models here)");
    }
    if (message == MSG_SimplestWayToBudget) {
      return ChatMessageModel(1,
          "I found this article that explains this topic in detail : \nhttps://n26.com/en-eu/blog/50-30-20-rule\n(We can also fit different interactive models here)");
    }

    if (message.toLowerCase().contains(MSG_RHBInsurance.toLowerCase())) {
      return AdvisorMessageModel(
          1,
          "Types of RHB Insurance offered  : \n(RHB Insurance infographic/pamphlet here)\nWhat would you like to know more about?",
          [
            "I'm ready to apply!",
            "Motor: Comprehensive",
            "Travel: Single Trip",
            "Medical: Hospitalisation and Surgical",
            "Personal Accident: Accidental Death and Disablement",
          ]);
    }

    if (message == "I'm ready to apply!") {
      return ChatMessageModel(1,
          "*Step by step instructions on how to apply \n(interactive examples that guide you through the app)\n(There can also be highlighted elements to teach the user what are the options and what do they mean/consequences)");
    }

    if (message == MSG_ReorganiseBudget) {
      return ChatMessageModel(1,
          "Let's go (Provides tips on how to reorganise your budget + Help you through it step by step)");
    }

    if (message == MSG_LetMeBe) {
      return ChatMessageModel(1, "EXIT");
    }

    if (message == MSG_GeneralFAQ) {
      return AdvisorMessageModel(1, "What would you like to ask about?",
          ["Online Banking", "Best ways to budget", "Loans"]);
    }

    if (message == "Online Banking" ||
        message == "Best ways to budget" ||
        message == "Loans") {
      return ChatMessageModel(1,
          "Alright (Lists a list of FAQ, you can continue to ask further and it can reply you with your current context, so you can give it your information and it'll infer)");
    }

    return ChatMessageModel(1, "I'm sorry, I don't understand");
  }
}
