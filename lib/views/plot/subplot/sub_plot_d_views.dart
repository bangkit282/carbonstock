// part of '../../views.dart';

// class SubPlotDListPageViews extends StatefulWidget {
//   const SubPlotDListPageViews({
//     super.key,
//     required this.areaName,
//     required this.plotData,
//   });

//   final String areaName;
//   final Datum plotData;

//   @override
//   State<SubPlotDListPageViews> createState() => _SubPlotDListPageViewsState();
// }

// class _SubPlotDListPageViewsState extends State<SubPlotDListPageViews>
//     with SingleTickerProviderStateMixin {
//   final SubPlotController _controller = Get.find();

//   RxInt indexPohon = 0.obs;
//   RxInt indexNekromas = 0.obs;
//   RxInt indexTanah = 0.obs;
//   RxString currentPage = ''.obs;

//   late TabController tabController;

//   @override
//   void initState() {
//     tabController = TabController(length: 3, vsync: this);

//     tabController.addListener(() {
//       setState(() {});
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: false,
//         automaticallyImplyLeading: false,
//         backgroundColor: colorSecondaryGreen,
//         title: Text(
//           'Sub Plot C - Tiang',
//           style: TextStyle(
//             fontSize: 20.sp,
//             color: colorPrimaryWhite,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(
//             CupertinoIcons.back,
//             color: Colors.white,
//           ),
//         ),
//         bottom: TabBar(
//           controller: tabController,
//           unselectedLabelColor: colorPrimaryBlack,
//           indicatorColor: colorPrimaryBlack,
//           labelColor: colorPrimaryBlack,
//           labelStyle: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w700,
//           ),
//           unselectedLabelStyle: TextStyle(
//             fontSize: 14.sp,
//             fontWeight: FontWeight.w500,
//           ),
//           tabs: const [
//             Tab(text: 'Pohon'),
//             Tab(text: 'Nekromas'),
//             Tab(text: 'Tanah'),
//           ],
//         ),
//       ),
//       body: TabBarView(
//         controller: tabController,
//         children: [
//           Padding(
//             padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
//             child: fetchPohonList(),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
//             child: fetchNekromasList(),
//           ),
//           Padding(
//             padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 24.h),
//             child: fetchTanahList(),
//           ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
//                 type: 0,
//                 indexD: indexPohon.value,
//                 indexPohon: indexPohon.value,
//                 indexNekromas: indexNekromas.value,
//                 indexTanah: indexTanah.value,
//                 plotId: widget.plotData.id.toString(),
//                 plotName: widget.plotData.namaPlot,
//                 areaName: widget.areaName,
//                 subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
//                 subPlotDPohonList: SubPlotAreaDB.getAllSubPlotPohon(),
//                 subPlotDNekromasList: SubPlotAreaDB.getAllSubPlotNekromas(),
//                 subPlotDTanahList: SubPlotAreaDB.getAllSubPlotTanah(),
//               ),
//               transitionsBuilder: (_, animation, __, child) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 );
//               },
//             ),
//           );
//         },
//         elevation: 0,
//         shape: const CircleBorder(),
//         backgroundColor: colorButtonAccentGreen,
//         child: const Icon(
//           CupertinoIcons.add,
//           color: colorPrimaryWhite,
//           size: 36,
//         ),
//       ),
//     );
//   }

//   ValueListenableBuilder fetchPohonList() {
//     currentPage.value = 'Pohon';

//     return ValueListenableBuilder<Box<SubPlotAreaDPohonModel>>(
//       valueListenable: _controller.contactDPohonBox.listenable(),
//       builder: (context, box, _) {
//         RxList<SubPlotAreaDModel> listD = _controller.contactDBox.values
//             .where((element) => element.plotId == widget.plotData.id.toString())
//             .toList()
//             .obs;

//         RxList<SubPlotAreaDPohonModel> list = _controller
//             .contactDPohonBox.values
//             .where((element) => element.plotId == widget.plotData.id.toString())
//             .toList()
//             .obs;

//         if (list.isNotEmpty) {
//           indexPohon.value = list.indexWhere(
//             (e) => e.plotId == widget.plotData.id.toString(),
//           );

//           return SizedBox(
//             width: 1.sw,
//             height: 1.sh,
//             child: ListView.builder(
//               itemCount: list.length,
//               itemBuilder: (context, index) {
//                 if (_controller.contactDPohonBox.values.toList().indexWhere(
//                         (e) => e.plotId == widget.plotData.id.toString()) !=
//                     -1) {
//                   if ('${listD[index].subPlotDModels![0].uuid}' ==
//                       '${list[index].uuid}') {
//                     return buildPohonWidget(
//                       listD.toList().lastWhere((e) =>
//                           '${e.subPlotDModels![0].uuid}' ==
//                           '${list[index].uuid}'),
//                       list[index],
//                       index,
//                     );
//                   } else {
//                     return Container();
//                   }
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           );
//         } else {
//           return Center(
//             child: SizedBox(
//               width: 1.sw,
//               height: 600.h,
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/placeholder_isempty.png'),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Data Masih Kosong',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: colorPrimaryBlack,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   Text(
//                     'Data sub-plot Pohon belum ada',
//                     style: TextStyle(
//                       color: colorSecondaryGrey3,
//                       fontSize: 12.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }

//   ValueListenableBuilder fetchNekromasList() {
//     currentPage.value = 'Nekromas';

//     return ValueListenableBuilder<Box<SubPlotAreaDNekromasModel>>(
//       valueListenable: _controller.contactDNekromasBox.listenable(),
//       builder: (context, box, _) {
//         RxList<SubPlotAreaDModel> listD = _controller.contactDBox.values
//             .where((element) => element.plotId == widget.plotData.id.toString())
//             .toList()
//             .obs;

//         RxList<SubPlotAreaDNekromasModel> list = _controller
//             .contactDNekromasBox.values
//             .where((element) => element.plotId == widget.plotData.id.toString())
//             .toList()
//             .obs;

//         // d.log(
//         //   '${_controller.contactDPohonBox.values.toString()}',
//         //   name: 'length',
//         // );

//         if (list.isNotEmpty) {
//           indexNekromas.value = list.indexWhere(
//             (e) => e.plotId == widget.plotData.id.toString(),
//           );

//           return SizedBox(
//             width: 1.sw,
//             height: 1.sh,
//             child: ListView.builder(
//               itemCount: list.length,
//               itemBuilder: (context, index) {
//                 if (box.values.toList().indexWhere(
//                         (e) => e.plotId == widget.plotData.id.toString()) !=
//                     -1) {
//                   if ('${listD[index].subPlotDModels![0].uuid}' ==
//                       '${list[index].uuid}') {
//                     return buildNekromasWidget(
//                       listD.toList().lastWhere((e) =>
//                           '${e.subPlotDModels![0].uuid}' ==
//                           '${list[index].uuid}'),
//                       list[index],
//                       index,
//                     );
//                   } else {
//                     return Container();
//                   }
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           );
//         } else {
//           return Center(
//             child: SizedBox(
//               width: 1.sw,
//               height: 600.h,
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/placeholder_isempty.png'),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Data Masih Kosong',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: colorPrimaryBlack,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   Text(
//                     'Data sub-plot Nekromas belum ada',
//                     style: TextStyle(
//                       color: colorSecondaryGrey3,
//                       fontSize: 12.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }

//   ValueListenableBuilder fetchTanahList() {
//     currentPage.value = 'Tanah';

//     return ValueListenableBuilder<Box<SubPlotAreaDTanahModel>>(
//       valueListenable: _controller.contactDTanahBox.listenable(),
//       builder: (context, box, _) {
//         RxList<SubPlotAreaDModel> listD = _controller.contactDBox.values
//             .where((element) => element.plotId == widget.plotData.id.toString())
//             .toList()
//             .obs;

//         RxList<SubPlotAreaDTanahModel> list = _controller
//             .contactDTanahBox.values
//             .where((element) => element.plotId == widget.plotData.id.toString())
//             .toList()
//             .obs;

//         // d.log(
//         //   '${_controller.contactDPohonBox.values.toString()}',
//         //   name: 'length',
//         // );

//         if (list.isNotEmpty) {
//           indexTanah.value = list.indexWhere(
//             (e) => e.plotId == widget.plotData.id.toString(),
//           );

//           return SizedBox(
//             width: 1.sw,
//             height: 1.sh,
//             child: ListView.builder(
//               itemCount: list.length,
//               itemBuilder: (context, index) {
//                 if (box.values.toList().indexWhere(
//                         (e) => e.plotId == widget.plotData.id.toString()) !=
//                     -1) {
//                   if ('${listD[index].subPlotDModels![2].uuid}' ==
//                       '${list[index].uuid}') {
//                     return buildTanahWidget(
//                       listD.toList().lastWhere((e) =>
//                           '${e.subPlotDModels![2].uuid}' ==
//                           '${list[index].uuid}'),
//                       list[index],
//                       index,
//                     );
//                   } else {
//                     return Container();
//                   }
//                 } else {
//                   return Container();
//                 }
//               },
//             ),
//           );
//         } else {
//           return Center(
//             child: SizedBox(
//               width: 1.sw,
//               height: 600.h,
//               child: Column(
//                 children: [
//                   Image.asset('assets/images/placeholder_isempty.png'),
//                   const SizedBox(height: 8),
//                   Text(
//                     'Data Masih Kosong',
//                     style: TextStyle(
//                       fontWeight: FontWeight.w700,
//                       color: colorPrimaryBlack,
//                       fontSize: 16.sp,
//                     ),
//                   ),
//                   SizedBox(height: 8.h),
//                   Text(
//                     'Data sub-plot Tanah belum ada',
//                     style: TextStyle(
//                       color: colorSecondaryGrey3,
//                       fontSize: 12.sp,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }

//   Card buildPohonWidget(
//     SubPlotAreaDModel dataModel,
//     SubPlotAreaDPohonModel dataModelPohon,
//     int index,
//   ) {
//     // d.log(dataModelPohon.toString(), name: 'test');

//     return Card(
//       elevation: 0.5,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
//                 type: 1,
//                 indexD: indexPohon.value,
//                 indexPohon: indexPohon.value,
//                 indexNekromas: indexNekromas.value,
//                 indexTanah: indexTanah.value,
//                 plotId: widget.plotData.id.toString(),
//                 plotName: widget.plotData.namaPlot,
//                 areaName: widget.areaName,
//                 subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
//                 subPlotDPohonList: SubPlotAreaDB.getAllSubPlotPohon(),
//                 subPlotDNekromasList: SubPlotAreaDB.getAllSubPlotNekromas(),
//                 subPlotDTanahList: SubPlotAreaDB.getAllSubPlotTanah(),
//               ),
//               transitionsBuilder: (_, animation, __, child) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 );
//               },
//             ),
//           );
//         },
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 16.w),
//           child: Row(
//             children: [
//               Container(
//                 width: 70.w,
//                 height: 70.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/scatter_plot.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16.w),
//               SizedBox(
//                 width: 1.sw - 200.w,
//                 child: Text(
//                   'Pohon ${indexPohon.value + 1}',
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     color: colorPrimaryBlack,
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Icon(
//                 CupertinoIcons.arrow_right,
//                 color: colorPrimaryBlack,
//                 size: 24.sp,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Card buildNekromasWidget(
//     SubPlotAreaDModel dataModel,
//     SubPlotAreaDNekromasModel dataModelNekromas,
//     int index,
//   ) {
//     // d.log(dataModelNekromas.toString(), name: 'test');

//     return Card(
//       elevation: 0.5,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
//                 type: 1,
//                 indexD: indexPohon.value,
//                 indexPohon: indexPohon.value,
//                 indexNekromas: indexNekromas.value,
//                 indexTanah: indexTanah.value,
//                 plotId: widget.plotData.id.toString(),
//                 plotName: widget.plotData.namaPlot,
//                 areaName: widget.areaName,
//                 subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
//                 subPlotDPohonList: SubPlotAreaDB.getAllSubPlotPohon(),
//                 subPlotDNekromasList: SubPlotAreaDB.getAllSubPlotNekromas(),
//                 subPlotDTanahList: SubPlotAreaDB.getAllSubPlotTanah(),
//               ),
//               transitionsBuilder: (_, animation, __, child) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 );
//               },
//             ),
//           );
//         },
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 16.w),
//           child: Row(
//             children: [
//               Container(
//                 width: 70.w,
//                 height: 70.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/scatter_plot.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16.w),
//               SizedBox(
//                 width: 1.sw - 200.w,
//                 child: Text(
//                   'Nekromas ${indexPohon.value + 1}',
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     color: colorPrimaryBlack,
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Icon(
//                 CupertinoIcons.arrow_right,
//                 color: colorPrimaryBlack,
//                 size: 24.sp,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Card buildTanahWidget(
//     SubPlotAreaDModel dataModel,
//     SubPlotAreaDTanahModel dataModelTanah,
//     int index,
//   ) {
//     // d.log(dataModelTanah.toString(), name: 'test');

//     return Card(
//       elevation: 0.5,
//       child: InkWell(
//         onTap: () {
//           Navigator.push(
//             context,
//             PageRouteBuilder(
//               pageBuilder: (_, __, ___) => DetailSubPlotDPageScreen(
//                 type: 1,
//                 indexD: indexPohon.value,
//                 indexPohon: indexPohon.value,
//                 indexNekromas: indexNekromas.value,
//                 indexTanah: indexTanah.value,
//                 plotId: widget.plotData.id.toString(),
//                 plotName: widget.plotData.namaPlot,
//                 areaName: widget.areaName,
//                 subPlotDList: SubPlotAreaDB.getAllSubPlotD(),
//                 subPlotDPohonList: SubPlotAreaDB.getAllSubPlotPohon(),
//                 subPlotDNekromasList: SubPlotAreaDB.getAllSubPlotNekromas(),
//                 subPlotDTanahList: SubPlotAreaDB.getAllSubPlotTanah(),
//               ),
//               transitionsBuilder: (_, animation, __, child) {
//                 return FadeTransition(
//                   opacity: animation,
//                   child: child,
//                 );
//               },
//             ),
//           );
//         },
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: 16.w),
//           child: Row(
//             children: [
//               Container(
//                 width: 70.w,
//                 height: 70.h,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.r),
//                   image: const DecorationImage(
//                     image: AssetImage('assets/images/scatter_plot.png'),
//                   ),
//                 ),
//               ),
//               SizedBox(width: 16.w),
//               SizedBox(
//                 width: 1.sw - 200.w,
//                 child: Text(
//                   'Tanah ${indexPohon.value + 1}',
//                   textAlign: TextAlign.start,
//                   style: TextStyle(
//                     color: colorPrimaryBlack,
//                     fontSize: 14.sp,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//               Icon(
//                 CupertinoIcons.arrow_right,
//                 color: colorPrimaryBlack,
//                 size: 24.sp,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

