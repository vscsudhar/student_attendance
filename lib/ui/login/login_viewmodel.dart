import 'dart:developer';

import 'package:maps_toolkit/maps_toolkit.dart';
import 'package:stacked/stacked.dart';
import 'package:workspace/core/mixins/navigation_mixin.dart';

class LoginViewModel extends BaseViewModel with NavigationMixin {
  final p1 = LatLng(76.9660987, 10.90941317);
  final p2 = LatLng(76.9666191, 10.9087705);
  final p3 = LatLng(76.9672521, 10.9097976);
  final p4 = LatLng(76.9667478, 10.9103823);
  final p5 = LatLng(76.9660987, 10.9094131);
  final p6 = LatLng(76.9660987, 10.90941317);

  List<LatLng> get polygon => [p1, p2, p3, p4, p5, p6];

  bool get atLocation {
    bool isClosedPoly;
    // isClosedPoly = PolygonUtil.isClosedPolygon(polygon);
    isClosedPoly = PolygonUtil.isLocationOnEdge(LatLng(76.9660987, 10.9094131), polygon, true);
    log(isClosedPoly.toString());
    bool _atLocation;
    _atLocation = PolygonUtil.containsLocation(LatLng(76.9660987, 10.9094131), polygon, false);
    return _atLocation;
  }
}
