import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_planner_app/constants/months.dart';
import 'package:travel_planner_app/router/router.dart';
import 'package:travel_planner_app/screens/travel/travel_bloc/travel_bloc.dart';
import 'package:travel_planner_app/theme/colors.dart';
import 'package:travel_planner_app/widgets/action_button_widget.dart';
import 'package:travel_planner_app/widgets/app_container.dart';

@RoutePage()
class TravelListScreen extends StatefulWidget {
  const TravelListScreen({super.key});

  @override
  State<TravelListScreen> createState() => _TravelListScreenState();
}

class _TravelListScreenState extends State<TravelListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        context.router.push(SettingsRoute());
                      },
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.router.push(NewsListRoute());
                      },
                      child: Text(
                        'News',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 18,
                          color: AppColors.green,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                BlocProvider(
                  create: (context) => TravelBloc()..add(GetAllTravelsEvent()),
                  child: BlocConsumer<TravelBloc, TravelState>(
                    listener: (context, state) {},
                    builder: (context, state) {
                      if (state is EmptyTravelsListState) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/elements/list-image.png',
                                width: 310),
                            SizedBox(height: 50),
                            Text(
                              'There\'s no info',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 24,
                                color: AppColors.green,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Add the country you want to visit',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                color: AppColors.white50,
                              ),
                            ),
                          ],
                        );
                      } else if (state is LoadedAllTravelsState) {
                        return Column(
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Main',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 32,
                                  color: AppColors.white,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            ListView.separated(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              padding: EdgeInsets.symmetric(vertical: 16),
                              itemCount: state.travels.length,
                              separatorBuilder:
                                  (BuildContext context, int index) =>
                                      const SizedBox(height: 15),
                              itemBuilder: (BuildContext context, int index) {
                                final travel = state.travels[index];
                                return GestureDetector(
                                  onTap: () {
                                    context.router.push(TravelInfoRoute(travel: travel));
                                  },
                                  child: AppContainer(
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              travel.country,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                color: AppColors.white,
                                              ),
                                            ),
                                            Text(
                                              travel.type,
                                              style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 16,
                                                color: AppColors.white50,
                                              ),
                                            ),
                                            SizedBox(height: 10),
                                            Container(
                                              padding: EdgeInsets.all(8),
                                              decoration: BoxDecoration(
                                                  color: AppColors.black,
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(
                                                              8.0))),
                                              child: Text(
                                                '${months[travel.date.month]} ${travel.date.year}',
                                                style: TextStyle(
                                                  color: AppColors.green,
                                                  fontSize: 17,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Icon(Icons.arrow_forward_ios_rounded, color: AppColors.green,)
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: ActionButtonWidget(
          text: 'Add new country',
          width: 350,
          onTap: () {
            context.router.push(AddTravelRoute());
          }),
    );
  }
}
