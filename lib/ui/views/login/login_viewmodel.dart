import 'package:dorry_v1/app/locator.dart';
import 'package:dorry_v1/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class LoginViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future nagivateToHome() async {
    await _navigationService.navigateTo(Routes.homeView);
  }

  Future nagivateToSignUp() async {
    await _navigationService.navigateTo(Routes.signUpView);
  }
}
