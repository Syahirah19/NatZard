import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/already_have_an_account_acheck.dart';
import '../../../contants.dart';
import '../../../controller/login_singup_controller.dart';
import '../../../model/user_model.dart';
import '../../Login/Login_screen.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginSignUpController(context: context));
    final formKey = GlobalKey<FormState>();

    return Form(
      key: formKey,
      child: Column(
        children: [
          TextFormField(
              controller: controller.fullName,
              keyboardType: TextInputType.name,
              textInputAction: TextInputAction.next,
              cursorColor: kPrimaryColor,
              decoration: const InputDecoration(
                hintText: "Full Name",
                prefixIcon: Padding(
                  padding: EdgeInsets.only(right: defaultPadding),
                  child: Icon(Icons.person),
                ),
              ),
              onChanged: (value) {
                controller.fullName.value = TextEditingValue(
                    text: value.toUpperCase(),
                    selection: controller.fullName.selection);
              }),
          TextFormField(
            controller: controller.emailSignup,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Email",
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Icon(Icons.email),
              ),
            ),
          ),
          TextFormField(
            controller: controller.phoneNum,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Phone Number",
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Icon(Icons.phone),
              ),
            ),
          ),
          TextFormField(
            controller: controller.passwordSignup,
            textInputAction: TextInputAction.done,
            obscureText: true,
            cursorColor: kPrimaryColor,
            decoration: const InputDecoration(
              hintText: "Password",
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: defaultPadding),
                child: Icon(Icons.lock),
              ),
            ),
          ),
          const SizedBox(height: defaultPadding / 2),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                final user = UserModel(
                  email: controller.emailSignup.text.trim(),
                  fullName: controller.fullName.text.trim(),
                  phoneNo: controller.phoneNum.text.trim(),
                  password: controller.passwordSignup.text.trim(),
                  // userLevel: "2",
                );

                LoginSignUpController.instance.createUser(user);
              }
            },
            child: Text("Sign Up".toUpperCase()),
          ),
          const SizedBox(height: defaultPadding),
          AlreadyHaveAnAccountCheck(
            login: false,
            press: () {
              Get.delete<LoginSignUpController>();
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
