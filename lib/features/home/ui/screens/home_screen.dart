import 'package:ecommerce/app/assets_path.dart';
import 'package:ecommerce/features/home/ui/widgets/appbar_action_button.dart';
import 'package:ecommerce/features/home/ui/widgets/carousel_slider_widget.dart';
import 'package:ecommerce/features/home/ui/widgets/productSearchBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchBar = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SvgPicture.asset(AssetsPath.navLogoSvg),
        actions: [
          AppBarActionButton(icon: Icons.person_outlined, onTap: () {}),
          SizedBox(width: 8),
          AppBarActionButton(icon: Icons.call, onTap: () {}),
          SizedBox(width: 8),
          AppBarActionButton(
            icon: Icons.notifications_active_outlined,
            onTap: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              SizedBox(height: 16),
              ProductSearchBar(searchBarController: _searchBar),
              SizedBox(height: 16),
              CarouselSliderWidget(),
            ],
          ),
        ),
      ),
    );
  }
}


