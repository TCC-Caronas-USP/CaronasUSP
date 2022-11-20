import 'package:caronas_usp/app/core/constants.dart';
import 'package:flutter/material.dart';

Icon getStatusIcon(RidePassengerStatus status) {
  switch (status) {
    case RidePassengerStatus.approved:
      return const Icon(
        Icons.check,
        size: 30,
      );
    case RidePassengerStatus.waiting:
      return const Icon(
        Icons.access_time_filled,
        size: 30,
      );
    case RidePassengerStatus.rejected:
      return const Icon(
        Icons.close,
        size: 30,
      );
    default:
      return const Icon(
        Icons.question_mark,
        size: 30,
      );
  }
}