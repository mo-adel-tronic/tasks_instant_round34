import 'package:r34_22/core/error/messages.dart';
import 'package:r34_22/features/products/domain/entities/product.dart';
import 'package:r34_22/features/products/domain/usecases/create_product.dart';
import 'package:r34_22/features/products/domain/usecases/delete_product.dart';
import 'package:r34_22/features/products/domain/usecases/get_all_product.dart';
import 'package:r34_22/features/products/domain/usecases/get_product.dart';
import 'package:r34_22/features/products/domain/usecases/update_product.dart';

class ProductConsoleServices with MapFailureMessages{
  final GetAllProducts getallproductsusecase;
  final GetProduct getproductsusecase;
  final CreateProduct createproductusecase;
  final UpdateProduct updateproductusecase;
  final DeleteProduct deleteproductusecase;


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
  (failure)=>print("Error${mapFailureToMessage(failure)}"),
  (products){
    if(products.isEmpty){
      print("no product found.");
    }else{
      print('\n ===products===');
      for(final product in products){
        print("ID:${product.id}");
        print("Name:${product.name}");
        print("DESCRIPTION:${product.description}");
        print("Price:${product.price}");
        print("-----");
      }
    }
  }
  );
 }

  void displayproduct(String id){
    final result= getproductsusecase(GetProductParams(id: id));
    result.fold(
    (failure)=>print("Error${mapFailureToMessage(failure)}"),
    (product){
      print("\n===product details===");
      print("Name:${product.name}");
      print("ID:${product.id}");
      print("Description:${product.description}");
      print("Price:${product.price}");

    }
    );
  }

 void createproduct (String name,String description,double price){
  final product=Product(
    name: name,
    id: "",
    description: description,
    price: price
    );
  final result=createproductusecase(createProductparams(product: product));
  result.fold(
   (failure)=>print("Error${mapFailureToMessage(failure)}"),
   (newproduct)=>print("New Product create successfully with id:${newproduct.id}")
   );
 }
  void updateproduct(String id, String name, String description, double price) {
  final product = Product(
     id: id,
     name: name,
     description: description,
     price: price,
  );

  final result = updateproductusecase(UpdateProductparams(product: product, id: ''));
  result.fold(
    (failure) => print('Error: ${mapFailureToMessage(failure)}'),
    (updatedProduct) => print('Product updated successfully'),
  );
  }
  void deleteProduct(String id) {
  final result = deleteproductusecase(DeleteProductparams(id: id));
  result.fold(
    (failure) => print('Error: ${mapFailureToMessage(failure)}'),
    (success) => print('Product deleted successfully'),
  );
}
  } 
