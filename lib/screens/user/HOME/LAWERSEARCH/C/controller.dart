import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:developer' as d;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inkozi/constrains/app_constrains.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import 'package:http/http.dart' as http;
import 'package:inkozi/model/CategoryLawyerModel.dart';
import 'package:inkozi/model/CategoryModel.dart';
import 'package:inkozi/model/QuestionModel.dart';
import 'package:inkozi/repo/category_repositories.dart';
import 'package:inkozi/screens/USER/HOME/CHAT/C/controller.dart';
import 'package:inkozi/widgets/ButtonWidget.dart';
import 'package:inkozi/widgets/custom_snackbar.dart';
import 'package:location/location.dart' as l;
import 'dart:ui' as ui;
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class LawyerSearchContoller extends GetxController {
  static LawyerSearchContoller get to => Get.find();
  LocationData? locationData;
  StreamSubscription? locationSubscription;
  l.Location locationloc = l.Location();
  Completer<GoogleMapController> mapController =
      Completer<GoogleMapController>();
  LatLng? movingCurrentLocation;
  MapType mapType = MapType.normal;
  LatLng? currentPosition;
  bool advancesearch = false;
  List<CategoryModel> categories = [];
  CategoryModel? selectedCategory;
  bool showsearch = false;
  List<CategoryLawyerModel> categoryLawyers = [];

  List<String> bailbondLIst = [
    'chiropractor',
    'Bail Bonds',
  ];
  Map<String, dynamic>? selectedState;
  String? bailbond;
  Map<String, String> statesSet = {};
  List<Map<String, dynamic>>? states;

  List<Map<String, dynamic>> cities = [];
  Map<String, dynamic>? selectedCity; // Initial value

  List<Map<String, dynamic>> specialLawyers = [];

  // Initialize the list of questions
  List<CategoryQuestions> questions = [];

  final Set<Marker> markers = {};
  void showAlertDialog(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          title: Text('Select your Search Option',
              textAlign: TextAlign.center, style: CustomTextStyle.tp22bold),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                child: ButtonWithBg(
                  btnName: 'Lawyer Near Me',
                  onPress: () async {},
                ),
              ),
              ButtonWithBg(
                btnName: 'Special Search',
                onPress: () {
                  Navigator.pushNamed(context, '/lawyerbyspecialsearch');
                },
              )
            ],
          ),
        );
      },
    );
  }

  void zoomIn() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.zoomIn());
  }

  void zoomOut() async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(CameraUpdate.zoomOut());
  }

  void showDIalogueLocation(
    BuildContext context,
  ) async {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    l.Location loc = l.Location();

    bool serviceEnabled;
    serviceEnabled = await loc.serviceEnabled();

    if (!serviceEnabled) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          int index = 10;
          return StatefulBuilder(builder: (context, snapshot) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              backgroundColor:
                  Colors.white, // Set the background color to white
              content: SizedBox(
                width: width,
                height: height * 0.3,
                child: Stack(
                  children: [
                    Container(
                      width: width,
                      height: height * 0.3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image(
                            image: AssetImage('assets/images/logo.png'),
                          ),
                          Text(
                            'Allow InKozi to access this device’s Location?',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              index != 0
                                  ? OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Deny",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "Deny",
                                        style: const TextStyle(),
                                      ),
                                    ),
                              index != 1
                                  ? OutlinedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                        getPosition(context);
                                      },
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            side: const BorderSide(
                                                color: Colors.grey),
                                          ),
                                        ),
                                      ),
                                      child: const Text(
                                        "Allow",
                                        style:
                                            const TextStyle(color: Colors.grey),
                                      ),
                                    )
                                  : ElevatedButton(
                                      style: ButtonStyle(
                                        shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                      ),
                                      onPressed: () {},
                                      child: const Text(
                                        "Allow",
                                        style: const TextStyle(),
                                      ),
                                    ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    // Close Button
                    Positioned(
                      top: 16,
                      left: 16,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.red,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
        },
      );
    } else {
      locationData = await loc.getLocation();
      currentPosition =
          LatLng(locationData!.latitude!, locationData!.longitude!);
    }
  }

  Future<void> getPosition(context) async {
    l.Location location = l.Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {}
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {}
    }
    locationData = await location.getLocation();
    currentPosition = LatLng(locationData!.latitude!, locationData!.longitude!);
    update();
  }

  void initialPosition(LatLng latLng) async {
    final GoogleMapController controller = await mapController.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: latLng,
          zoom: 10.00,
        ),
      ),
    );
    update();
  }

  void mapTypeChange() {
    mapType = mapType == MapType.normal ? MapType.satellite : MapType.normal;
    update();
  }

  void livelistenLocation(BuildContext context) {
    Future.delayed(Duration.zero, () async {
      locationSubscription =
          locationloc.onLocationChanged.handleError((onError) {
        locationSubscription!.cancel();
        locationSubscription = null;
        update();
      }).listen((event) async {
        // getdrivers(context);
        movingCurrentLocation = LatLng(event.latitude!, event.longitude!);

        update();
      });
      update();
    });
  }

  List<CategoryLawyerModel> categoryLawyerModellist = [];
  void search_category_lawyers(
      int catID, BuildContext context, double height) async {
    String url =
        'https://www.inkozi.com/api/01/search_category_lawyers?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&category_id=${catID}}';
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      categoryLawyerModellist.clear();
      for (var l in data["lawyers"]) {
        CategoryLawyerModel model = await CategoryLawyerModel.fromJson(l);
        categoryLawyerModellist.add(model);
      }
      d.log("markers are ${categoryLawyerModellist.length}");

      if (categoryLawyerModellist.isEmpty) {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return StatefulBuilder(builder: (c, snapshot) {
                return Transform.scale(
                  scale: a1.value,
                  child: Opacity(
                    opacity: a1.value,
                    child: StatefulBuilder(builder: (context, snapshot) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        content: SizedBox(
                          height: height * 0.37,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                  Text(
                                    "Apologies, there are no service providers operating in this region. Try our advance search.",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.ts13normal,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ButtonWithBg(
                                    btnName: 'OK',
                                    onPress: () {
                                      Navigator.pop(c);
                                    },
                                  ),
                                ],
                              ),

                              // Close Button
                              Positioned(
                                top: 16,
                                left: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              });
            },
            transitionDuration: Duration(milliseconds: 200),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, animation1, animation2) {
              return Container();
            });
      } else {
        updateMarkers(categoryLawyerModellist, context);
      }
    }
  }
///////////// get questions

  Future getCategoryQuestions(int categoryId) async {
    String baseUrl =
        'https://www.inkozi.com/api/01/category_detail?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&category_id=';
    String categoryQuestionsUrl = '$baseUrl$categoryId';

    try {
      var response = await http.get(Uri.parse(categoryQuestionsUrl));
      if (response.statusCode == 200) {
        questions.clear();
        var data = jsonDecode(response.body);
        QuestionModel model = QuestionModel.fromJson(data);
        questions = model.categoryQuestions!;
      } else {
        print(response.reasonPhrase);
      }
    } catch (e) {
      print(e);
    }
  }

///////////////
  Future<void> loadCategories() async {
    categories.clear();
    try {
      final CategoryRepository categoryRepository = CategoryRepository();

      final List<CategoryModel> loadedCategories =
          await categoryRepository.getCategory();

      loadedCategories
          .sort((a, b) => a.category_name!.compareTo(b.category_name!));

      categories = loadedCategories;
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  void initfunction(context) {
    showDIalogueLocation(context);

    LawyerSearchContoller.to.loadCategories();
    LawyerSearchContoller.to.fetchStates();
  }

  Future<void> fetchStates() async {
    final apiUrl =
        'https://inkozi.com/api/01/states?INKOZI-API-KEY=MG5tj4wNbrb48yFD100';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        statesSet.clear();
        states = [];
        final responseData = json.decode(response.body)['states'];
        final filteredStates = <String, String>{};

        for (var entry in responseData.entries) {
          // Check for duplicate state abbreviations and only add unique entries.
          if (!filteredStates.containsKey(entry.key)) {
            filteredStates[entry.key] = entry.value;
          }
        }

        statesSet = filteredStates;
        statesSet.entries.forEach((entry) {
          Map<String, dynamic> entryMap = {
            'key': entry.key,
            'value': entry.value,
          };

          states!.add(entryMap);
        });
      }
    } catch (e) {
      print('Error fetching data: $e');
    }
  }
//cities

  Future<void> fetchCities(context, String selectedstate) async {
    cities.clear();

    final apiKey = 'MG5tj4wNbrb48yFD100';
    final apiUrl =
        'https://www.inkozi.com/api/01/state_cities?INKOZI-API-KEY=$apiKey&state_name=$selectedstate';

    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);

        final citiesData = responseData['cities'];

        cities = List<Map<String, dynamic>>.from(citiesData);
        update();
      }
    } catch (e) {
      print('Error fetching cities data: $e');
    }
  }

  void callNumber(String phone) async {
    Uri url = Uri(scheme: "tel", path: '+1${phone}');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      print("Can't open dial pad!");
    }
  }

  //
  Future<Uint8List> getBytesFromCanvas(
      int width, int height, Uint8List dataBytes) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    // Draw circular path for the mask
    final Path path = Path()
      ..addOval(Rect.fromCircle(
          center: Offset(width / 2, height / 2), radius: width / 2));

    canvas.clipPath(path);

    // Draw the circular mask
    final Paint maskPaint = Paint()..color = Colors.transparent;
    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(0.0, 0.0, width.toDouble(), height.toDouble()),
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      maskPaint,
    );

    // Load the image and draw it within the circular mask
    var imaged = await loadImage(dataBytes.buffer.asUint8List());
    canvas.drawImageRect(
      imaged,
      Rect.fromLTRB(
          0.0, 0.0, imaged.width.toDouble(), imaged.height.toDouble()),
      Rect.fromLTRB(0.0, 0.0, width.toDouble(), height.toDouble()),
      new Paint(),
    );

    // Convert the canvas to an image and then to bytes
    final img = await pictureRecorder.endRecording().toImage(width, height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data!.buffer.asUint8List();
  }

  Future<ui.Image> loadImage(List<int> img) async {
    Uint8List uint8List = Uint8List.fromList(img);
    final Completer<ui.Image> completer = new Completer();
    ui.decodeImageFromList(uint8List, (ui.Image img) {
      return completer.complete(img);
    });
    return completer.future;
  }

  Future<Marker> createMarkerFromImageBytes(
      LatLng position, Uint8List imageBytes) async {
    return Marker(
      markerId: MarkerId('customMarker'),
      position: position,
      icon: BitmapDescriptor.fromBytes(imageBytes),
    );
  }

  void animateCamera(List<LatLng> list) async {
    if (list.isNotEmpty) {
      GoogleMapController controller = await mapController.future;

      // Calculate bounds for all LatLng coordinates
      LatLngBounds latLngBounds = calculateLatLngBounds(list);

      // Animate the camera to fit all LatLng coordinates
      controller
          .animateCamera(CameraUpdate.newLatLngBounds(latLngBounds, 50.0));
    }
  }

  LatLngBounds calculateLatLngBounds(List<LatLng> latLngList) {
    double minLat = double.infinity;
    double minLng = double.infinity;
    double maxLat = double.negativeInfinity;
    double maxLng = double.negativeInfinity;

    for (LatLng latLng in latLngList) {
      minLat = min(minLat, latLng.latitude);
      minLng = min(minLng, latLng.longitude);
      maxLat = max(maxLat, latLng.latitude);
      maxLng = max(maxLng, latLng.longitude);
    }

    LatLng southwest = LatLng(minLat, minLng);
    LatLng northeast = LatLng(maxLat, maxLng);

    return LatLngBounds(southwest: southwest, northeast: northeast);
  }

  // Method to update the map markers based on lawyer positions
  void updateMarkers(List<CategoryLawyerModel> lawyers, context) async {
    markers.clear();
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    List<LatLng> list = [];
    for (var l in lawyers) {
      list.add(LatLng(double.tryParse(l.lat ?? '0') ?? 0.0,
          double.tryParse(l.lng ?? '0') ?? 0.0));
    }
    animateCamera(list);

    for (var lawyer in lawyers) {
      final double lat = double.tryParse(lawyer.lat ?? '0') ?? 0.0;
      final double lng = double.tryParse(lawyer.lng ?? '0') ?? 0.0;
      final String firstName = lawyer.firstName ?? '';
      final String lastName = lawyer.lastName ?? '';
      final String lawtype = lawyer.lawtype ?? '';
      final String image = lawyer.imageUrl ?? '';
      final String phone = lawyer.phone ?? '';
      final String businesslogo = lawyer.business_logo ?? '';
      final String rateperhour = lawyer.rateperhour ?? '';

      Uint8List bytes = (await NetworkAssetBundle(Uri.parse(lawyer.imageUrl!))
              .load(lawyer.imageUrl!))
          .buffer
          .asUint8List();
      final Uint8List markerIcoenter =
          await getBytesFromCanvas(130, 130, bytes);

      markers.add(
        Marker(
          onTap: () {
            initialPosition(LatLng(lat, lng));
          },
          markerId: MarkerId('${lawyer.advisorId}'),
          position: LatLng(lat, lng),
          icon: BitmapDescriptor.fromBytes(markerIcoenter),
          infoWindow: InfoWindow(
            title: '$firstName $lastName',
            snippet: 'Address: ${lawyer.address}',
            onTap: () async {
              final double rating = double.parse(lawyer.ratings ?? '0.0');
              getCategoryQuestions(int.parse(lawyer.categoryId!)).then(
                (value) {
                  showGeneralDialog(
                    barrierColor: Colors.black.withOpacity(0.5),
                    transitionBuilder: (context, a1, a2, widget) {
                      return Transform.scale(
                        scale: a1.value,
                        child: Opacity(
                          opacity: a1.value,
                          child: AlertDialog(
                            backgroundColor: Colors.white,
                            shape: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(16.0)),
                            title: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: 50.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: 25.w,
                                    height: 25.h,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 20.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Container(
                                  height: height * 0.15,
                                  width: width * 0.3,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      width: 5.sp,
                                      color: primaryColor,
                                    ),
                                    image: image.isEmpty
                                        ? DecorationImage(
                                            fit: BoxFit.cover,
                                            image: AssetImage(
                                                'assets/images/man.png'),
                                          )
                                        : DecorationImage(
                                            fit: BoxFit.cover,
                                            image: NetworkImage(image),
                                          ),
                                  ),
                                ),
                                Text(
                                  '$firstName $lastName',
                                  style: TextStyle(
                                      color: textProfile,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                rateperhour.isNotEmpty
                                    ? Text(
                                        'Hourly rate : ${rateperhour}',
                                        style: CustomTextStyle.pc17med,
                                      )
                                    : SizedBox(),
                                Text(
                                  '$lawtype',
                                  style: TextStyle(
                                      color: textProfile,
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.normal),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(vertical: 10.h),
                                  child:
                                      Center(child: StarRating(rating: rating)),
                                ),
                                businesslogo.isEmpty
                                    ? SizedBox()
                                    : Image(
                                        height: height * 0.05,
                                        image: NetworkImage(
                                          businesslogo,
                                        )),
                                Container(
                                  height: height * 0.03,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ButtonWithBg(
                                      width: 100.w,
                                      btnName: 'Text',
                                      onPress: () async {
                                        showquestionsDialogue(
                                          parentcontext: context,
                                          questions: questions,
                                          context: context,
                                          lawyerModel: lawyer,
                                        );
                                      },
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    ButtonWithBg(
                                      width: 100.w,
                                      btnName: 'Call',
                                      onPress: () {
                                        callNumber(phone);
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    transitionDuration: Duration(milliseconds: 200),
                    barrierDismissible: true,
                    barrierLabel: '',
                    context: context,
                    pageBuilder: (context, animation1, animation2) {
                      return Container();
                    },
                  );
                },
              );
              UserChatCOntroller.to.getQuestionsSendReqUser(
                context: context,
              );
            },
          ),
        ),
      );
    }

    update();
  }

// ADVANCE SEARCH
  void advancesearchmethod(int catID, String statename, int cityid,
      BuildContext context, double height) async {
    d.log("catID is ${catID}");
    d.log("statename is ${statename}");
    d.log("cityid is ${cityid}");
    String url =
        'http://inkozi.com/api/01/search_state_city_category_lawyers?INKOZI-API-KEY=MG5tj4wNbrb48yFD100&category_id=${catID}&state_name=${statename}&city_id=${cityid}';
    var response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      categoryLawyerModellist.clear();

      for (var l in data["lawyers"]) {
        CategoryLawyerModel model = await CategoryLawyerModel.fromJson(l);
        categoryLawyerModellist.add(model);
      }
      print("obtained list is ${categoryLawyerModellist.length}");
      if (categoryLawyerModellist.isEmpty) {
        showGeneralDialog(
            barrierColor: Colors.black.withOpacity(0.5),
            transitionBuilder: (context, a1, a2, widget) {
              return StatefulBuilder(builder: (context, snapshot) {
                return Transform.scale(
                  scale: a1.value,
                  child: Opacity(
                    opacity: a1.value,
                    child: StatefulBuilder(builder: (c, snapshot) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        content: SizedBox(
                          height: height * 0.37,
                          child: Stack(
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image(
                                    image: AssetImage('assets/images/logo.png'),
                                  ),
                                  Text(
                                    "Apologies, there are no service providers operating in this region. Try our advance search.",
                                    textAlign: TextAlign.center,
                                    style: CustomTextStyle.ts13normal,
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  ButtonWithBg(
                                    btnName: 'OK',
                                    onPress: () {
                                      Navigator.pop(c);
                                    },
                                  ),
                                ],
                              ),

                              // Close Button
                              Positioned(
                                top: 16,
                                left: 16,
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Container(
                                    width: 25,
                                    height: 25,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: primaryColor,
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.close,
                                        size: 20,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                );
              });
            },
            transitionDuration: Duration(milliseconds: 200),
            barrierDismissible: true,
            barrierLabel: '',
            context: context,
            pageBuilder: (context, animation1, animation2) {
              return Container();
            });
      } else {
        updateMarkers(categoryLawyerModellist, context);
      }
    }
  }

  void showquestionsDialogue({
    required List<CategoryQuestions> questions,
    required BuildContext context,
    required BuildContext parentcontext,
    required CategoryLawyerModel? lawyerModel,
  }) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    int? _oneValue;
    String? questionID;
    String? questiontext;

    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return StatefulBuilder(builder: (context, snapshot) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  backgroundColor: Colors.white,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ask Question',
                        style: CustomTextStyle.tpr18bold,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: primaryColor,
                          ),
                          child: const Center(
                            child: Icon(
                              Icons.close,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  content: SingleChildScrollView(
                    physics: NeverScrollableScrollPhysics(),
                    child: questions.isEmpty
                        ? Center(
                            child: Padding(
                              padding:
                                  EdgeInsets.symmetric(vertical: height * 0.03),
                              child: Text(
                                'No Questions',
                                style: CustomTextStyle.pc17med,
                              ),
                            ),
                          )
                        : Column(
                            children: List.generate(
                              questions.length,
                              (index) => RadioListTile(
                                  selectedTileColor: primaryColor,
                                  activeColor: primaryColor,
                                  title: Text(
                                    questions[index].question!,
                                    style: CustomTextStyle.ts13normalblack,
                                  ),
                                  value: index,
                                  groupValue: _oneValue,
                                  onChanged: (value) {
                                    snapshot(() {
                                      _oneValue = value;
                                      questiontext = questions[index].question!;
                                      questionID = questions[index].id!;
                                    });
                                  }),
                            ),
                          ),
                  ),
                  actions: [
                    Center(
                      child: ButtonWithBg(
                        btnName: 'Send Request',
                        onPress: () async {
                          if (questiontext != null) {
                            Navigator.pop(context);
                            sendquestionRequest(
                              height: height,
                              width: width,
                              context: parentcontext,
                              advertise_id: '0',
                              question: questiontext!,
                              state: lawyerModel!.state ?? 'FL',
                              advisor_id: lawyerModel.advisorId!,
                              category_id: lawyerModel.categoryId!,
                              city_id: lawyerModel.cityId!,
                              quesionID: questionID!,
                            );
                          }
                        },
                      ),
                    )
                  ],
                ),
              ),
            );
          });
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

// question sending
  void sendquestionRequest({
    required String question,
    required String state,
    required String advisor_id,
    required String category_id,
    required String city_id,
    required String advertise_id,
    required String quesionID,
    required BuildContext context,
    required double height,
    required double width,
  }) async {
    final apiUrl = 'https://www.inkozi.com/api/01/save_question';

    var map = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100',
      'user_id': StaticValues.userInfo!.userId,
      'question': question,
      'advertise_id': advertise_id,
      'advisor_id': advisor_id,
      'category_id': category_id,
      'state': state,
      'city_id': city_id
    };
    final Map<String, String> headers = {
      'INKOZI-API-KEY': 'MG5tj4wNbrb48yFD100'
    };
    http.Response response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: map,
    );
    print("map is ${map.toString()}");
    print("response.statusCode  ${response.statusCode}");

    if (response.statusCode == 500) {
      showCustomSnackBar("Thank you, your question was sent", isError: false);
      UserChatCOntroller.to.getQuestionsSendReqUser(
        context: context,
      );
    } else if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      d.log("datadata ${data}");
      if (data['success'] != '') {
        showCustomSnackBar(data['success'], isError: false);
        UserChatCOntroller.to.getQuestionsSendReqUser(
          context: context,
        );
      } else {
        showDIaloguePavement(data['error'], context, height, width);
      }
    }
  }

  // pavement dialogue
  void showDIaloguePavement(
    String msg,
    BuildContext c,
    double height,
    double width,
  ) async {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionBuilder: (context, a1, a2, widget) {
          return StatefulBuilder(builder: (context, snapshot) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: StatefulBuilder(builder: (context, snapshot) {
                  return AlertDialog(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    content: SizedBox(
                      height: height * 0.37,
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image(
                                image: AssetImage('assets/images/logo.png'),
                              ),
                              Text(
                                msg,
                                textAlign: TextAlign.center,
                                style: CustomTextStyle.ts13normal,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              ButtonWithBg(
                                btnName: 'OK',
                                onPress: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),

                          // Close Button
                          Positioned(
                            top: 16,
                            left: 16,
                            child: GestureDetector(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: primaryColor,
                                ),
                                child: const Center(
                                  child: Icon(
                                    Icons.close,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          });
        },
        transitionDuration: Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: c,
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }
}

class StarRating extends StatelessWidget {
  final double rating;

  StarRating({required this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: List.generate(5, (index) {
        if (index < rating.floor()) {
          return Icon(
            Icons.star,
            color: Colors.amber,
            size: 25.sp,
          );
        } else {
          if (index < rating) {
            return Icon(
              Icons.star_half,
              color: Colors.amber,
              size: 25.sp,
            );
          } else {
            return Icon(
              Icons.star_border,
              color: Colors.amber,
              size: 25.sp,
            );
          }
        }
      }),
    );
  }
}
