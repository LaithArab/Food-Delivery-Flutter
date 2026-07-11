import 'package:flutter/material.dart';
import 'package:food_delivery/models/food_item.dart';
import 'package:food_delivery/ui_models/food_det_args.dart';
import 'package:food_delivery/widgets/custom_back_bottom.dart';
import 'package:food_delivery/widgets/favorit_bottom.dart';
import 'package:food_delivery/widgets/food_det/food_item-counter.dart';
import 'package:food_delivery/widgets/pro_item.dart';

class FoodDetailsPage extends StatelessWidget {
  static const source = '/food_details';
  const FoodDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final args = ModalRoute.of(context)!.settings.arguments as FoodDetArgs;
    final foodIndex = args.foodIndex;
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomBackBottom(
                        onTap: () => Navigator.of(
                          context,
                        ).pop<String>(food[foodIndex].name),
                        height: size.height * 0.04,
                        width: size.width * 0.1,
                      ),
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: FavoriteButton(
                          foodIndex: foodIndex,
                          width: size.width * 0.1,
                          height: size.height * 0.04,
                        ),
                      ),
                    ],
                    expandedHeight: size.height * 0.4,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(24.0),
                        ),
                        child: Image.network(
                          food[foodIndex].imgUrl,

                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.only(
                      left: 16.0,
                      right: 16.0,
                      top: 16.0,
                      bottom: 46.0,
                    ),
                    sliver: SliverList(
                      delegate: SliverChildListDelegate([
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  food[foodIndex].name,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineSmall!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                const SizedBox(height: 6.0),
                                Text(
                                  'Buffalo Burger',
                                  style: Theme.of(context).textTheme.bodyLarge!
                                      .copyWith(color: Colors.grey),
                                ),
                              ],
                            ),
                            FoodItemCounter(),
                          ],
                        ),
                        const SizedBox(height: 32.0),
                        IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              ProItem(title: 'Size', description: 'Medium'),
                              VerticalDivider(indent: 0, endIndent: 0),
                              ProItem(
                                title: 'Calories',
                                description: '150 Kcal',
                              ),
                              VerticalDivider(indent: 0, endIndent: 0),
                              ProItem(
                                title: 'Cooking',
                                description: '10-20 Min',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        Text(
                          'Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem Ipsum Lorem',
                          style: Theme.of(
                            context,
                          ).textTheme.bodyMedium!.copyWith(color: Colors.grey),
                        ),
                        SizedBox(height: 500),
                      ]),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                top: 16.0,
                left: 16.0,
                right: 16.0,
              ),
              child: Row(
                children: [
                  Text(
                    '\$ ${food[foodIndex].price}',
                    style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: Colors.deepOrange,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 46.0),
                  Expanded(
                    child: SizedBox(
                      height: size.height * 0.058,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Checkout'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
