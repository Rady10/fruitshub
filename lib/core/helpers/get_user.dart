import 'dart:convert';

import 'package:fruitshub/core/services/shared_preferences_singleton.dart';
import 'package:fruitshub/core/utils/constants.dart';
import 'package:fruitshub/features/auth/data/models/user_model.dart';
import 'package:fruitshub/features/auth/domain/entites/user_entity.dart';

UserEntity getUser(){
  var jsonString = Prefs.getString(userData);
  var userEntity = UserModel.fromJson(jsonDecode(jsonString));

  return userEntity;
}