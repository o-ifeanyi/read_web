import 'package:flutter/material.dart';
import 'package:read_web/util/config.dart';
import 'package:read_web/util/constants.dart';
import 'package:read_web/util/context_utils.dart';

class Device extends StatefulWidget {
  const Device({
    super.key,
    required this.wordIndex,
    required this.controller,
  });

  final int wordIndex;
  final PageController controller;

  @override
  State<Device> createState() => _DeviceState();
}

class _DeviceState extends State<Device> {
  @override
  Widget build(BuildContext context) {
    const description = Constants.description;
    const deviceWidth = Constants.deviceWidth;
    const deviceHeight = Constants.deviceHeight;

    final pages = [
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.import_export_rounded,
            size: 40,
            color: context.colorScheme.primaryContainer,
          ),
          Config.vGap15,
          Text(
            'Import file',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.vGap60,
        ],
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.headphones_rounded,
            size: 40,
            color: context.colorScheme.primaryContainer,
          ),
          Config.vGap15,
          Text(
            'Sit back and listen...',
            textAlign: TextAlign.center,
            style: context.textTheme.bodyMedium?.copyWith(
              color: context.colorScheme.onPrimary,
              fontWeight: FontWeight.bold,
            ),
          ),
          Config.vGap60,
        ],
      ),
      Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: RichText(
                text: TextSpan(
                  children: List.generate(
                    description.split(' ').length,
                    (index) {
                      final text = description.split(' ')[index];
                      final style = context.textTheme.bodySmall;
                      return WidgetSpan(
                        child: Container(
                          decoration: BoxDecoration(
                            color: index == widget.wordIndex
                                ? context.colorScheme.primaryContainer
                                : Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          margin: const EdgeInsets.only(right: 5),
                          child: Text(
                            text,
                            style: index == widget.wordIndex
                                ? style?.copyWith(color: Colors.white)
                                : index < widget.wordIndex
                                    ? style?.copyWith(color: Colors.grey[300])
                                    : style?.copyWith(color: Colors.black),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: RichText(
              text: TextSpan(
                style: context.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: context.colorScheme.onPrimary),
                text: 'With',
                children: [
                  TextSpan(
                    text: ' 100+ voices ',
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.primaryContainer),
                  ),
                  const TextSpan(text: 'and adjustable'),
                  TextSpan(
                    text: ' reading speed ',
                    style: context.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: context.colorScheme.secondaryContainer),
                  ),
                  const TextSpan(text: 'to suit your taste'),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: LinearProgressIndicator(
              value: widget.wordIndex / description.split(' ').length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(
                  Icons.record_voice_over,
                  color: context.colorScheme.onPrimary,
                  size: 15,
                ),
                Icon(
                  Icons.fast_rewind_rounded,
                  color: context.colorScheme.onPrimary,
                  size: 25,
                ),
                Icon(
                  Icons.pause_rounded,
                  color: context.colorScheme.onPrimary,
                  size: 35,
                ),
                Icon(
                  Icons.fast_forward_rounded,
                  color: context.colorScheme.onPrimary,
                  size: 25,
                ),
                Icon(
                  Icons.speed_rounded,
                  color: context.colorScheme.onPrimary,
                  size: 15,
                ),
              ],
            ),
          )
        ],
      ),
    ];

    return Container(
      height: deviceWidth * 2.05,
      width: deviceWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(width: 10, color: Colors.black),
      ),
      child: Column(
        children: [
          Container(
            height: deviceHeight * 0.045,
            width: deviceWidth * 0.4,
            decoration: const BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(15),
              ),
            ),
          ),
          Config.vGap15,
          Expanded(
            child: PageView.builder(
              physics: const NeverScrollableScrollPhysics(),
              controller: widget.controller,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return pages[index];
              },
            ),
          ),
        ],
      ),
    );
  }
}
