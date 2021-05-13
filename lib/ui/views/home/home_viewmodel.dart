import 'package:dorry_v1/app/locator.dart';
import 'package:dorry_v1/app/router.gr.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();

  Future navigateToLaundry() async {
    await _navigationService.navigateTo(Routes.laundryView);
  }
}
