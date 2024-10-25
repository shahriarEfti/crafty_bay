class Urls{

  static String _baseUrl ='https://ecommerce-api.codesilicon.com/api';

  static String dummyUrl ='$_baseUrl';
  static String sliderListUrl ='$_baseUrl/ListProductSlider';
  static String catagoryListUrl ='$_baseUrl/CategoryList';
  static String readProfileUrl ='$_baseUrl/ReadProfile';

  static String productListByRemark(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
  static String productListByCatagory(int catagoryId) =>'$_baseUrl/ListProductByCategory/$catagoryId';
  static String productdetailsById(int productId) =>'$_baseUrl/ProductDetailsById/$productId';
  static String verifyemail(String  email) =>'$_baseUrl/UserLogin/$email';
  static String verifyotp(String  email,String otp) =>'$_baseUrl/VerifyLogin/$email/$otp';

}