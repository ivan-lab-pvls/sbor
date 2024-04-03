import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner_app/constants/months.dart';
import 'package:travel_planner_app/models/travel_model.dart';
import 'package:travel_planner_app/router/router.dart';
import 'package:travel_planner_app/screens/travel/travel_bloc/travel_bloc.dart';
import 'package:travel_planner_app/theme/colors.dart';
import 'package:travel_planner_app/widgets/action_button_widget.dart';
import 'package:travel_planner_app/widgets/app_container.dart';

@RoutePage()
class TravelInfoScreen extends StatefulWidget {
  final TravelModel travel;

  const TravelInfoScreen({super.key, required this.travel});

  @override
  State<TravelInfoScreen> createState() => _TravelInfoScreenState();
}

class _TravelInfoScreenState extends State<TravelInfoScreen> {
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
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Movie info',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: AppColors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                AppContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Country name',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white50,
                            ),
                          ),
                          Text(
                            widget.travel.country,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Type',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white50,
                            ),
                          ),
                          Text(
                            widget.travel.type,
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Planned travel dates',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.white50,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                      decoration: BoxDecoration(
                          color: AppColors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8.0))),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${widget.travel.date.month}/${widget.travel.date.day}/${widget.travel.date.year}',
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 16,
                              color: AppColors.white,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                color: AppColors.black,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Text(
                              '${months[widget.travel.date.month]} ${widget.travel.date.year}',
                              style: TextStyle(
                                color: AppColors.green,
                                fontSize: 17,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                widget.travel.fellowPerson.isNotEmpty
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Who you\'ll be taking the trip with?',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white50,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                              width: double.infinity,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 18),
                              decoration: BoxDecoration(
                                  color: AppColors.grey,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0))),
                              child: Text(
                                widget.travel.fellowPerson,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16,
                                  color: AppColors.white,
                                ),
                              )),
                        ],
                      )
                    : Container(),
                SizedBox(height: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Comment',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 16,
                          color: AppColors.white50,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Container(
                        width: double.infinity,
                        padding:
                            EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                        decoration: BoxDecoration(
                            color: AppColors.grey,
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0))),
                        child: Text(
                          widget.travel.comment,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        )),
                  ],
                ),
                SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Delete info',
          width: 350,
          onTap: () {
            context
                .read<TravelBloc>()
                .add(DeleteTravelEvent(travel: widget.travel));
            context.router.push(TravelListRoute());
          }),
    );
  }
}
