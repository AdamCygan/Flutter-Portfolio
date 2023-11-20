import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(244, 232, 225, 1),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Save the world\nwith plant',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold, letterSpacing: 1.28),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .02,
              ),
              Text(
                'Start planting one plant everyday,\n it will make the earth better',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * .04,
              ),
              MaterialButton(
                  color: const Color.fromRGBO(28, 108, 125, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7.5)
                  ),
                  height: MediaQuery.of(context).size.height * .06,
                  minWidth: MediaQuery.of(context).size.width * .4,
                  child: Text(
                    'Get started',
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(color: Colors.white),
                  ),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  })
            ],
          ),
        ),
      ),
    );
  }
}
