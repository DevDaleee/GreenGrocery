import 'package:flutter/material.dart';

import 'package:hortifruit/src/config/custom_colors.dart';
import 'package:hortifruit/src/models/cart_item_model.dart';
import 'package:hortifruit/src/pages/home/components/item_tile.dart';
import 'package:hortifruit/src/pages/widget/quantitiy_widget.dart';

class CustomCardCart extends StatefulWidget {
  final CartItemModel cartItem;
  final Function(CartItemModel) remove;
  const CustomCardCart(
      {super.key, required this.cartItem, required this.remove});

  @override
  State<CustomCardCart> createState() => _CustomCardCartState();
}

class _CustomCardCartState extends State<CustomCardCart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Image.asset(
          widget.cartItem.item.imgUrl,
          height: 60,
          width: 60,
        ),
        title: Text(
          widget.cartItem.item.itemName,
          style: TextStyle(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          utils.priceToCurrency(widget.cartItem.totalPrice()),
          style: TextStyle(
            color: CustomColors.customSwatchColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: QuantitiyWidget(
          isRemovable: true,
          suffixText: widget.cartItem.item.unit,
          value: widget.cartItem.quantity,
          result: (quantity) {
            setState(() {
              widget.cartItem.quantity = quantity;
              if (quantity == 0) {
                widget.remove(widget.cartItem);
              }
            });
          },
        ),
      ),
    );
  }
}
