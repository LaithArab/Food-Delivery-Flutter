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
    return ListTile(
      leading: Icon(icon, size: size.height * 0.03),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right, size: 25),
      onTap: () => print('$title clicked!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        children: [
          Container(
            height: size.height * 0.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/laithPhoto.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            "Laith Arab",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
          SizedBox(height: size.height * 0.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              orderVoucherITem(context, name: "Order", number: 50),
              orderVoucherITem(context, name: "Vouchers", number: 10),
            ],
          ),
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
