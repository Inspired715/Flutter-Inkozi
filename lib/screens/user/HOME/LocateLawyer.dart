import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:inkozi/UTILIS/colors.dart';
import 'package:inkozi/UTILIS/text_style.dart';
import '../../../model/CategoryLawyerModel.dart';
import '../../../model/CategoryModel.dart';
import '../../../model/QuestionModel.dart';
import '../../../repo/category_lawyer_repositories.dart';
import '../../../repo/category_repositories.dart';
import '../../../repo/ques_repo.dart';
import '../../../widgets/widget.dart';
import '../../question/QuestionPage.dart';

class LocateLawyer extends StatefulWidget {
  final double latitude;
  final double longitude;
  final String address;
  const LocateLawyer(
      {super.key,
      required this.latitude,
      required this.longitude,
      required this.address});

  static const String routeName = '/locatelawer';

  static Route route() {
    double latitude = 0; // Obtain the latitude value.
    double longitude = 0; // Obtain the longitude value.
    String address = "..."; // Obtain the address value.
    //
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (_) => LocateLawyer(
        latitude: latitude,
        longitude: longitude,
        address: address,
      ),
    );
  }

  @override
  State<LocateLawyer> createState() => _LocateLawyerState();
}

class _LocateLawyerState extends State<LocateLawyer> {
  List<CategoryModel> categories = [];
  String? selectedCategoryId; // Use nullable to handle initial state
  List<CategoryLawyerModel> categoryLawyers = [];
  // Initialize the list of questions
  List<CategoryQuestions>? questions = [];

  // Define a GoogleMapController to control the map
  //late GoogleMapController mapController;
  final Completer<GoogleMapController> _controller =
      Completer<GoogleMapController>();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(44.182205, -84.506836),
    // zoom: 14.4746,
    zoom: 1.4746,
  );

  // Define markers to display lawyer positions
  final Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    loadCategories();
  }

  Future<void> loadCategories() async {
    try {
      final CategoryRepository categoryRepository = CategoryRepository();
      final List<CategoryModel> loadedCategories =
          await categoryRepository.getCategory();
      print('Loaded Categories: $loadedCategories');
      setState(() {
        categories = loadedCategories;
        if (selectedCategoryId == null && categories.isNotEmpty) {
          // Initialize selectedCategoryId with the first category ID
          selectedCategoryId = categories.first.category_id;
        }
      });
    } catch (e) {
      print('Error loading categories: $e');
    }
  }

  //
  Future<void> loadCategoryLawyers(String? categoryId) async {
    try {
      // Construct the URL with the selected category_id
      final CategoryLawyerRepository categoryLawyerRepository =
          CategoryLawyerRepository();
      final List<CategoryLawyerModel> loadedCategoryLawyers =
          await categoryLawyerRepository.getCategoryLawyer(categoryId!);
      setState(() {
        categoryLawyers = loadedCategoryLawyers;
      });

      // Filter the list of lawyers based on the selected category_id
      List<CategoryLawyerModel> filteredLawyers = categoryLawyers
          .where((lawyer) => lawyer.categoryId == selectedCategoryId)
          .toList();

      // Create a list of markers for filtered lawyers
      List<Marker> lawyerMarkers = filteredLawyers.map((lawyer) {
        final double lat = double.tryParse(lawyer.lat ?? '0') ?? 0.0;
        final double lng = double.tryParse(lawyer.lng ?? '0') ?? 0.0;
        final String firstName = lawyer.firstName ?? '';
        final String lastName = lawyer.lastName ?? '';
        final String lawtype = lawyer.lawtype ?? '';

        return Marker(
          markerId: MarkerId('${lawyer.advisorId}'),
          position: LatLng(lat, lng),
          icon:
              BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
          infoWindow: InfoWindow(
            title: '$firstName $lastName',
            snippet: 'Address: ${lawyer.address}',
            //
            onTap: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                title: Column(
                  children: [
                    Text(
                      '$firstName $lastName',
                      style: CustomTextStyle.tpr18bold,
                    ),
                    Text(
                      '$lawtype',
                      style: CustomTextStyle.tpr15normal,
                    ),
                  ],
                ),
                content: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 30),
                      child: ButtonWithBg(
                        btnName: 'Call',
                        onPress: () {
                          Navigator.pushNamed(context, '/');
                        },
                      ),
                    ),
                    ButtonWithBg(
                      btnName: 'Ask Question',
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AskQuestions(
                                selectedCategoryId:
                                    selectedCategoryId ?? 'defaultCategoryID'),
                          ),
                        );
                      },
                    )
                  ],
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('Close'),
                  ),
                ],
              ),
            ),
          ),
        );
      }).toList();

      // Add the current location marker to the lawyer markers list
      lawyerMarkers.add(
        Marker(
          markerId: MarkerId('current_location'),
          position: LatLng(widget.latitude, widget.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
          infoWindow: InfoWindow(title: 'Current Location'),
        ),
      );

      // Update the markers on the map
      updateMarkers(lawyerMarkers);

      // Load category questions
      final QuestionRepository questionRepository = QuestionRepository();
      final QuestionModel questionData =
          await questionRepository.getCategoryQuestions(int.parse(categoryId));

      setState(() {
        questions = questionData.categoryQuestions;
      });
    } catch (e) {
      print('Error loading category lawyers: $e');
    }
  }

  // Method to update the map markers
  void updateMarkers(List<Marker> newMarkers) {
    setState(() {
      markers.clear();
      markers.addAll(newMarkers);
    });
  }

  //
  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height.h,
            width: double.infinity,
            child: GoogleMap(
              myLocationEnabled: true,
              mapType: MapType.normal,
              initialCameraPosition: _kGooglePlex,
              markers: markers,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
            ),
          ),
          Positioned(
              child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Category Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: bgColor,
                        //labelText: 'Select a Category',
                        border: OutlineInputBorder(),
                      ),
                      value: selectedCategoryId,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedCategoryId = newValue;
                          // Dispatch the event with the selected category's ID

                          loadCategoryLawyers(selectedCategoryId);
                          // Update markers based on the selected category's lawyers
                        });
                      },
                      items: categories.map((CategoryModel category) {
                        return DropdownMenuItem<String>(
                          value: category.category_id, // Match with category_id
                          child: Text(category.category_name ?? ''),
                        );
                      }).toList(),
                    ),
                    ////////////
                    // SizedBox(
                    //   height: 350.h,
                    // ),
                    // RoundedForwardBtn(
                    //   width: 200.w,
                    //   onTap: () {
                    //     Navigator.pushNamed(context, '/findlawer');
                    //   },
                    // ),
                  ],
                ),
              ),
            ],
          ))
        ],
      ),
      drawer: DrawerWidget(),
    );
  }
}

//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.symmetric(
//                           vertical: 15, horizontal: 40),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                            DropdownButtonFormField<String>(
//                             decoration: InputDecoration(
//                               //labelText: 'Select a Category',
//                               border: OutlineInputBorder(),
//                             ),
//                             value: selectedCategory,
//                             onChanged: (String? newValue) {
//                               setState(() {
//                                 selectedCategory = newValue!;
//                               });
//                             },
//                             items: categories.map<DropdownMenuItem<String>>(
//                               (String value) {
//                                 return DropdownMenuItem<String>(
//                                   value: value,
//                                   child: Text(value),
//                                 );
//                               },
//                             ).toList(),
//                           ),
//                         ],
//                       ),
//                     ),
//                     ////////////
//                     SizedBox(
//                       height: 280.h,
//                     ),
//                     RoundedForwardBtn(
//                       width: 250.w,
//                       onTap: () {
//                         Navigator.pushNamed(context, '/findlawer');
//                       },
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }