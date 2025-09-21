import 'package:r34_23/core/error/message.dart';
import 'package:r34_23/features/products/domain/entities/product.dart';
import 'package:r34_23/features/products/domain/usecases/create_product.dart';
import 'package:r34_23/features/products/domain/usecases/delete_product.dart';
import 'package:r34_23/features/products/domain/usecases/get_all_products.dart';
import 'package:r34_23/features/products/domain/usecases/get_product.dart';
import 'package:r34_23/features/products/domain/usecases/updata_product.dart';


class ProductConsoleServices with Message{
  final GetAllProducts getallproductsusecase;
  final Getproduct getproductsusecase;
  final Createproduct createproductusecase;
  final Updateproduct updateproductusecase;
  final Deleteproduct deleteproductusecase;
  

 ProductConsoleServices({
  required this.getallproductsusecase,
  required this.getproductsusecase,
  required this.createproductusecase,
  required this.updateproductusecase,
  required this.deleteproductusecase
 });

 void displayallproduct(){
  final result= getallproductsusecase();
  result.fold(
  (failure)=>print("Error${message(failure)}"),
  (products){
    if(products.isEmpty){
      print("no product found.");
    }else{
      print('\n ===products===');
      for(final product in products){
        print("ID:${product.id}");
        print("Name:${product.name}");
        print("DESCRIPTION:${product.descreption}");
        print("Price:${product.price}");
        print("-----");
      }
    }
  }
  );
 }
  
  void displayproduct(String id){
    final result= getproductsusecase(GetProductparams(id));
    result.fold(
    (failure)=>print("Error${message(failure)}"),
    (product){
      print("\n===product details===");
      print("Name:${product.name}");
      print("ID:${product.id}");
      print("Description:${product.descreption}");
      print("Price:${product.price}");

    }
    );
  }

 void createproduct (String name,String description,double price){
  final product=Product(
    name: name,
    id: "",
    descreption: description,
    price: price
    );
  final result=createproductusecase(Createproductparams(product));
  result.fold(
   (failure)=>print("Error${message(failure)}"),
   (newproduct)=>print("New Product create successfully with id:${newproduct.id}")
   );
 }
  void updateproduct(String id, String name, String description, double price) {
  final product = Product(
     id: id,
     name: name,
     descreption: description,
     price: price,
  );

  final result = updateproductusecase(UpdateProductparams(product));
  result.fold(
    (failure) => print('Error: ${message(failure)}'),
    (updatedProduct) => print('Product updated successfully'),
  );
  }
  void deleteProduct(String id) {
  final result = deleteproductusecase(Deleteproductparams(id));
  result.fold(
    (failure) => print('Error: ${message(failure)}'),
    (success) => print(success? 'Product deleted successfully': 'Product not found'),
  );
}
  } 


 
