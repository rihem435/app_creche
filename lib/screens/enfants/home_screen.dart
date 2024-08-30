import 'package:creche/controllers/home_controller.dart';
import 'package:creche/core/theme/app_colors.dart';
import 'package:creche/core/widgets/slider_view_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<SliderDrawerState> _sliderDrawerKey =
      GlobalKey<SliderDrawerState>();
  String? title;
  @override
  void initState() {
    title = 'Mes Enfants ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.purpleColor,
      //   title: const Text(
      //     'Mes Enfants ',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontSize: 25,
      //       fontWeight: FontWeight.bold,
      //     ),
      //   ),
      //   centerTitle: true,
      // ),
      body: SliderDrawer(
        appBar: SliderAppBar(
          appBarColor: AppColors.purpleColor,
          title: Text(
            title!,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
        key: _sliderDrawerKey,
        sliderOpenSize: 179,
        slider: SliderView(
          onItemClick: (title) {
            _sliderDrawerKey.currentState!.closeSlider();
            setState(() {
              this.title = title;
            });
          },
        ),
        child: GetBuilder<HomeController>(builder: (controller) {
          return Container(
            color: Colors.white,
            child: FutureBuilder(
              future: controller.getEnfantsByParent(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                } else if (!snapshot.hasData) {
                  return const Text('No Data');
                } else if (snapshot.hasData) {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (builder, index) {
                        return Card(
                          child: ListTile(
                            leading: const Icon(
                              Icons.child_care,
                              color: AppColors.purpleColor,
                            ),
                            title: Text(
                                "${snapshot.data![index]!.nom!} ${snapshot.data![index]!.prenom!}"),
                            subtitle: Text(
                                "Age : ${snapshot.data![index]!.dateNaiss}"),
                            trailing: const Text('present'),
                          ),
                        );
                      });
                }
                return const SizedBox.shrink();
              },
            ),
          );
        }),
      ),
    );
  }
}
