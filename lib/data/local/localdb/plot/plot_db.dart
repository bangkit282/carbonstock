import 'package:carbonstock/data/local/model/plot/plot_model.dart';
import 'package:hive/hive.dart';

class PlotDB {
  static Box<PlotModel> plotBox = Hive.box('plots');

  static Future<void> init() async {
    await Hive.openBox<PlotModel>('plots');
  }

  static List<PlotModel> getAllPlots() {
    return plotBox.values.toList();
  }

  // static PlotModel? getSpecificPlot(PlotModel plotModel) {
  //   return plotBox.get(plotModel.plotId);
  // }

  static Future<void> addPlot(PlotModel plotModel) async {
    await plotBox.add(plotModel);
  }

  static Future<void> updatePlot(int index, PlotModel plotModel) async {
    await plotBox.putAt(index, plotModel);
  }

  // static Future<void> deletePlot(PlotModel plotModel) async {
  //   await plotBox.delete(plotModel.plotId);
  // }
}
