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
  bool isCategorySelected = false;
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
              height: size.height * 0.2,

              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsetsDirectional.only(end: 16.0),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          if (categorychosenId == categories[index].id ||
                              !isCategorySelected)
                            isCategorySelected = !isCategorySelected;

                          if (isCategorySelected) {
                            categorychosenId = categories[index].id;
                            filteredFood = food
                                .where(
                                  (item) => categorychosenId == item.categoryId,
                                )
                                .toList();
                          } else {
                            categorychosenId = null;
                            filteredFood = food;
                          }
                        });
                      },
                      child: Container(
                        width: size.width * 0.25,
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: categorychosenId == categories[index].id
                              ? Colors.deepOrange
                              : Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              categories[index].imageUrl,
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(height: 8.0),
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
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    final targetFoodItem = food.firstWhere(
                      (item) => item.id == filteredFood[index].id,
                    );
                    final actualFoodIndex = food.indexOf(targetFoodItem);

                    Navigator.of(context)
                        .pushNamed(
                          FoodDetailsPage.source,
                          arguments: FoodDetArgs(foodIndex: actualFoodIndex),
                        )
                        .then((result) {
                          setState(() {});
                          filteredFood = food;
                          categorychosenId = null;
                          debugPrint(
                            'Returned from FoodDetailsPage with result: $result',
                          );
                        });
                  },
                  child: FoodGridItem(
                    foodIndex: index,
                    filteredFood: filteredFood,
                  ),
                );
              },
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
