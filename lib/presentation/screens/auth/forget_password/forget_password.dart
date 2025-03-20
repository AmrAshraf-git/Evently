import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/resources/app_colors.dart';
import '../../../../core/resources/assets_manager.dart';
import '../../../../core/utils/email_validation.dart';
import '../../../../core/widgets/my_text_form_field.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  late final double width;
  late final double height;
  late final TextEditingController? emailController;
  bool isScreenSizeLoaded=false;
  final GlobalKey<FormState> formKey = GlobalKey();


  @override
  void initState() {
    emailController = TextEditingController();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if(!isScreenSizeLoaded){
      width=MediaQuery.sizeOf(context).width;
      height=MediaQuery.sizeOf(context).height;
      isScreenSizeLoaded=true;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18),
              child: Form(
                key: formKey,
                  child: Column(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SvgPicture.asset(AssetsManager.forgetPassword),
                        const SizedBox(height: 24),
                        Container(
                            margin: EdgeInsets.only(bottom: 16),
                            child: MyTextFormField(
                              validator: (input){
                                if(input==null || input.trim().isEmpty) {
                                  return "Email can't be empty";
                                }
                                else if(!Validation.isValidEmail(input)) {
                                  return "Please enter a valid email";
                                }
                                return null;
                              },
                              textEditingController: emailController,
                              hint: "Email",
                              prefixIcon: Icon(
                                Icons.email_rounded,
                                color: AppColors.gray,
                              ),
                              textInputType: TextInputType.emailAddress,
                            )),
                        SizedBox(
                          width: width,
                          child: ElevatedButton(
                              onPressed: () {
                                forgetPassword();
                              },
                              child: Text("Forget password",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                  ))),
                        ),
                      ])))),
    );
  }

  @override
  void dispose() {
    emailController?.dispose();
    super.dispose();
  }

  void forgetPassword() {
    if (formKey.currentState?.validate() == false) {
      return;
    }
  }
}
