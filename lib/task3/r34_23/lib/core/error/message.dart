import 'package:r34_23/core/error/failures.dart';

mixin Message{
  String message(Failure failure){
    return switch(failure){
     Serverfailure()=>'serverfailure',
     Cachefailure()=>'cachefailure',
     Unexcepcted()=>'unexcepcted',
      
      
    };
  }
}