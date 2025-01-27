import 'package:flutter/material.dart';
import 'package:hortifruit/src/config/custom_colors.dart';
import 'package:hortifruit/src/models/item_model.dart';
import 'package:hortifruit/src/services/utils_services.dart';

UtilsServices utils = UtilsServices();

class ItemTile extends StatelessWidget {
  final ItemModel item;

  const ItemTile({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 1,
          shadowColor: Colors.grey.shade300,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(child: Image.asset(item.imgUrl)),
                Text(
                  item.itemName,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    Text(
                      utils.priceToCurrency(item.price),
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: CustomColors.customSwatchColor,
                      ),
                    ),
                    Text(
                      '/${item.unit}',
                      style: TextStyle(
                        color: Colors.grey.shade500,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                color: CustomColors.customSwatchColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 40,
              width: 35,
              child: Icon(
                Icons.add_shopping_cart_outlined,
                color: Colors.white,
                size: 20,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
