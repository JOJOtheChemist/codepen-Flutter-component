import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pricing_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pricing UI',
      theme: ThemeData(
        useMaterial3: true,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      home: const PricingScreen(),
    );
  }
}

class ProjectCardsScreen extends StatelessWidget {
  const ProjectCardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF232228),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Wrap(
              spacing: 30,
              runSpacing: 40,
              alignment: WrapAlignment.center,
              children: const [
                ProjectCard(
                  date: 'Feb 2, 2021',
                  title: 'web designing',
                  subtitle: 'Prototyping',
                  progress: 0.9,
                  progressText: '90%',
                  countdownText: '2 days left',
                  cardColor: CardColor.green,
                  avatars: [
                    'https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ],
                ),
                ProjectCard(
                  date: 'Feb 05, 2021',
                  title: 'mobile app',
                  subtitle: 'Shopping',
                  progress: 0.3,
                  progressText: '30%',
                  countdownText: '3 weeks left',
                  cardColor: CardColor.orange,
                  avatars: [
                    'https://images.pexels.com/photos/614810/pexels-photo-614810.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    'https://images.pexels.com/photos/874158/pexels-photo-874158.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ],
                ),
                ProjectCard(
                  date: 'March 03, 2021',
                  title: 'dashboard',
                  subtitle: 'Medical',
                  progress: 0.5,
                  progressText: '50%',
                  countdownText: '3 weeks left',
                  cardColor: CardColor.red,
                  avatars: [
                    'https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    'https://images.pexels.com/photos/733872/pexels-photo-733872.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ],
                ),
                ProjectCard(
                  date: 'March 08, 2021',
                  title: 'web designing',
                  subtitle: 'Wireframing',
                  progress: 0.2,
                  progressText: '20%',
                  countdownText: '3 weeks left',
                  cardColor: CardColor.blue,
                  avatars: [
                    'https://images.pexels.com/photos/2379005/pexels-photo-2379005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                    'https://images.pexels.com/photos/1036623/pexels-photo-1036623.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

enum CardColor { green, blue, orange, red }

class ProjectCard extends StatelessWidget {
  final String date;
  final String title;
  final String subtitle;
  final double progress;
  final String progressText;
  final String countdownText;
  final CardColor cardColor;
  final List<String> avatars;

  const ProjectCard({
    super.key,
    required this.date,
    required this.title,
    required this.subtitle,
    required this.progress,
    required this.progressText,
    required this.countdownText,
    required this.cardColor,
    required this.avatars,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320,
      height: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(36),
        gradient: _getGradient(),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            blurRadius: 15,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(
          width: 2.5,
          color: Colors.transparent,
        ),
      ),
      child: Stack(
        children: [
          // Header
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 12, 8, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    date,
                    style: const TextStyle(
                      color: Color(0xFFDDDDDD),
                      fontSize: 14,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.more_vert,
                      color: Colors.white,
                      size: 24,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),
          
          // Body
          Positioned.fill(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFFDDDDDD),
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Progress',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Stack(
                          children: [
                            Container(
                              height: 5,
                              decoration: BoxDecoration(
                                color: const Color(0xFF363636),
                                borderRadius: BorderRadius.circular(50),
                              ),
                            ),
                            FractionallySizedBox(
                              widthFactor: progress,
                              child: Container(
                                height: 5,
                                decoration: BoxDecoration(
                                  color: _getProgressColor(),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            progressText,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          
          // Footer
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 11, 20, 8),
              decoration: const BoxDecoration(
                color: Color(0xFF151419),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      // Team avatars
                      SizedBox(
                        width: avatars.length * 20.0 + 30,
                        height: 30,
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            for (int i = 0; i < avatars.length; i++)
                              Positioned(
                                left: i * 20.0,
                                top: 0,
                                child: Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF151419),
                                      width: 2,
                                    ),
                                    image: DecorationImage(
                                      image: NetworkImage(avatars[i]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            Positioned(
                              left: avatars.length * 20.0,
                              top: 0,
                              child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: _getButtonColor(),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  // Countdown button
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF222127),
                      borderRadius: BorderRadius.circular(32),
                    ),
                    child: Text(
                      countdownText,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  LinearGradient _getGradient() {
    switch (cardColor) {
      case CardColor.green:
        return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF107667), Color(0xFF151419), Color(0xFF151419)],
          stops: [0.0, 0.47, 1.0],
        );
      case CardColor.blue:
        return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF00458F), Color(0xFF151419), Color(0xFF151419)],
          stops: [0.0, 0.45, 1.0],
        );
      case CardColor.orange:
        return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFAA7100), Color(0xFF151419), Color(0xFF151419)],
          stops: [0.0, 0.47, 1.0],
        );
      case CardColor.red:
        return const LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFFA63D2A), Color(0xFF151419), Color(0xFF151419)],
          stops: [0.0, 0.47, 1.0],
        );
    }
  }

  Color _getProgressColor() {
    switch (cardColor) {
      case CardColor.green:
        return const Color(0xFF01C3A8);
      case CardColor.blue:
        return const Color(0xFF1890FF);
      case CardColor.orange:
        return const Color(0xFFFFB741);
      case CardColor.red:
        return const Color(0xFFA63D2A);
    }
  }

  Color _getButtonColor() {
    switch (cardColor) {
      case CardColor.green:
        return const Color(0xFF01C3A8);
      case CardColor.blue:
        return const Color(0xFF1890FF);
      case CardColor.orange:
        return const Color(0xFFFFB741);
      case CardColor.red:
        return const Color(0xFFA63D2A);
    }
  }
}
