import 'package:flutter/material.dart';
import 'package:veegil_bank/core/constants/app_color_constants.dart';
import 'package:veegil_bank/core/service_locator.dart';

/// [DashboardPage] will be used as the
/// "home" page for users that have logged in.
/// Will display the balance and allow the user
/// to perform other transactions.
class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: sl<AppColorConstants>().primary,
                ),
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width,
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.04,
                      backgroundColor: sl<AppColorConstants>().secondary,
                      child: Center(
                        child: Icon(Icons.send_outlined, color: sl<AppColorConstants>().black,),
                      ),
                    ),     CircleAvatar(
                      radius: MediaQuery.of(context).size.height * 0.04,
                      backgroundColor: sl<AppColorConstants>().secondary,
                      child: Center(
                        child: Icon(Icons.send_outlined, color: sl<AppColorConstants>().black,),
                      ),
                    ),
                    SizedBox(
                      height:  MediaQuery.of(context).size.height * 0.1,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: MediaQuery.of(context).size.height * 0.04,
                            backgroundColor: sl<AppColorConstants>().secondary,
                            child: Center(
                              child: Icon(
                                Icons.send_outlined,
                                color: sl<AppColorConstants>().black,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
