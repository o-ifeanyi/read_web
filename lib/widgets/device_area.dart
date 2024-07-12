import 'dart:async';

import 'package:flutter/material.dart';
import 'package:read_web/util/constants.dart';
import 'package:read_web/util/context_utils.dart';
import 'package:read_web/widgets/device.dart';

class DeviceArea extends StatefulWidget {
  const DeviceArea({super.key});

  @override
  State<DeviceArea> createState() => _DeviceAreaState();
}

class _DeviceAreaState extends State<DeviceArea> {
  late PageController _controller;
  bool _animateDoc = false;
  bool _animateImg = false;
  bool _animateText = false;
  bool _animateUrl = false;

  late Timer _timer;
  int _wordIndex = 0;

  void _startAnimation() {
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      setState(() {
        _animateDoc = true;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _animateImg = true;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _animateText = true;
      });
      await Future.delayed(const Duration(milliseconds: 100));
      setState(() {
        _animateUrl = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      _controller.nextPage(
          curve: Curves.ease, duration: const Duration(milliseconds: 300));
      await Future.delayed(const Duration(seconds: 2));
      _controller.nextPage(
          curve: Curves.ease, duration: const Duration(milliseconds: 300));
      _timer = Timer.periodic(const Duration(milliseconds: 150), (_) {
        if (_wordIndex < Constants.description.split(' ').length) {
          setState(() {
            _wordIndex += 1;
          });
        } else {
          _timer.cancel();
          setState(() {
            _wordIndex = 0;
            _animateDoc = false;
            _animateImg = false;
            _animateText = false;
            _animateUrl = false;
            _controller.jumpTo(0);
          });
          _startAnimation();
        }
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _controller = PageController();
    _startAnimation();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const deviceHeight = Constants.deviceHeight;

    return LayoutBuilder(
      builder: (context, c) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Device(wordIndex: _wordIndex, controller: _controller),
            AnimatedItem(
              animating: _animateDoc,
              icon: Icons.file_present_sharp,
              iconColor: context.colorScheme.primary,
              text: 'document',
              top: _animateDoc ? deviceHeight / 2.5 : 0,
              right: _animateDoc ? c.maxWidth / 2.5 : 0,
            ),
            AnimatedItem(
              animating: _animateImg,
              icon: Icons.image,
              iconColor: context.colorScheme.secondaryContainer,
              text: 'image',
              top: _animateImg ? deviceHeight / 2.5 : deviceHeight / 4.0,
              left: _animateImg ? c.maxWidth / 2.5 : 0,
            ),
            AnimatedItem(
              animating: _animateText,
              icon: Icons.text_fields_rounded,
              iconColor: context.colorScheme.inversePrimary,
              text: 'text',
              top: _animateText ? deviceHeight / 2.5 : deviceHeight / 2.0,
              right: _animateText ? c.maxWidth / 2.5 : 0,
            ),
            AnimatedItem(
              animating: _animateUrl,
              icon: Icons.link_rounded,
              iconColor: context.colorScheme.primaryContainer,
              text: 'website',
              bottom: _animateUrl ? deviceHeight / 2.5 : 0,
              left: _animateUrl ? c.maxWidth / 2.5 : 0,
            ),
          ],
        );
      },
    );
  }
}

class AnimatedItem extends StatelessWidget {
  const AnimatedItem({
    super.key,
    required this.animating,
    required this.icon,
    required this.iconColor,
    required this.text,
    this.top,
    this.bottom,
    this.left,
    this.right,
  });

  final bool animating;
  final IconData icon;
  final Color iconColor;
  final String text;
  final double? top;
  final double? bottom;
  final double? right;
  final double? left;

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: const Duration(milliseconds: 300),
      top: top,
      bottom: bottom,
      right: right,
      left: left,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: animating ? 0 : 1,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: context.colorScheme.surface,
          ),
          child: Column(
            children: [
              Icon(
                icon,
                color: iconColor,
                size: 40,
              ),
              Text(text)
            ],
          ),
        ),
      ),
    );
  }
}
