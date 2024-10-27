import 'package:get/get.dart';
import '../../Data/models/network_response.dart';
import '../../Data/services/network_caller.dart';
import '../../Data/utils/urls.dart';
import 'package:logger/logger.dart'; // Import Logger if not already done

class CompleteProfileController extends GetxController {
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  final Logger logger = Get.find<Logger>(); // Initialize logger

  Future<bool> createProfile({
    required String firstName,
    required String lastName,
    required String phone,
    required String city,
    required String address,
  }) async {
    _inProgress = true;
    update();

    // Prepare the body for the request
    final Map<String, dynamic> body = {
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'city': city,
      'address': address,
    };

    final NetworkResponse response = await Get.find<NetworkCaller>().postRequest(
      url: Urls.createProfileUrl, // Make sure you have this URL defined in your Urls class
      body: body,
    );

    if (response.isSucess) {
      _errorMessage = null; // Clear error message on success
      // Handle success response if needed (e.g., navigate to another screen)
      return true;
    } else {
      _handleErrorResponse(response);
      return false;
    }
  }

  void _handleErrorResponse(NetworkResponse response) {
    _errorMessage = response.errorMessage ?? 'Request failed or network error.';
    logger.e(_errorMessage); // Log the error for debugging
  }
}
