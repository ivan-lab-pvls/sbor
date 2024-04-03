import 'package:auto_route/auto_route.dart';
import 'package:chip_list/chip_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner_app/models/travel_model.dart';
import 'package:travel_planner_app/router/router.dart';
import 'package:travel_planner_app/screens/travel/travel_bloc/travel_bloc.dart';
import 'package:travel_planner_app/theme/colors.dart';
import 'package:travel_planner_app/widgets/action_button_widget.dart';
import 'package:travel_planner_app/widgets/textfield_app_widget.dart';

@RoutePage()
class AddTravelScreen extends StatefulWidget {
  const AddTravelScreen({super.key});

  @override
  State<AddTravelScreen> createState() => _AddTravelScreenState();
}

class _AddTravelScreenState extends State<AddTravelScreen> {
  final pageController = PageController();

  final countryController = TextEditingController();
  final dateController = TextEditingController();
  final fellowPersonController = TextEditingController();
  final commentController = TextEditingController();

  DateTime date = DateTime.now();

  List<String> typeList = ['Vacation', 'Work', 'Other'];
  String type = 'Vacation';
  int _typeIndex = 0;

  int _pageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    countryController.dispose();
    dateController.dispose();
    fellowPersonController.dispose();
    commentController.dispose();
    super.dispose();
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );
    if (_picked != null) {
      date = _picked;
      setState(() {
        dateController.text = _picked.toString().split(' ')[0];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: AppBar(
        backgroundColor: AppColors.black,
        leadingWidth: 110,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: GestureDetector(
            onTap: () {
              context.router.push(TravelListRoute());
            },
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.green),
                SizedBox(width: 5),
                Text(
                  'Back',
                  style: TextStyle(
                    color: AppColors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
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
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New country',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldAppWidget(
                          controller: countryController, title: 'Country name'),
                      SizedBox(height: 15),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Planned travel date',
                              style: TextStyle(
                                color: AppColors.white50,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          TextField(
                            style: TextStyle(color: Colors.white),
                            controller: dateController,
                            readOnly: true,
                            onTap: () {
                              _selectDate();
                            },
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: AppColors.grey,
                              prefixIcon: Icon(Icons.calendar_month),
                              prefixIconColor: AppColors.white50,
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              focusedBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: AppColors.green),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8))),
                              hintStyle: TextStyle(
                                color: AppColors.white50,
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 15),
                      Text(
                        'What type of travel?',
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
                        listOfChipNames: typeList,
                        activeBorderColorList: [AppColors.green],
                        inactiveBorderColorList: [AppColors.black],
                        activeBgColorList: [AppColors.grey],
                        inactiveBgColorList: [AppColors.grey],
                        activeTextColorList: [AppColors.green],
                        inactiveTextColorList: [AppColors.white],
                        listOfChipIndicesCurrentlySeclected: [_typeIndex],
                        shouldWrap: true,
                        checkmarkColor: AppColors.green,
                        extraOnToggle: (val) {
                          _typeIndex = val;
                          setState(() {
                            type = typeList[_typeIndex];
                          });
                        },
                      ),
                      SizedBox(height: 25),
                      ActionButtonWidget(
                          text: 'Continue',
                          width: double.infinity,
                          onTap: () {
                            if (countryController.text.isNotEmpty &&
                                dateController.text.isNotEmpty) {
                              pageController.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.green,
                                  content: Text(
                                    'Firstly, enter information',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          })
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'New country',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 32,
                            color: AppColors.white,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      TextFieldAppWidget(
                          controller: commentController,
                          title: 'Write a comment about country'),
                      SizedBox(height: 15),
                      TextFieldAppWidget(
                          controller: fellowPersonController,
                          title: 'Who you\'ll be taking the trip with?'),
                      SizedBox(height: 25),
                      ActionButtonWidget(
                          text: 'Add new country',
                          width: double.infinity,
                          onTap: () {
                            if (commentController.text.isNotEmpty) {
                              context.read<TravelBloc>().add(AddTravelEvent(
                                  travel: TravelModel(
                                      country: countryController.text,
                                      type: type,
                                      date: date,
                                      fellowPerson: fellowPersonController.text,
                                      comment: commentController.text)));
                              context.router.push(TravelListRoute());
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  backgroundColor: AppColors.green,
                                  content: Text(
                                    'Firstly, enter information',
                                    style: TextStyle(color: AppColors.white),
                                  ),
                                ),
                              );
                            }
                          })
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
