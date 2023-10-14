// ignore_for_file: null_check_always_fails, prefer_final_fields
import 'package:get/get.dart';
import 'package:restaurant/controllers/cart-controller.dart';
import 'package:restaurant/data/repository/popular_product_repo.dart';
import 'package:restaurant/model/cart-model.dart';
import 'package:restaurant/model/product_model.dart';
import 'package:restaurant/utils/colors.dart';

class PopularProductController extends GetxController {
  final PopularProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cart;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItems => _inCartItems + _quantity;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getPopularProductList();

    if (response.statusCode == 200) {
      //print("Got Products");
      _popularProductList = [];
      _popularProductList.addAll(Product.fromJson(response.body).products);
      //print(_popularProductList);
      _isLoaded = true;
      update();
    } else {}
  }

  void setQuality(bool isInCrement) {
    if (isInCrement) {
      print("number items " + quantity.toString());
      _quantity = checkQuantity(_quantity + 1);
    } else {
      print("number items " + quantity.toString());

      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if ((_inCartItems + quantity) < 0) {
      Get.snackbar("Item Count", "You Can not reduce more !",
          backgroundColor: AppColors.mainColor,
          colorText: AppColors.shadowColorWhite);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return _quantity;
      }
      return 0;
    } else if ((_inCartItems + quantity) > 20) {
      Get.snackbar("Item Count", "You Can not reduce more !",
          backgroundColor: AppColors.mainColor,
          colorText: AppColors.shadowColorWhite);
      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(ProductModel product, CartController cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);
    // print("Exist or not " + exist.toString());
    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }
    // print("quantity is cart  " + _inCartItems.toString());
  }

  void addItem(ProductModel product) {
    //  if (_quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.item.forEach((key, value) {
      print("the id is  " +
          value.id.toString() +
          "the quantity is value  " +
          value.quantity.toString());
    });
    // } else {
    //   Get.snackbar("Item Count", "You Should Add The Item To The Cart !",
    //       backgroundColor: AppColors.mainColor,
    //       colorText: AppColors.shadowColorWhite);
    // }
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
