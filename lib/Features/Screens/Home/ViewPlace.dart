import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:parking_slot/Controllers/ParkingController.dart';
import 'package:parking_slot/Controllers/UserController.dart';
import 'package:parking_slot/Data/Models/PlacesData.dart';
import 'package:parking_slot/Features/Widgets/ViewPlaceWidgets.dart';
import 'package:parking_slot/Features/Widgets/widgets_login_registration.dart';
import 'package:parking_slot/Resources/assets.dart';
import 'package:parking_slot/Resources/colors.dart';
import 'package:parking_slot/Resources/strings.dart';
import 'package:parking_slot/Resources/values.dart';

class ViewPlace extends StatefulWidget {
  @override
  _ViewPlaceState createState() => _ViewPlaceState();
}

class _ViewPlaceState extends State<ViewPlace> {
  PlaceData _placeData;
  final _parkingController = Get.put(ParkingController());
  final _userController = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    this._placeData = Get.arguments;
    print(_placeData.address);
  }

  void _bookParkingSlot() async {
    if (await _parkingController.bookSlot(
        _placeData, _userController.userData.value)) {
      //
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          APPBAR_PLACE,
          style: TextStyle(
            fontFamily: FONT_BANK_GOTHIC,
            fontSize: FONT_SIZE_APPBAR,
          ),
        ),
        backgroundColor: COLOR_CARIBBEAN_GREEN,
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ViewPlaceImage(placeData: _placeData),
              SizedBox(
                height: 10.0,
              ),
              ViewPlaceDetails(placeData: _placeData),
              ViewPlaceSlotWidget(placeData: _placeData),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 20.0,
                ),
                child: SubmitButton(
                    onPressed: () {
                      _bookParkingSlot();
                    },
                    text: "Book a slot"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
