import 'dart:async';

import 'package:caronas_usp/app/repositories/network/rider_requester.dart';
import 'package:caronas_usp/model/rider.dart';

class RiderRepository {
  Future<Rider> getRider() async {
    return RiderRequester.getRider();
  }
}
