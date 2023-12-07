import 'package:flutter/material.dart';




Future<void> showLoader({required BuildContext context}) async {
  return showDialog<void>(
    context: context,
    useRootNavigator: false,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(20)),

          child: const Stack(
            children: <Widget>[
              Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                    )),
              ),

              Center(
                child: SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,


                    )),
              ),
            ],
          ),
        ),
      );
    },
  );
}
