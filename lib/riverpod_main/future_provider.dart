import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_managment/services/api_services.dart';

final future = FutureProvider((ref) => ApiServices.getPosts());

final future2 = FutureProvider((ref) => UserApiservices.getUsers());
