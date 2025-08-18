import 'package:broilermanage/pages/welcomescreen/welcomepage.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoading = false;

  void _handleGetStarted() {
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const Welcomepage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          child: Image(
            image: const AssetImage(
              "assets/images/zoe-richardson-gHAAa9U4a0k-unsplash.jpg",
            ),
            fit: BoxFit.cover,
          ),
        ),
        Center(
          child: RichText(
            text: const TextSpan(
              text: 'Broiler ',
              style: TextStyle(color: Colors.black, fontSize: 57),
              children: <TextSpan>[
                TextSpan(text: '\n        Manage'),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.all(100),
            child: MaterialButton(
              onPressed: isLoading ? null : _handleGetStarted,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
              minWidth: 220,
              height: 70,
              color: Colors.green,
              textColor: Colors.white,
              hoverElevation: 20,
              elevation: 30,
              child: isLoading
                  ? const SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        color: Colors.green,
                      ),
                    )
                  : const Text('Get Started', style: TextStyle(fontSize: 26)),
            ),
          ),
        ),
      ],
    );
  }
}
