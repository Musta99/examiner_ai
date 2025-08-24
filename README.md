📚 Examiner AI

Examiner AI is an AI-powered exam preparation and assessment app built with Flutter. It helps learners practice effectively by generating intelligent questions, converting them to speech, accepting spoken answers, and evaluating them instantly with AI.

✨ Features
📝 AI Question Generation – Automatically generates exam questions using Google Generative AI.
🔊 Text-to-Speech (TTS) – Reads out questions aloud with flutter_tts.
🎤 Speech-to-Text (STT) – Converts spoken answers to text using speech_to_text.
🤖 Answer Evaluation – AI verifies and evaluates user responses.
🎧 Audio Feedback – Provides spoken feedback with audioplayers & TTS.
📊 Progress Tracking – Monitor learning improvement with an interactive UI.
🎨 Modern UI – Built with shadcn_ui, google_fonts, and iconsax for a sleek design.
⚡ Cross-Platform – Runs on Android, iOS, and Web (Flutter support).

🛠️ Tech Stack
Frontend: Flutter (Dart)
AI: Google Generative AI (google_generative_ai)
State Management: Provider
UI/UX: Shadcn UI, Google Fonts, Iconsax
Speech & Audio: speech_to_text, flutter_tts, audioplayers
Networking & Config: http, flutter_dotenv

🚀 Getting Started
Prerequisites
Flutter SDK installed (Install Guide)
A Google AI Studio API key (for google_generative_ai)

Setup
Clone the repo:
git clone https://github.com/your-username/examiner_ai.git
cd examiner_ai

Install dependencies:
flutter pub get

Set up environment variables:
Create a .env file in the root folder
Add your Google AI API key:

