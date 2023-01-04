import 'package:clean_architecture/presentation/modules/login/viewmodel/login_viewmodel.dart';
import 'package:clean_architecture/presentation/resources/strings_manager.dart';
import 'package:clean_architecture/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';
import '../../../resources/routes_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final LoginViewModel _viewModel ;//= LoginViewModel();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  void _bind() {
    _viewModel.start();
    _userNameController
        .addListener(() => _viewModel.setUserName(_userNameController.text));
    _passwordController
        .addListener(() => _viewModel.setPassword(_passwordController.text));
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _getContentWidget();
  }

  Widget _getContentWidget() {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: AppPadding.p100),
        child: SingleChildScrollView(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const Image(image: AssetImage(ImageAssets.splashLogo)),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p25, right: AppPadding.p25),
                    child: StreamBuilder<bool>(
                        stream: _viewModel.outIsUserNameValid,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.text,
                            controller: _userNameController,
                            decoration: InputDecoration(
                                hintText: AppStrings.username,
                                labelText: AppStrings.username,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.usernameError),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p25, right: AppPadding.p25),
                    child: StreamBuilder<bool>(
                        stream: _viewModel.outIsPasswordValid,
                        builder: (context, snapshot) {
                          return TextFormField(
                            keyboardType: TextInputType.visiblePassword,
                            controller: _passwordController,
                            decoration: InputDecoration(
                                hintText: AppStrings.password,
                                labelText: AppStrings.password,
                                errorText: (snapshot.data ?? true)
                                    ? null
                                    : AppStrings.passwordError),
                          );
                        }),
                  ),
                  const SizedBox(
                    height: AppSize.s25,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p25, right: AppPadding.p25),
                    child: SizedBox(
                      width: double.infinity,
                      height: AppSize.s45,
                      child: StreamBuilder<bool>(
                          stream: _viewModel.outAreAllInputValid,
                          builder: (context, snapshot) {
                            return ElevatedButton(
                                onPressed: (snapshot.data ?? false)
                                    ? () {
                                        _viewModel.login();
                                      }
                                    : null,
                                child: const Text(AppStrings.login));
                          }),
                    ),
                  ),
                  const SizedBox(
                    height: AppSize.s10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: AppPadding.p25, right: AppPadding.p25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.forgotPasswordRoute);
                            },
                            child: Text(
                              AppStrings.forgetPassword,
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacementNamed(
                                  context, Routes.registerRoute);
                            },
                            child: Text(
                              AppStrings.registerText,
                              style: Theme.of(context).textTheme.titleMedium,
                            )),
                      ],
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
