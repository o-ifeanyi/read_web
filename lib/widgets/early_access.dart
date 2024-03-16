import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:read_web/util/config.dart';
import 'package:read_web/util/context_utils.dart';

const emailRegex =
    r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";

class EarlyAccess extends StatefulWidget {
  const EarlyAccess({super.key});

  @override
  State<EarlyAccess> createState() => _EarlyAccessState();
}

class _EarlyAccessState extends State<EarlyAccess> {
  final _emailCtrl = TextEditingController();
  String? _device;
  bool _loading = false;

  @override
  void dispose() {
    super.dispose();
    _emailCtrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: _emailCtrl,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(15),
                  hintText: 'your email',
                  hintStyle: context.textTheme.bodyMedium,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: context.colorScheme.primary,
                      width: 1.5,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
            Config.hGap10,
            DropdownButton(
              value: _device,
              hint: Text('device', style: context.textTheme.bodyMedium),
              underline: const SizedBox.shrink(),
              focusColor: Colors.transparent,
              items: ['Android', 'iOS']
                  .map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text(e, style: context.textTheme.bodyMedium),
                    ),
                  )
                  .toList(),
              onChanged: (val) {
                setState(() {
                  _device = val;
                });
              },
            ),
          ],
        ),
        Config.vGap15,
        ValueListenableBuilder(
          valueListenable: _emailCtrl,
          builder: (context, valuue, child) {
            return FilledButton(
              onPressed: _emailCtrl.text.isEmpty || _device == null || _loading
                  ? null
                  : () async {
                      try {
                        setState(() {
                          _loading = true;
                        });
                        if (!RegExp(emailRegex)
                            .hasMatch(_emailCtrl.text.trim())) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: const Text('Please enter a valid email'),
                              backgroundColor:
                                  context.colorScheme.errorContainer,
                            ),
                          );
                          return;
                        }
                        await FirebaseFirestore.instance
                            .collection('waitlist')
                            .doc('early_access')
                            .update(
                          {
                            _device!.toLowerCase():
                                FieldValue.arrayUnion([_emailCtrl.text.trim()]),
                          },
                        ).then((_) {
                          setState(() {
                            _emailCtrl.clear();
                            _device = null;
                          });
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                icon: Icon(
                                  Icons.check_circle_outline_rounded,
                                  size: 40,
                                ),
                                title: Text('Successful'),
                                content: Text(
                                  'You will recieve an email when Read becomes available to test',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          );
                        }).catchError((error, stackTrace) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const AlertDialog(
                                icon: Icon(
                                  Icons.cancel_outlined,
                                  size: 40,
                                ),
                                title: Text('Error'),
                                content: Text(
                                  'An error occured, try again later',
                                  textAlign: TextAlign.center,
                                ),
                              );
                            },
                          );
                        });
                      } catch (error) {
                        debugPrint(error.toString());
                      } finally {
                        setState(() {
                          _loading = false;
                        });
                      }
                    },
              style: ButtonStyle(
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: _loading
                    ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(),
                      )
                    : const Text('Gain early access'),
              ),
            );
          },
        ),
      ],
    );
  }
}
