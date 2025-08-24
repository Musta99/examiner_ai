import 'dart:convert';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:http/http.dart' as http;

class VivaSessionScreen extends StatefulWidget {
  const VivaSessionScreen({super.key});

  @override
  State<VivaSessionScreen> createState() => _VivaSessionScreenState();
}

class _VivaSessionScreenState extends State<VivaSessionScreen> {
  //   Future<String> getExaminerQuestion(String domain) async {
  //     final url = Uri.parse("https://api.openai.com/v1/chat/completions");

  //     final messages = [
  //       {
  //         "role": "system",
  //         "content": """
  // You are an FRCA viva examiner. Generate **one concise question** for the domain: $domain.
  // - Keep it professional, clear, and exam-like.
  // - Return only one question per call.
  // """,
  //       },
  //     ];

  //     final response = await http.post(
  //       url,
  //       headers: {
  //         "Content-Type": "application/json",
  //         "Authorization": "Bearer ${ApiKeys.openAiApiKey}",
  //       },
  //       body: jsonEncode({
  //         "model": "o3-mini",
  //         "messages": messages,
  //         "temperature": 0.7,
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       final data = jsonDecode(response.body);
  //       return data["choices"][0]["message"]["content"];
  //     } else {
  //       throw Exception("GPT Error: ${response.body}");
  //     }
  //   }
  String? questions;
  Future<String> getExaminerQuestion(String domain) async {
    await Future.delayed(Duration(seconds: 1));
    return "I am Mustafizur Rahman. I am from Nanupur, Fatikchari, Chittagong, Bangladesh. Tell me about you?";
  }

  final model = GenerativeModel(
    model: 'gemini-1.5-flash',
    apiKey: dotenv.env["geminiApiKey"]!,
  );

  Future<String> askVivaQuestion(String subject) async {
    final response = await model.generateContent([
      Content.text("""
You are an FCA viva examiner. 
- Generate one question from the subject and the question should not too lengthy: $subject.
- If user answer is provided, check if it's correct or not.
- Give marks between 0-10 with feedback.
- After evaluation, generate the next question.
"""),
    ]);

    return response.text ?? "";
  }

  Future getQuestion() async {
    // First fetch the question
    String newQuestion = await askVivaQuestion("Fluid dynamics");

    // Update UI state synchronously
    setState(() {
      questions = newQuestion;
    });

    // Then speak the question
    await flutterTts.speak(newQuestion);
  }

  // Future getVoiceFromElevenLabs(String text) async {
  //   final url = Uri.parse(
  //     "https://api.elevenlabs.io/v1/text-to-speech/${ApiKeys.voiceId}",
  //   );

  //   final response = await http.post(
  //     url,
  //     headers: {
  //       "Content-Type": "application/json",
  //       "xi-api-key": ApiKeys.elevenLabsApiKey,
  //     },
  //     body: jsonEncode({
  //       "text": text,
  //       "voice_settings": {"stability": 0.5, "similarity_boost": 0.8},
  //     }),
  //   );

  //   if (response.statusCode == 200) {
  //     // Audio bytes
  //     final player = AudioPlayer();
  //     await player.play(BytesSource(response.bodyBytes));
  //   } else {
  //     throw Exception("ElevenLabs Error: ${response.body}");
  //   }
  // }+

  FlutterTts flutterTts = FlutterTts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Viva Session")),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.symmetric(vertical: 25, horizontal: 16),
        child: Column(
          children: [
            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Text("Question"),
                    Text(
                      questions == null
                          ? "Questions will be displayed here"
                          : questions!,
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              child: Card(
                child: Column(
                  children: [
                    Text("Answered"),
                    Text("Answered will be displayed here"),
                  ],
                ),
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () async {
                    await getQuestion();
                  },
                  icon: Icon(Icons.mic),
                ),
                ElevatedButton(onPressed: () {}, child: Text("Submit Answer")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
