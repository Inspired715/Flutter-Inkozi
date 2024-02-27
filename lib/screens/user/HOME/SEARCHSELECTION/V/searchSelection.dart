// import 'dart:async';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:inkozi/screens/HOME/SEARCHSELECTION/C/controller.dart';
// import 'package:inkozi/widgets/ButtonWidget.dart';
// import 'package:inkozi/widgets/CustomAppBar.dart';
// import 'package:inkozi/widgets/DrawerWidget.dart';

// import 'package:google_maps_flutter/google_maps_flutter.dart';

// class SearchSelection extends StatefulWidget {
//   const SearchSelection({super.key});

//   static const String routeName = '/searchselection';

//   static Route route() {
//     return MaterialPageRoute(
//       settings: RouteSettings(name: routeName),
//       builder: (_) => SearchSelection(),
//     );
//   }

//   @override
//   State<SearchSelection> createState() => _SearchSelectionState();
// }

// class _SearchSelectionState extends State<SearchSelection> {
//   double? latitude;
//   double? longitude;
//   String? address;
//   //
//   final Completer<GoogleMapController> _controller =
//       Completer<GoogleMapController>();

//   static const CameraPosition _kGooglePlex = CameraPosition(
//     target: LatLng(44.182205, -84.506836),
//     zoom: 1.4746,
//   );

//   //
//   bool alertDialogShown = false;
//   @override
//   void initState() {
//     Get.put(SearchSelectionCOntroller());
//     super.initState();
//     Future.delayed(Duration(seconds: 1), () {
//       if (!alertDialogShown) {
//         SearchSelectionCOntroller.to.showDIalogueLocation(context);
//         alertDialogShown = true; // Set the flag to true
//       }
//     });
//   }

//   //

//   @override
//   Widget build(BuildContext context) {
//     var height = MediaQuery.of(context).size.height;
//     var width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: CustomAppBar(),
//       body: GetBuilder<SearchSelectionCOntroller>(initState: (state) {
//         Get.put(SearchSelectionCOntroller());
//         SearchSelectionCOntroller.to.getPosition(context);
//         SearchSelectionCOntroller.to.livelistenLocation(context);
//       }, builder: (obj) {
//         return Stack(
//           children: [
//             obj.currentPosition == null
//                 ? Center(
//                     child: CircularProgressIndicator(
//                     color: Color(0xff84008c),
//                   ))
//                 : Container(
//                     height: MediaQuery.of(context).size.height.h,
//                     width: double.infinity,
//                     child: GoogleMap(
//                       onTap: (argument) {},
//                       zoomControlsEnabled: true,
//                       onMapCreated: (controller) {
//                         if (!obj.mapController.isCompleted) {
//                           obj.mapController.complete(controller);
//                         }
//                       },
//                       mapType: obj.mapType,
//                       myLocationEnabled: true,
//                       myLocationButtonEnabled: false,
//                       initialCameraPosition: CameraPosition(
//                         zoom: 1,
//                         target: LatLng(obj.currentPosition!.latitude,
//                             obj.currentPosition!.longitude),
//                       ),
//                       // markers: Set<Marker>.of(markers),
//                       padding: EdgeInsets.only(
//                           bottom: MediaQuery.of(context).size.height * 0.20),
//                     ),
//                   ),
//             Positioned(
//               top: height * 0.3,
//               left: width * 0.8,
//               child: FloatingActionButton(
//                 heroTag: "btn3",
//                 onPressed: () {
//                   obj.mapTypeChange();
//                 },
//                 materialTapTargetSize: MaterialTapTargetSize.padded,
//                 backgroundColor: Colors.white,
//                 child: const Icon(
//                   Icons.map,
//                   size: 23.0,
//                   color: Color(0xff84008c),
//                 ),
//               ),
//             ),
//             Positioned(
//               top: height * 0.4,
//               left: width * 0.8,
//               child: FloatingActionButton(
//                 heroTag: "btn1",
//                 onPressed: () {
//                   obj.initialPosition(obj.movingCurrentLocation!);
//                 },
//                 materialTapTargetSize: MaterialTapTargetSize.padded,
//                 backgroundColor: Colors.white,
//                 child: const Icon(
//                   Icons.my_location_sharp,
//                   size: 23.0,
//                   color: Color(0xff84008c),
//                 ),
//               ),
//             ),
//             Positioned(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(
//                     height: 420.h,
//                   ),
//                   RoundedForwardBtn(
//                     width: 240.w,
//                     onTap: () {
//                       // Navigator.pushNamed(context, '/initial');
//                       obj.getcategories();
//                     },
//                   ),
//                 ],
//               ),
//             )
//           ],
//         );
//       }),
//       drawer: DrawerWidget(),
//     );
//   }
// }
