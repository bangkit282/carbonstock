import 'package:carbonstock/data/local/model/auth/user_model.dart';
import 'package:hive/hive.dart';

class AuthDB {
  static Box<UserModel> authBox = Hive.box('auth');
  static Box<ListPlotModel> listPlotBox = Hive.box('listPlot');

  static Future<void> init() async {
    await Hive.openBox<UserModel>('auth');
    await Hive.openBox<ListPlotModel>('listPlot');
  }

  static List<ListPlotModel> getAllListPlot() {
    return listPlotBox.values.toList();
  }

  static List<UserModel> getAllUsers() {
    return authBox.values.toList();
  }

  static UserModel getSpecificUser(String userid) =>
      authBox.values.toList().firstWhere((element) => userid == element.id);

  static Future<void> addUser(UserModel userModel) async {
    await authBox.add(userModel);
  }
}
