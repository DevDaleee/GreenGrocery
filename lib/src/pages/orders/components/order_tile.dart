import 'package:flutter/material.dart';
import 'package:hortifruit/src/models/cart_item_model.dart';
import 'package:hortifruit/src/models/order_models.dart';
import 'package:hortifruit/src/pages/home/components/item_tile.dart';
import 'package:hortifruit/src/pages/orders/components/order_status_widget.dart';
import 'package:hortifruit/src/pages/widget/payment_dialog.dart';

class OrderTile extends StatelessWidget {
  final OrderModels order;

  const OrderTile({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 1,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          expandedCrossAxisAlignment: CrossAxisAlignment.start,
          initiallyExpanded: order.status == 'pending_payment',
          title: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pedido: ${order.id}',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
              Text(
                utils.formattedDate(order.createdDateTime),
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
          childrenPadding: EdgeInsets.fromLTRB(16, 0, 16, 16),
          children: [
            //Cresce com base no maior widget da tela
            IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: SizedBox(
                      height: 150,
                      child: ListView(
                        children: order.items.map((item) {
                          return _OrderItemWidget(
                            item: item,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    color: Colors.grey.shade300,
                    thickness: 2,
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: OrderStatusWidget(
                      status: order.status,
                      isOverdue: order.overdueDateTime.isBefore(
                        DateTime.now(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Text.rich(
              TextSpan(
                style: TextStyle(
                  fontSize: 20,
                ),
                children: [
                  TextSpan(
                    text: 'Total: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextSpan(
                    text: utils.priceToCurrency(order.total),
                  )
                ],
              ),
            ),
            Visibility(
              visible: order.status == 'pending_payment',
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.88,
                child: ElevatedButton.icon(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) {
                      return PaymentDialog(order: order);
                    },
                  ),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ),
                  icon: Icon(
                    Icons.pix_outlined,
                    color: Colors.white,
                  ),
                  label: Text(
                    'Ver QR Code Pix',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _OrderItemWidget extends StatelessWidget {
  final CartItemModel item;
  const _OrderItemWidget({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text(
            "${item.quantity.toString()} ${item.item.unit} ",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(child: Text(item.item.itemName)),
          Text(utils.priceToCurrency(item.totalPrice()))
        ],
      ),
    );
  }
}
