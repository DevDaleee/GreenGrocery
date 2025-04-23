import 'package:flutter/material.dart';
import 'package:hortifruit/src/models/order_models.dart';
import 'package:hortifruit/src/pages/home/components/item_tile.dart';

import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModels order;
  const PaymentDialog({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Pagamento com pix',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                QrImageView(
                  data: '1234567890',
                  version: QrVersions.auto,
                  size: 200,
                ),
                Text(
                  'Vencimento: ${utils.formattedDate((order.overdueDateTime))}',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Total: ${utils.priceToCurrency((order.total))}',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                      color: Colors.green,
                    ),
                  ),
                  icon: Icon(
                    Icons.copy,
                    size: 15,
                  ),
                  label: Text(
                    'Copia/Cola pix',
                    style: TextStyle(
                      fontSize: 13,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}
