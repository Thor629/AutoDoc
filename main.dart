import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:google_fonts/google_fonts.dart';
import 'project_data.dart';
import 'validators.dart';

void main() {
  runApp(const AutoDocApp());
}

class AutoDocApp extends StatelessWidget {
  const AutoDocApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AutoDoc',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: ChatFormScreen(),
      routes: {
        '/summary': (context) => const Placeholder(), // Replace with SummaryScreen
      },
    );
  }
}

class ChatFormScreen extends StatefulWidget {
  @override
  _ChatFormScreenState createState() => _ChatFormScreenState();
}

class _ChatFormScreenState extends State<ChatFormScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  ProjectData _data = ProjectData();

  // Steps definition
  List<Map<String, dynamic>> get steps => [
    {
      'question': 'What is the Project Title?',
      'field': 'title',
      'input': TextFormField(
        decoration: const InputDecoration(labelText: 'Project Title'),
        validator: (v) => Validators.validateNotEmpty(v, 'Project Title'),
        onSaved: (v) => _data.title = v!,
      ),
      'animation': 'assets/lottie/step_animation.json',
    },
    {
      'question': 'Enter the Domain (e.g., AI, IoT)',
      'field': 'domain',
      'input': TextFormField(
        decoration: const InputDecoration(labelText: 'Domain'),
        validator: (v) => Validators.validateNotEmpty(v, 'Domain'),
        onSaved: (v) => _data.domain = v!,
      ),
      'animation': 'assets/lottie/step_animation.json',
    },
    {
      'question': 'Guide/Faculty Name?',
      'field': 'guideName',
      'input': TextFormField(
        decoration: const InputDecoration(labelText: 'Guide Name'),
        validator: (v) => Validators.validateNotEmpty(v, 'Guide Name'),
        onSaved: (v) => _data.guideName = v!,
      ),
      'animation': 'assets/lottie/step_animation.json',
    },
    {
      'question': 'Department and Semester?',
      'field': 'departmentSemester',
      'input': Column(
        children: [
          TextFormField(
            decoration: const InputDecoration(labelText: 'Department'),
            validator: (v) => Validators.validateNotEmpty(v, 'Department'),
            onSaved: (v) => _data.department = v!,
          ),
          TextFormField(
            decoration: const InputDecoration(labelText: 'Semester'),
            validator: (v) => Validators.validateNotEmpty(v, 'Semester'),
            onSaved: (v) => _data.semester = v!,
          ),
        ],
      ),
      'animation': 'assets/lottie/step_animation.json',
    },
    {
      'question': 'Submission Date?',
      'field': 'submissionDate',
      'input': TextFormField(
        decoration: const InputDecoration(labelText: 'DD/MM/YYYY'),
        validator: (v) => Validators.validateNotEmpty(v, 'Submission Date'),
        onSaved: (v) => _data.submissionDate = v! as DateTime?,
      ),
      'animation': 'assets/lottie/step_animation.json',
    },
  ];

  void _nextStep() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      setState(() {
        _currentStep++;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoDoc', style: GoogleFonts.montserrat()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              for (int i = 0; i <= _currentStep && i < steps.length; i++)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Lottie.asset(steps[i]['animation'], height: 100),
                    Text(
                      steps[i]['question'],
                      style: GoogleFonts.montserrat(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8),
                    steps[i]['input'],
                    const SizedBox(height: 20),
                  ],
                ),
              if (_currentStep < steps.length)
                ElevatedButton(
                  onPressed: _nextStep,
                  child: const Text('Next'),
                ),
              if (_currentStep == steps.length)
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/summary', arguments: _data);
                  },
                  child: const Text('Show Summary'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
