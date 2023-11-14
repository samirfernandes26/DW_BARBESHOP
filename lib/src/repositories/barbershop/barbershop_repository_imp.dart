
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:dw_barbershop/src/core/fp/either.dart';
import 'package:dw_barbershop/src/core/restClient/rest_client.dart';
import 'package:dw_barbershop/src/model/barbershop_model.dart';
import 'package:dw_barbershop/src/model/user_model.dart';
import 'package:dw_barbershop/src/repositories/barbershop/barbershop_repository.dart';
import 'package:dw_barbershop/src/repositories/user/repository_exception.dart';

class BarbershopRepositoryImp implements BarbershopRepository {

  final RestClient restClient;

  BarbershopRepositoryImp({
    required this.restClient,
  });

  @override
  Future<Either<RepositoryException, BarbershopModel>> getMyBarbershop(UserModel userModel) async {
    switch(userModel){
      case UserModelADM():
        final Response(data: List(first:data)) = await restClient.auth.get(
          '/babershop', 
          queryParameters: {
            'user_id':'#userAuthref',
          },
        );

        return Success(BarbershopModel.fromMap(data));

      case UserModelEmployee():
        final Response(:data) = await restClient.auth.get(
          '/babershop/${userModel.barbershopId}', 
        );
        return Success(BarbershopModel.fromMap(data));        
      
    }
  }
  
}