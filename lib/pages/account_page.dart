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
    return ListTile(
      leading: Icon(icon, size: 35),
      title: Text(title),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.chevron_right, size: 25),
      onTap: () => print('$title clicked!'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/laithPhoto.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            "Laith Arab",
            style: Theme.of(
              context,
            ).textTheme.headlineMedium!.copyWith(fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              orderVoucherITem(context, name: "Order", number: 50),
              orderVoucherITem(context, name: "Vouchers", number: 10),
            ],
          ),
          const SizedBox(height: 24.0),
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
