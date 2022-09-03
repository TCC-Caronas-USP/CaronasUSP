import 'package:caronas_usp/model/ride.dart';
import 'package:caronas_usp/utils/user_preferences.dart';

// final dateTest = DateTime.parse('1969-07-20 20:18:04Z');

class UserOfferedRides {
  static const myOfferedRides = <Ride>[
    Ride(
        driverUsers: UserPreferences.myUser,
        rideDate: '2022-07-20 17:00:00',
        destinyPlace: "CEPEUSP",
        sourcePlace: "Osasco",
        price: 4,
        totalOccupation: 4,
        currentOccupation: 2),
    Ride(
        driverUsers: UserPreferences.myUser,
        rideDate: '2022-07-20 20:30:00',
        destinyPlace: "Osasco",
        sourcePlace: "CEPEUSP",
        price: 4,
        totalOccupation: 4,
        currentOccupation: 0),
    Ride(
        driverUsers: UserPreferences.myUser,
        rideDate: '2022-07-21 08:00:00',
        destinyPlace: "POLI",
        sourcePlace: "Osasco",
        price: 5,
        totalOccupation: 4,
        currentOccupation: 1),
    Ride(
        driverUsers: UserPreferences.myUser,
        rideDate: '2022-07-21 17:00:00',
        destinyPlace: "Osasco",
        sourcePlace: "POLI",
        price: 5,
        totalOccupation: 4,
        currentOccupation: 2),
    Ride(
        driverUsers: UserPreferences.myUser,
        rideDate: '2022-07-22 10:00:00',
        destinyPlace: "POLI",
        sourcePlace: "Osasco",
        price: 6.50,
        totalOccupation: 4,
        currentOccupation: 0),
  ];
}
