import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher_string.dart';

/// {@template hosted_add}
/// A model class for self hosted ad
/// {@endtemplate}
class HostedAdd {
  /// {@macro hosted_add}
  const HostedAdd({
    required this.targetUrl,
    required this.imageUrls,
    this.stepDuration = const Duration(seconds: 30),
    this.loopCount = 0,
  });

  /// The URL to which the ad banner should redirect when clicked.
  final String targetUrl;

  /// A list of image URLs to be displayed in the ad banner.
  final List<String> imageUrls;

  /// The duration for which each image is displayed before transitioning to
  /// the next one.
  final Duration stepDuration;

  /// The number of times the ad banner should loop through the images.
  final int loopCount;
}

/// {@template hosted_ad_banner}
/// A Flutter package that implements ad banner widget for self hosted ads
/// {@endtemplate}
class HostedAdBanner extends StatefulWidget {
  /// {@macro hosted_ad_banner}
  const HostedAdBanner({
    required this.hostedAdds,
    required this.width,
    required this.height,
    super.key,
  });

  /// List of self hosted ads
  final List<HostedAdd> hostedAdds;

  /// Width of the ad banner
  final double width;

  /// Height of the ad banner
  final double height;

  @override
  State<HostedAdBanner> createState() => _HostedAdBannerState();
}

class _HostedAdBannerState extends State<HostedAdBanner> {
  int _currentAdIndex = 0;
  int _currentImageIndex = 0;
  int _currentLoop = 0;

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAdRotation();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startAdRotation() {
    _timer = Timer(widget.hostedAdds[_currentAdIndex].stepDuration, () {
      if (!mounted) return;

      setState(() {
        _currentImageIndex++;
        if (_currentImageIndex >=
            widget.hostedAdds[_currentAdIndex].imageUrls.length) {
          _currentImageIndex = 0;
          _currentLoop++;
          if (_currentLoop >= widget.hostedAdds[_currentAdIndex].loopCount) {
            _currentLoop = 0;
            _currentAdIndex = (_currentAdIndex + 1) % widget.hostedAdds.length;
          }
        }
      });

      _startAdRotation();
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height,
      child: GestureDetector(
        onTap: () {
          final url = widget.hostedAdds[_currentAdIndex].targetUrl;
          unawaited(launchUrlString(url));
          // Handle URL redirection logic here
        },
        child: CachedNetworkImage(
          imageUrl:
              widget.hostedAdds[_currentAdIndex].imageUrls[_currentImageIndex],
          fit: BoxFit.cover,
        ).fadeIn(),
      ),
    );
  }
}
