import 'package:get/get.dart';
import '../../Data/models/cart_model.dart'; // Import your CartModel
import '../../Data/models/network_response.dart';
import '../../Data/services/network_caller.dart';
import '../../Data/utils/urls.dart';

class CartListController extends GetxController {
  var cartItems = <CartModel>[].obs; // Changed to CartModel
  bool _inProgress = false;
  bool get inProgress => _inProgress;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  @override
  void onInit() {
    fetchCartItems(); // Fetch cart items when the controller is initialized
    super.onInit();
  }

  Future<void> fetchCartItems() async {
    _inProgress = true; // Set loading state
    update(); // Notify listeners

    final NetworkResponse response = await Get.find<NetworkCaller>().getRequest(url: Urls.getCartUrl);

    if (response.isSucess) {
      // Clear existing cart items
      cartItems.clear();

      // Map the JSON response to CartModel objects
      cartItems.value = (response.responseData['data'] as List)
          .map((item) => CartModel.fromJson(item)) // Corrected to use CartModel's fromJson
          .toList();
      _errorMessage = null; // Clear error message on success
    } else {
      _errorMessage = response.errorMessage ?? 'Request failed or network error.'; // Set error message
    }

    _inProgress = false; // Reset loading state
    update(); // Notify listeners
  }
}
