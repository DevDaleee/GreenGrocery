import 'package:flutter/material.dart';
import 'package:hortifruit/src/config/custom_colors.dart';
import 'package:hortifruit/src/config/app_data.dart' as appdata;
import 'package:hortifruit/src/pages/orders/components/order_tile.dart';

class OrdersPage extends StatelessWidget {
  const OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColors.customSwatchColor,
        centerTitle: false,
        title: Text(
          'Perfil do Usuário',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        physics: BouncingScrollPhysics(),
        separatorBuilder: (_, index) => SizedBox(
          height: 10,
        ),
        itemBuilder: (_, index) => OrderTile(order: appdata.orders[index]),
        itemCount: appdata.orders.length,
      ),
    );
  }
}
