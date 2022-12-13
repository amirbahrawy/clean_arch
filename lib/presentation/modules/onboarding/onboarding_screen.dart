import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import '../../resources/assets_manager.dart';
import '../../resources/colors_manager.dart';
import '../../resources/constants_manager.dart';
import '../../resources/routes_manager.dart';
import '../../resources/strings_manager.dart';
import '../../resources/values_manager.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final List<SliderObject> _list = [
    SliderObject(AppStrings.onBoardingTitle1, AppStrings.onBoardingSubTitle1,
        ImageAssets.onBoardingLogo1),
    SliderObject(AppStrings.onBoardingTitle2, AppStrings.onBoardingSubTitle2,
        ImageAssets.onBoardingLogo2),
    SliderObject(AppStrings.onBoardingTitle3, AppStrings.onBoardingSubTitle3,
        ImageAssets.onBoardingLogo3),
    SliderObject(AppStrings.onBoardingTitle4, AppStrings.onBoardingSubTitle4,
        ImageAssets.onBoardingLogo4),
  ];
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: ColorManager.white,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: ColorManager.white,
        elevation: AppSize.s0,
      ),
      backgroundColor: ColorManager.white,
      body: PageView.builder(
          controller: _pageController,
          itemCount: _list.length,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
            print('da index $index w da $_currentIndex');
          },
          itemBuilder: (context, index) {
            return OnBoardingPage(_list[index]);
          }),
      bottomSheet: Container(
        color: ColorManager.white,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Routes.loginRoute);
                },
                child: Text(
                  AppStrings.skip,
                  textAlign: TextAlign.end,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),
            _getBottomSheetWidget()
          ],
        ),
      ),
    );
  }

  Widget _getBottomSheetWidget() {
    return Container(
      color: ColorManager.primary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
              onTap: () {
                _pageController.animateToPage(_getPreviousIndex(),
                    duration: const Duration(
                      milliseconds: AppConstants.sliderAnimationTime,
                    ),
                    curve: Curves.bounceInOut);
                print(_currentIndex);
              },
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.leftArrowIc)),
              )),
          Row(
            children: [
              for (int i = 0; i < _list.length; i++)
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p12),
                  child: _getProperCircle(i),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(AppPadding.p16),
            child: GestureDetector(
                onTap: () {
                  _pageController.animateToPage(_getNextIndex(),
                      duration: const Duration(
                          milliseconds: AppConstants.sliderAnimationTime),
                      curve: Curves.bounceInOut);
                  print(_currentIndex);
                },
                child: SizedBox(
                    height: AppSize.s20,
                    width: AppSize.s20,
                    child: SvgPicture.asset(ImageAssets.rightArrowIc))),
          ),
        ],
      ),
    );
  }

  Widget _getProperCircle(int index) {
    if (index == _currentIndex) {
      return SvgPicture.asset(ImageAssets.hollowCircleIc);
    } else {
      return SvgPicture.asset(ImageAssets.solidCircleIc);
    }
  }

  int _getPreviousIndex() {
    int previousIndex = _currentIndex-1;
    if (previousIndex == -1) {
      previousIndex = _list.length - 1;
    }
    return previousIndex;
  }

  int _getNextIndex() {
    int nextIndex = _currentIndex+1;
    if (nextIndex == _list.length) {
      nextIndex = 0;
    }
    print('da next $nextIndex');
    return nextIndex;
  }
}

class OnBoardingPage extends StatelessWidget {
  final SliderObject _sliderObject;

  const OnBoardingPage(this._sliderObject, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            _sliderObject.subTitle,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
        ),
        const SizedBox(
          height: AppSize.s60,
        ),
        SvgPicture.asset(_sliderObject.image)
      ],
    );
  }
}

class SliderObject {
  String title;
  String subTitle;
  String image;

  SliderObject(this.title, this.subTitle, this.image);
}
