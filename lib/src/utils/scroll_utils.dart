import 'package:flutter/material.dart';

/// Modifies the Scroll Behaviour of [ListView].
///
/// Removes Glowing effect on Overscroll.
/// See Also:
/// * https://stackoverflow.com/a/51119796/7698247
class NoGlowOverScrollBehavior extends ScrollBehavior {
    @override
    Widget buildViewportChrome(
            BuildContext context, Widget child, AxisDirection axisDirection) {
        return child;
    }
}
