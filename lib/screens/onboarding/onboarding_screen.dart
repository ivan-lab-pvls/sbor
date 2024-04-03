import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:travel_planner_app/router/router.dart';
import 'package:travel_planner_app/theme/colors.dart';
import 'package:travel_planner_app/widgets/action_button_widget.dart';
import 'package:travel_planner_app/widgets/textfield_app_widget.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final pageController = PageController();

  final nameController = TextEditingController();


  List<String> countList = ['1-2', '3-5', 'More than 5'];
  String count = '1-2';
  int _countIndex = 0;

  int _pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Container(
          child: PageView(
            physics: NeverScrollableScrollPhysics(),
            controller: pageController,
            onPageChanged: (index) {
              setState(() {
                _pageIndex = index;
              });
            },
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/elements/onboarding-image.png',
                      width: 310),
                  SizedBox(height: 40),
                  Text(
                    'Welcome to our app!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Text(
                      'Plan and track trips to different countries',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Let\'s get acquainted',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 32,
                        color: AppColors.white,
                      ),
                    ),
                    SizedBox(height: 20),
                    TextFieldAppWidget(controller: nameController, title: 'What is your name?'),
                    SizedBox(height: 20),
                    Text(
                      'How many countries you visit in a year?',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: AppColors.white50,
                      ),
                    ),
                    SizedBox(height: 5),
                    ChipList(
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      spacing: 10,
                      listOfChipNames: countList,
                      activeBorderColorList: [AppColors.green],
                      inactiveBorderColorList: [AppColors.black],
                      activeBgColorList: [AppColors.grey],
                      inactiveBgColorList: [AppColors.grey],
                      activeTextColorList: [AppColors.green],
                      inactiveTextColorList: [AppColors.white],
                      listOfChipIndicesCurrentlySeclected: [_countIndex],
                      shouldWrap: true,
                      checkmarkColor: AppColors.green,
                      extraOnToggle: (val) {
                        _countIndex = val;
                        setState(() {
                          count = countList[_countIndex];
                        });
                      },
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: _pageIndex == 0 ? 'Next' : 'Continue',
          width: 350,
          onTap: () {
            if (_pageIndex == 0) {
              pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeInOut);
            } else {
              context.router.push(TravelListRoute());
            }
          }),
    );
  }
}