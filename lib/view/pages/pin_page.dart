import 'package:bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bank_sha/shared/shared_methods.dart';
import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/view/widgets/buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PinPage extends StatefulWidget {
  const PinPage({super.key});

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController(text: '');
  String pin = '';

  bool isError = false;

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }

    if (pinController.text.length == 6) {
      if (pinController.text == pin) {
        Navigator.pop(context, true);
      } else {
        setState(() {
          isError = true;
        });
        showCustomSnackbar(context, 'PIN yang Anda masukkan salah');
      }
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        isError = false;
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthSuccess) {
      pin = authState.user.pin!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkBackgroundColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 58),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Sha Pin',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
              const SizedBox(
                height: 72,
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: pinController,
                  obscureText: true,
                  cursorColor: greyColor,
                  obscuringCharacter: '*',
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                      fontSize: 36,
                      fontWeight: medium,
                      letterSpacing: 16,
                      color: isError ? redColor : whiteColor),
                  decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: greyColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 66,
              ),
              Wrap(
                spacing: 40,
                runSpacing: 40,
                children: [
                  CustomePinButton(
                    title: '1',
                    onTap: () {
                      addPin('1');
                    },
                  ),
                  CustomePinButton(
                    title: '2',
                    onTap: () {
                      addPin('2');
                    },
                  ),
                  CustomePinButton(
                    title: '3',
                    onTap: () {
                      addPin('3');
                    },
                  ),
                  CustomePinButton(
                    title: '4',
                    onTap: () {
                      addPin('4');
                    },
                  ),
                  CustomePinButton(
                    title: '5',
                    onTap: () {
                      addPin('5');
                    },
                  ),
                  CustomePinButton(
                    title: '6',
                    onTap: () {
                      addPin('6');
                    },
                  ),
                  CustomePinButton(
                    title: '7',
                    onTap: () {
                      addPin('7');
                    },
                  ),
                  CustomePinButton(
                    title: '8',
                    onTap: () {
                      addPin('8');
                    },
                  ),
                  CustomePinButton(
                    title: '9',
                    onTap: () {
                      addPin('9');
                    },
                  ),
                  const SizedBox(
                    width: 60,
                    height: 60,
                  ),
                  CustomePinButton(
                    title: '0',
                    onTap: () {
                      addPin('0');
                    },
                  ),
                  GestureDetector(
                    onTap: () {
                      deletePin();
                    },
                    child: Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: numberBackgroundColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back,
                          color: whiteColor,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
