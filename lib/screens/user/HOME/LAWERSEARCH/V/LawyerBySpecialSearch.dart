import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:inkozi/screens/USER/HOME/CHAT/C/controller.dart';
import 'package:inkozi/screens/USER/HOME/LAWERSEARCH/C/controller.dart';
import '../../../../../model/CategoryModel.dart';
import '../../../../../widgets/widget.dart';

class LawyerBySpecialSearch extends StatefulWidget {
  const LawyerBySpecialSearch({super.key});

  static const String routeName = '/lawyerbyspecialsearch';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LawyerBySpecialSearch(),
    );
  }

  @override
  State<LawyerBySpecialSearch> createState() => _LawyerBySpecialSearchState();
}

class _LawyerBySpecialSearchState extends State<LawyerBySpecialSearch> {
  GlobalKey<ScaffoldState> fromkey = GlobalKey<ScaffoldState>();
  TextEditingController searchController = TextEditingController();
  final List<String> _list = [
    "Follow",
    "lakshydeep-14",
    "on",
    "Github",
    "Medium",
    "LinkedIn"
  ];
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        key: fromkey,
        appBar: CustomAppBar(
          leading: SizedBox(),
          action: InkWell(
            onTap: () {
              fromkey.currentState!.openEndDrawer();
              UserChatCOntroller.to.getQuestionsSendReqUser(context: context);
            },
            child: Container(
              height: 30.h,
              width: 40.w,
              color: Colors.transparent,
              child: Icon(
                Icons.menu,
                color: bgColor,
                size: 20.h,
              ),
            ),
          ),
        ),
        endDrawer: DrawerWidget(),
        body: GetBuilder<LawyerSearchContoller>(initState: (state) {
          Get.put(UserChatCOntroller());
          Get.put(LawyerSearchContoller());
          UserChatCOntroller.to.getQuestionsSendReqUser(context: context);
          LawyerSearchContoller.to.initfunction(context);
          LawyerSearchContoller.to.livelistenLocation(context);
        }, builder: (obj) {
          return Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height.h,
              width: double.infinity,
              child: obj.currentPosition == null
                  ? Center(
                      child: CircularProgressIndicator(
                      color: Color(0xff84008c),
                    ))
                  : Container(
                      height: MediaQuery.of(context).size.height.h,
                      width: double.infinity,
                      child: GoogleMap(
                        onTap: (argument) {},
                        zoomControlsEnabled: false,
                        onMapCreated: (controller) {
                          if (!obj.mapController.isCompleted) {
                            obj.mapController.complete(controller);
                          }
                        },
                        mapType: obj.mapType,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: false,
                        initialCameraPosition: CameraPosition(
                          zoom: 1,
                          target: LatLng(obj.currentPosition!.latitude,
                              obj.currentPosition!.longitude),
                        ),
                        markers: Set<Marker>.of(obj.markers),
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.20,
                        ),
                      ),
                    ),
            ),

            HeaderWithTitle(
              title: 'Locate Your Lawyer',
            ),
            Positioned(
              top: obj.advancesearch ? height * 0.1 : height * 0.2,
              left: width * 0.8,
              child: FloatingActionButton.small(
                heroTag: "btn2",
                onPressed: () {
                  obj.mapTypeChange();
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.map,
                  size: 23.0,
                  color: Color(0xff84008c),
                ),
              ),
            ),
            Positioned(
              top: obj.advancesearch ? height * 0.2 : height * 0.3,
              left: width * 0.8,
              child: FloatingActionButton.small(
                heroTag: "btn1",
                onPressed: () {
                  obj.initialPosition(obj.movingCurrentLocation!);
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.my_location_sharp,
                  size: 23.0,
                  color: Color(0xff84008c),
                ),
              ),
            ),
            Positioned(
              top: obj.advancesearch ? height * 0.3 : height * 0.4,
              left: width * 0.8,
              child: FloatingActionButton.small(
                heroTag: "btn3",
                onPressed: () {
                  obj.zoomIn();
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.white,
                child: const Icon(
                  Icons.add,
                  size: 23.0,
                  color: Color(0xff84008c),
                ),
              ),
            ),
            Positioned(
              top: obj.advancesearch ? height * 0.4 : height * 0.5,
              left: width * 0.8,
              child: FloatingActionButton.small(
                heroTag: "btn4",
                onPressed: () {
                  obj.zoomOut();
                },
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: const Icon(
                    Icons.minimize,
                    size: 23.0,
                    color: Color(0xff84008c),
                  ),
                ),
              ),
            ),

            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.05, vertical: height * 0.03),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: SingleChildScrollView(
                        physics: NeverScrollableScrollPhysics(),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                InkWell(
                                  onTap: () {
                                    obj.selectedCategory = null;
                                    obj.selectedCity = null;
                                    obj.selectedState = null;
                                    obj.selectedCategory = null;
                                    obj.advancesearch = false;
                                    obj.showsearch = false;
                                    obj.update();
                                  },
                                  child: Container(
                                    decoration: obj.advancesearch
                                        ? null
                                        : BoxDecoration(
                                            boxShadow: [
                                                BoxShadow(
                                                  color: headerBorderColor
                                                      .withOpacity(0.5),
                                                  blurStyle: BlurStyle.outer,
                                                  blurRadius: 5.r,
                                                ),
                                              ],
                                            color: obj.advancesearch
                                                ? Colors.transparent
                                                : Color(0xff84008c),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.03,
                                          vertical: height * 0.01),
                                      child: Center(
                                        child: Text(
                                          "Simple Search",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: obj.advancesearch
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    obj.selectedCategory = null;
                                    obj.selectedCity = null;
                                    obj.selectedState = null;
                                    obj.advancesearch = true;
                                    obj.showsearch = false;
                                    obj.update();
                                  },
                                  child: Container(
                                    decoration: !obj.advancesearch
                                        ? null
                                        : BoxDecoration(
                                            boxShadow: [
                                                BoxShadow(
                                                  color: headerBorderColor
                                                      .withOpacity(0.5),
                                                  blurStyle: BlurStyle.outer,
                                                  blurRadius: 5.r,
                                                ),
                                              ],
                                            color: !obj.advancesearch
                                                ? Colors.transparent
                                                : Color(0xff84008c),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: width * 0.03,
                                          vertical: height * 0.01),
                                      child: Center(
                                        child: Text(
                                          "Advance Search",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            color: !obj.advancesearch
                                                ? Colors.black
                                                : Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: height * 0.005,
                            ),
                            !obj.advancesearch
                                ? Column(
                                    children: [
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<CategoryModel>(
                                          isExpanded: true,
                                          style: CustomTextStyle.ts13normal,
                                          isDense: true,
                                          customButton: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor
                                                    .withOpacity(0.05),
                                                border: Border.all(
                                                  color: primaryColor,
                                                  width: 1.5.w,
                                                ),
                                              ),
                                              height: height * 0.05,
                                              width: width,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.02),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      obj.selectedCategory ==
                                                              null
                                                          ? 'Select a Category'
                                                          : obj.selectedCategory!
                                                                  .category_name ??
                                                              '',
                                                      style: obj.selectedCategory ==
                                                              null
                                                          ? CustomTextStyle
                                                              .ts13normal
                                                          : CustomTextStyle
                                                              .ts13normalblack,
                                                    ),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: obj.selectedCategory,
                                          items: [
                                            ...obj.categories
                                                .map((CategoryModel category) {
                                              return DropdownMenuItem<
                                                  CategoryModel>(
                                                value: category,
                                                child: Text(
                                                    category.category_name ??
                                                        '',
                                                    style: CustomTextStyle
                                                        .ts13normalblack),
                                              );
                                            }).toList(),
                                          ],
                                          dropdownSearchData:
                                              DropdownSearchData(
                                            searchInnerWidgetHeight:
                                                height * 0.1,
                                            searchController: searchController,
                                            searchInnerWidget: TextFormField(
                                                cursorColor: primaryColor,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: primaryColor,
                                                  ),
                                                  // contentPadding:
                                                  //     EdgeInsets.symmetric(
                                                  //         horizontal:
                                                  //             width * 0.05),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: primaryColor),
                                                  ),
                                                ),
                                                controller: searchController),
                                            searchMatchFn: (a, searchValue) {
                                              return a.value!.category_name!
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(searchValue
                                                      .toLowerCase());
                                            },
                                          ),
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              searchController.clear();
                                            }
                                          },
                                          onChanged: (value) {
                                            obj.selectedCategory = value;
                                            obj.showsearch = true;
                                            obj.update();
                                          },
                                        ),
                                      ),
                                      obj.showsearch
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ButtonWithBg(
                                                width: width,
                                                height: height * 0.05,
                                                btnName: 'Search',
                                                onPress: () async {
                                                  obj.showsearch = false;
                                                  obj.search_category_lawyers(
                                                      int.parse(obj
                                                          .selectedCategory!
                                                          .category_id!),
                                                      context,
                                                      height);
                                                },
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  )
                                : Column(
                                    children: [
                                      //Category
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<CategoryModel>(
                                          isExpanded: true,
                                          style: CustomTextStyle.ts13normal,
                                          isDense: true,
                                          customButton: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor
                                                    .withOpacity(0.05),
                                                border: Border.all(
                                                  color: primaryColor,
                                                  width: 1.5.w,
                                                ),
                                              ),
                                              height: height * 0.05,
                                              width: width,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.02),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        obj.selectedCategory ==
                                                                null
                                                            ? 'Select a Category'
                                                            : obj.selectedCategory!
                                                                    .category_name ??
                                                                '',
                                                        style: obj.selectedCategory ==
                                                                null
                                                            ? CustomTextStyle
                                                                .ts13normal
                                                            : CustomTextStyle
                                                                .ts13normalblack),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: obj.selectedCategory,
                                          items: [
                                            ...obj.categories
                                                .map((CategoryModel category) {
                                              return DropdownMenuItem<
                                                  CategoryModel>(
                                                value: category,
                                                child: Text(
                                                    category.category_name ??
                                                        '',
                                                    style: CustomTextStyle
                                                        .ts13normalblack),
                                              );
                                            }).toList(),
                                          ],
                                          dropdownSearchData:
                                              DropdownSearchData(
                                            searchInnerWidgetHeight:
                                                height * 0.1,
                                            searchController: searchController,
                                            searchInnerWidget: TextFormField(
                                                cursorColor: primaryColor,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: primaryColor,
                                                  ),
                                                  // contentPadding:
                                                  //     EdgeInsets.symmetric(
                                                  //         horizontal:
                                                  //             width * 0.05),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: primaryColor),
                                                  ),
                                                ),
                                                controller: searchController),
                                            searchMatchFn: (a, searchValue) {
                                              return a.value!.category_name!
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(searchValue
                                                      .toLowerCase());
                                            },
                                          ),
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              searchController.clear();
                                            }
                                          },
                                          onChanged: (value) {
                                            obj.selectedCategory = value;
                                            obj.selectedState = null;
                                            obj.update();
                                          },
                                        ),
                                      ),
                                      //State
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<
                                            Map<String, dynamic>>(
                                          isExpanded: true,
                                          style: CustomTextStyle.ts13normal,
                                          isDense: true,
                                          customButton: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor
                                                    .withOpacity(0.05),
                                                border: Border.all(
                                                  color: primaryColor,
                                                  width: 1.5.w,
                                                ),
                                              ),
                                              height: height * 0.05,
                                              width: width,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.02),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        obj.selectedState ==
                                                                null
                                                            ? 'Select a State'
                                                            : obj.selectedState![
                                                                'value'],
                                                        style: obj.selectedState ==
                                                                null
                                                            ? CustomTextStyle
                                                                .ts13normal
                                                            : CustomTextStyle
                                                                .ts13normalblack),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: obj.selectedState,
                                          items: [
                                            ...obj.states!.map(
                                                (Map<String, dynamic> state) {
                                              return DropdownMenuItem<
                                                  Map<String, dynamic>>(
                                                value: state,
                                                child: Text(state['value'],
                                                    style: CustomTextStyle
                                                        .ts13normalblack),
                                              );
                                            }).toList(),
                                          ],
                                          dropdownSearchData:
                                              DropdownSearchData(
                                            searchInnerWidgetHeight:
                                                height * 0.1,
                                            searchController: searchController,
                                            searchInnerWidget: TextFormField(
                                                cursorColor: primaryColor,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: primaryColor,
                                                  ),
                                                  // contentPadding:
                                                  //     EdgeInsets.symmetric(
                                                  //         horizontal:
                                                  //             width * 0.05),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: primaryColor),
                                                  ),
                                                ),
                                                controller: searchController),
                                            searchMatchFn: (a, searchValue) {
                                              return a.value!['value']
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(searchValue
                                                      .toLowerCase());
                                            },
                                          ),
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              searchController.clear();
                                            }
                                          },
                                          onChanged: (newvalue) {
                                            print("newvalue ${newvalue}");
                                            obj.selectedState = newvalue;
                                            obj.fetchCities(
                                                context, newvalue!['key']);
                                            obj.selectedCity = null;
                                            obj.update();
                                          },
                                        ),
                                      ),

                                      //City

                                      DropdownButtonHideUnderline(
                                        child: DropdownButton2<
                                            Map<String, dynamic>>(
                                          isExpanded: true,
                                          style: CustomTextStyle.ts13normal,
                                          isDense: true,
                                          customButton: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                color: primaryColor
                                                    .withOpacity(0.05),
                                                border: Border.all(
                                                  color: primaryColor,
                                                  width: 1.5.w,
                                                ),
                                              ),
                                              height: height * 0.05,
                                              width: width,
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: width * 0.02),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                        obj.selectedCity == null
                                                            ? 'Select a City'
                                                            : obj.selectedCity![
                                                                'city'],
                                                        style: obj.selectedCity ==
                                                                null
                                                            ? CustomTextStyle
                                                                .ts13normal
                                                            : CustomTextStyle
                                                                .ts13normalblack),
                                                    Icon(
                                                      Icons.arrow_drop_down,
                                                      color: primaryColor,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          value: obj.selectedCity,
                                          items: [
                                            ...obj.cities.map(
                                                (Map<String, dynamic> city) {
                                              return DropdownMenuItem<
                                                  Map<String, dynamic>>(
                                                value: city,
                                                child: Text(city['city'],
                                                    style: CustomTextStyle
                                                        .ts13normalblack),
                                              );
                                            }).toList(),
                                          ],
                                          dropdownSearchData:
                                              DropdownSearchData(
                                            searchInnerWidgetHeight:
                                                height * 0.1,
                                            searchController: searchController,
                                            searchInnerWidget: TextFormField(
                                                cursorColor: primaryColor,
                                                decoration: InputDecoration(
                                                  prefixIcon: Icon(
                                                    Icons.search,
                                                    color: primaryColor,
                                                  ),
                                                  enabledBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: Colors.grey),
                                                  ),
                                                  focusedBorder:
                                                      UnderlineInputBorder(
                                                    borderSide: BorderSide(
                                                        width: 1.5.w,
                                                        color: primaryColor),
                                                  ),
                                                ),
                                                controller: searchController),
                                            searchMatchFn: (a, searchValue) {
                                              return a.value!['city']!
                                                  .toString()
                                                  .toLowerCase()
                                                  .contains(searchValue
                                                      .toLowerCase());
                                            },
                                          ),
                                          onMenuStateChange: (isOpen) {
                                            if (!isOpen) {
                                              searchController.clear();
                                            }
                                          },
                                          onChanged: (value) {
                                            obj.showsearch = true;
                                            obj.selectedCity = value;
                                            obj.update();
                                          },
                                        ),
                                      ),

                                      // search  button
                                      obj.showsearch &&
                                              obj.selectedState != null &&
                                              obj.selectedCategory != null &&
                                              obj.selectedCity != null
                                          ? Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: ButtonWithBg(
                                                width: width,
                                                height: height * 0.05,
                                                btnName: 'Search',
                                                onPress: () {
                                                  obj.showsearch = false;

                                                  obj.advancesearchmethod(
                                                    int.parse(obj
                                                        .selectedCategory!
                                                        .category_id!),
                                                    obj.selectedState!['key'],
                                                    int.parse(obj.selectedCity![
                                                        'city_id']),
                                                    context,
                                                    height,
                                                  );
                                                },
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            ////////////
            SizedBox(
              height: 280.h,
            ),
            // RoundedForwardBtn(
            //   width: 250.w,
            //   onTap: () {
            //     if (obj.selectedCategoryId != null &&
            //         obj.selectedState != null &&
            //         obj.selectedCityId != null) {
            //       final apiKey = 'MG5tj4wNbrb48yFD100';
            //       final apiUrl = 'https://inkozi.com/api/01/nearest_lawyers?'
            //           'category_id=${obj.selectedCategoryId}'
            //           '&state_name=${obj.selectedState}'
            //           '&city_id=${obj.selectedCityId}'
            //           '&latitude=${obj.currentPosition!.latitude}'
            //           '&longitude=${obj.currentPosition!.longitude}'
            //           '&INKOZI-API-KEY=$apiKey';
            //       // Fetch lawyers based on the user selections
            //       obj.loadSpecialLawyers(apiUrl, context);
            //     }
            //     //Navigator.pushNamed(context, '/msgscreen');
            //   },
            // ),
          ]);
        }),
        drawer: DrawerWidget(),
      ),
    );
  }
}
