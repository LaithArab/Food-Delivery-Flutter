import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  Widget orderVoucherITem(
    BuildContext context, {
    required String name,
    required int number,
  }) {
    return Column(
      children: [
        Text(
          number.toString(),
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
            color: Theme.of(context).primaryColor,
          ),
        ),
        Text("$name", style: Theme.of(context).textTheme.titleMedium),
      ],
    );
  }

  Widget itemTappedTile(
    BuildContext context, {
    required String title,
    String? subtitle,
    required IconData icon,
  }) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return ListTile(
      leading: Icon(
        icon,
        size: isLandScape ? size.height * 0.13 : size.height * 0.06,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: isLandScape ? size.height * 0.07 : size.height * 0.03,
        ),
      ),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: Icon(
        Icons.chevron_right,
        size: isLandScape ? size.height * 0.13 : size.height * 0.05,
      ),
      onTap: () => print('$title clicked!'),
    );
  }

  Widget personPhoto({required double height, required double width}) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/laithPhoto.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    final namePerson = Text(
      "Laith Arab",
      style: Theme.of(
        context,
      ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
    );
    return SingleChildScrollView(
      child: Column(
        children: [
          if (!isLandScape) ...[
            personPhoto(height: size.height * 0.3, width: size.width * 0.7),
            SizedBox(height: size.height * 0.02),
            namePerson,
            SizedBox(height: size.height * 0.02),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                orderVoucherITem(context, name: "Order", number: 50),
                orderVoucherITem(context, name: "Vouchers", number: 10),
              ],
            ),
          ],
          if (isLandScape) ...[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    personPhoto(
                      height: size.height * 0.5,
                      width: size.width * 0.4,
                    ),
                  ],
                ),
                Column(
                  children: [
                    namePerson,
                    SizedBox(height: size.height * 0.06),
                    orderVoucherITem(context, name: "Order", number: 50),
                    SizedBox(height: size.height * 0.02),
                    orderVoucherITem(context, name: "Vouchers", number: 10),
                  ],
                ),
              ],
            ),
          ],
          SizedBox(height: size.height * 0.03),
          Divider(),

          itemTappedTile(
            context,
            title: "Past Order",
            icon: Icons.shopping_cart,
          ),
          Divider(),
          itemTappedTile(
            context,
            title: "Acailable Vouchers",
            icon: Icons.card_giftcard,
          ),
          Divider(),
        ],
      ),
    );
  }
}
