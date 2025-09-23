import 'package:r34_00/features/post/data/repository/post_implemnt_data.dart';
import 'package:r34_00/features/post/data/source/post_data_source.dart';

void main(){
  PostDataSource pds = PostDataSource();
  PostImplemntData pid = PostImplemntData(pds: pds);

  pid.getPost(2, 90).fold(ifLeft: (value) {
    print(value.mapFaiureMessage(value));
  }, ifRight: (value) {
    print(value.body);
  },);
}