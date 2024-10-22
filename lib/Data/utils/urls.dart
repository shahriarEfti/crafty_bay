class Urls{

  static String _baseUrl ='https://ecommerce-api.codesilicon.com/api';

  static String dummyUrl ='$_baseUrl';
  static String sliderListUrl ='$_baseUrl/ListProductSlider';
  static String catagoryListUrl ='$_baseUrl/CategoryList';

  static String productListByRemark(String remark) =>'$_baseUrl/ListProductByRemark/$remark';
}