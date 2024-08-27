import 'package:creche/core/theme/app_colors.dart';
import 'package:creche/core/widgets/slider_view_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slider_drawer/flutter_slider_drawer.dart';

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
          child: Container(
            color: Colors.white,
            child: ListView.builder(
                itemCount: 15,
                itemBuilder: (builder, index) {
                  return const Card(
                    child: ListTile(
                      leading: Icon(
                        Icons.child_care,
                        color: AppColors.purpleColor,
                      ),
                      title: Text('Enfant 1'),
                      subtitle: Text("Age : 5 ans"),
                      trailing: Text('present'),
                    ),
                  );
                }),
          )),
    );
  }
}
