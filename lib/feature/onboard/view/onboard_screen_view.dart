import 'package:email_inbox_cleaning_app/feature/home/view/home_screen_view.dart';
import 'package:email_inbox_cleaning_app/product/companents/text/app_text_strings.dart';
import 'package:flutter/material.dart';

class OnboardView extends StatefulWidget {
  OnboardView({Key? key}) : super(key: key);

  @override
  State<OnboardView> createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppString().onboardImage,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              _onboardText(context),
              _onboardButton(context),
              const SizedBox(
                height: 25,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _onboardButton(BuildContext context) {
    return Container(
      width: 206,
      height: 56,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).cardColor,
      ),
      child: InkWell(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppString().onBoardButtonText,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
            const Icon(
              Icons.double_arrow,
            )
          ],
        ),
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        },
      ),
    );
  }

  Expanded _onboardText(BuildContext context) {
    return Expanded(
      flex: 4,
      child: Column(
        children: [
          Text(
            AppString().onboardTitle,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 35.0,
              color: Theme.of(context).primaryColor,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            AppString().onboardSubtitle,
          ),
          Text(
            AppString().onboardSubtitleTwo,
            style: const TextStyle(fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}
