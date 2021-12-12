
import 'package:azura_lab/core/styles/color_utils.dart';
import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';




class LoadingOverlayWidget extends StatelessWidget {
  final bool loading;
  final Widget child;

  LoadingOverlayWidget({this.loading, this.child});

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      isLoading: loading,
      color: brown,
      opacity: 0.55,
      progressIndicator: Align(
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
        ),
      ),
      child: child,
    );
  }
}
