import 'package:easytrip/bloc/register/register_bloc.dart';
import 'package:easytrip/constants/color/app_color.dart';
import 'package:easytrip/constants/theme/textTheme.dart';
import 'package:easytrip/utils/locator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage>
    with TickerProviderStateMixin {
  late RegisterBloc registerBloc;
  late AnimationController controller;
  @override
  void initState() {
    registerBloc = locator<RegisterBloc>();
    controller = AnimationController(
      vsync: this,
      upperBound: 1,
      animationBehavior: AnimationBehavior.normal,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            registerBloc.add(PreviousStep(context));
          },
        ),
      ),
      body: BlocBuilder<RegisterBloc, RegisterState>(
        bloc: registerBloc,
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: bodyRegister(state),
              ),
              LinearProgressIndicator(
                value: registerBloc.progress / registerBloc.steps,
                semanticsLabel: 'Linear progress indicator',
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  onPressed: () {
                    registerBloc.add(NextStep());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    foregroundColor: Colors.black,
                    backgroundColor: AppColor.yellow,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: const Text('Submit'),
                ),
              )
            ],
          );
        },
      ),
    );
  }

  Widget bodyRegister(RegisterState state) {
    if (state is RegisterInitial) {
      return stepOne();
    } else if (state is RegisterStepOne) {
      return stepOne();
    } else if (state is RegisterStepTwo) {
      return stepTwo(state);
    } else if (state is RegisterStepThree) {
      return stepThree();
    } else if (state is RegisterStepFour) {
      return stepFour();
    }
    return const SizedBox();
  }

  Widget stepOne() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Your Account', style: myTheme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            "What's your name?",
            style: myTheme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 56),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: TextStyle(color: AppColor.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.yellow,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Last Name',
              labelStyle: TextStyle(color: AppColor.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.yellow,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget stepTwo(RegisterStepTwo state) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Your Account', style: myTheme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            "And, your email?",
            style: myTheme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 56),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: AppColor.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.yellow,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Flexible(
                child: Text(
                    "I'd like to receive marketing and policy communication from Easytrip and its partners.",
                    style: myTheme.textTheme.labelMedium),
              ),
              CupertinoSwitch(value: state.receiveEmail , onChanged: (value){
                registerBloc.add(ReceiveEmail(value));

              })
            ],
          )
        ],
      ),
    );
  }

  Widget stepThree() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Your Account', style: myTheme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            "Create a password",
            style: myTheme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 56),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: TextStyle(color: AppColor.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.yellow,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }

  Widget stepFour() {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Create Your Account', style: myTheme.textTheme.titleMedium),
          const SizedBox(height: 8),
          Text(
            "OTP Verification",
            style: myTheme.textTheme.headlineSmall,
          ),
          const SizedBox(height: 56),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'First Name',
              labelStyle: TextStyle(color: AppColor.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.yellow,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
          const SizedBox(height: 24),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Last Name',
              labelStyle: TextStyle(color: AppColor.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: AppColor.grey)),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: AppColor.yellow,
                ),
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            ),
          ),
        ],
      ),
    );
  }
}
