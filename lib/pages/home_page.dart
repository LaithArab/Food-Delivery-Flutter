import 'package:flutter/material.dart';
import 'package:food_delivery/models/category_item.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/pages/det_page.dart';
import 'package:food_delivery/ui_models/food_det_args.dart';
import 'package:food_delivery/utilites/app_assets.dart';
import 'package:food_delivery/widgets/food_grid_item.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<FoodItem> filteredFood;

  void initState() {
    super.initState();
    filteredFood = food;
  }

  int? categorychosenId;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(24.0),
              child: Image.asset(
                AppAssets.classiBurgerTopBannerIcon,
                height: !isLandScape ? size.height * 0.3 : size.height * 0.7,
                fit: BoxFit.contain,
              ),
            ),

            SizedBox(height: size.height * 0.03),
            SizedBox(
              height: size.height * 0.16,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          categorychosenId = categories[index].id;
                          filteredFood = food
                              .where((item) => categorychosenId == item.id)
                              .toList();
                        });
                      },
                      child: Container(
                        width: size.width * 0.25,
                        decoration: BoxDecoration(
                          color: categorychosenId == categories[index].id
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            Image.asset(categories[index].imageUrl),
                            Text(
                              '${categories[index].title}',
                              style:
                                  const TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                  ).copyWith(
                                    color:
                                        categorychosenId == categories[index].id
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: size.height * 0.03),

            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredFood.length,
              itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(
                        FoodDetailsPage.source,
                        arguments: FoodDetArgs(foodIndex: index),
                      )
                      .then((result) {
                        setState(() {});
                        debugPrint(
                          'Returned from FoodDetailsPage with result: $result',
                        );
                      });
                },
                child: FoodGridItem(foodIndex: index),
              ),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isLandScape ? 4 : 2,
                mainAxisSpacing: size.height * 0.02,
                crossAxisSpacing: size.height * 0.02,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
