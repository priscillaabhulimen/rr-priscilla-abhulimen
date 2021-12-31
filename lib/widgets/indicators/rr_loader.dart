import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:rr_priscilla_abhulimen/styles/colors.dart';

class RRSpinner extends StatelessWidget {
  final double size;
  final bool isPrimary;
  const RRSpinner({
    Key key,
    this.size = 40.0,
    this.isPrimary = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SpinKitCircle(
      color: isPrimary ? AppColors.primaryColor : Colors.white,
      size: size,
    );
  }
}
