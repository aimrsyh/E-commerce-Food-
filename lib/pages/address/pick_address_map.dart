import 'package:ecomm_food/base/custom_button.dart';
import 'package:ecomm_food/controllers/location_controller.dart';
import 'package:ecomm_food/pages/address/widgets/search_location_dialogue.dart';
import 'package:ecomm_food/routes/route_helper.dart';
import 'package:ecomm_food/utils/colors.dart';
import 'package:ecomm_food/utils/dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class PickAddressMap extends StatefulWidget {
  final bool fromsignup;
  final bool fromAddress;
  final GoogleMapController? googleMapController;
  const PickAddressMap(
      {Key? key,
      required this.fromsignup,
      required this.fromAddress,
      this.googleMapController})
      : super(key: key);

  @override
  State<PickAddressMap> createState() => _PickAddressMapState();
}

class _PickAddressMapState extends State<PickAddressMap> {
  late LatLng _initialPosition;
  late GoogleMapController _mapController;
  late CameraPosition _cameraPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationController>().addressList.isEmpty) {
      _initialPosition = LatLng(5.3833318, 100.416665);
      _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
    } else {
      if (Get.find<LocationController>().addressList.isNotEmpty) {
        _initialPosition = LatLng(
            double.parse(Get.find<LocationController>().getAddress["latitude"]),
            double.parse(
                Get.find<LocationController>().getAddress["longitude"]));
        _cameraPosition = CameraPosition(target: _initialPosition, zoom: 17);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocationController>(builder: (locationController) {
      return Scaffold(
        body: SafeArea(
            child: Center(
          child: SizedBox(
            width: double.maxFinite,
            child: Stack(
              children: [
                GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: _initialPosition, zoom: 17),
                  zoomControlsEnabled: false,
                  onCameraMove: (CameraPosition cameraPosition) {
                    _cameraPosition = cameraPosition;
                  },
                  onCameraIdle: () {
                    Get.find<LocationController>()
                        .updatePosition(_cameraPosition, false);
                  },
                  onMapCreated: (GoogleMapController mapController) {
                    _mapController = mapController;
                    if (!widget.fromAddress) {}
                  },
                ),
                Center(
                  child: !locationController.loading
                      ? Image.asset(
                          "assets/image/pick_marker.png",
                          height: 50,
                          width: 50,
                        )
                      : CircularProgressIndicator(),
                ),
                /*
                showing and selecting address
                */
                Positioned(
                  top: Dimensions.height45,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  child: InkWell(
                    onTap: () => Get.dialog(
                        LocationDialogue(mapController: _mapController)),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: Dimensions.width10,
                      ),
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.mainColor,
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20 / 2),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 25,
                            color: Colors.white,
                          ),
                          Expanded(
                            child: Text(
                              '${locationController.pickPlacemark.name ?? ''}',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Dimensions.font16,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(
                            width: Dimensions.width10,
                          ),
                          Icon(
                            Icons.search,
                            size: 25,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 80,
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  child: locationController.isLoading
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : CustomButton(
                          buttontext: locationController.inZone
                              ? widget.fromAddress
                                  ? 'Pick Address'
                                  : 'Pick Location'
                              : 'Service is not available in your area',
                          onPressed: (locationController.buttonDisabled ||
                                  locationController.loading)
                              ? null
                              : () {
                                  if (locationController
                                              .pickPosition.latitude !=
                                          0 &&
                                      locationController.pickPlacemark.name !=
                                          null) {
                                    if (widget.fromAddress) {
                                      if (widget.googleMapController != null) {
                                        print("Now you click on this");
                                        widget.googleMapController!.moveCamera(
                                            CameraUpdate.newCameraPosition(
                                                CameraPosition(
                                                    target: LatLng(
                                                        locationController
                                                            .pickPosition
                                                            .latitude,
                                                        locationController
                                                            .pickPosition
                                                            .longitude))));
                                        locationController.setAddAddressData();
                                      }
                                      //Get.back(); creates update problem
                                      //list, a value
                                      Get.toNamed(RouteHelper.getAddressPage());
                                    }
                                  }
                                },
                        ),
                )
              ],
            ),
          ),
        )),
      );
    });
  }
}
