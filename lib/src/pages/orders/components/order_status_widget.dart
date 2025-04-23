import 'package:flutter/material.dart';
import 'package:hortifruit/src/config/custom_colors.dart';

class OrderStatusWidget extends StatelessWidget {
  final String status;
  final bool isOverdue;

  final Map<String, int> allStatus = <String, int>{
    'pending_payment': 0,
    'refund': 1,
    'paid': 2,
    'preparing_purchase': 3,
    'shipping': 4,
    'delivered': 5,
  };

  int get currentStatus => allStatus[status]!;

  OrderStatusWidget({super.key, required this.status, required this.isOverdue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _StatusDot(title: 'Pedido Confirmado', isActive: true),
        _CustomDivider(),
        if (currentStatus == 1) ...[
          _StatusDot(
            title: 'Pix estornado',
            isActive: true,
            backgroundColor: Colors.orange,
          ),
        ] else if (isOverdue) ...[
          const _StatusDot(
            title: 'Pagamento Vencido',
            isActive: true,
            backgroundColor: Colors.red,
          ),
        ] else ...[
          _StatusDot(title: 'Pagamento', isActive: currentStatus >= 2),
          _CustomDivider(),
          _StatusDot(title: 'Preparando', isActive: currentStatus >= 3),
          _CustomDivider(),
          _StatusDot(title: 'Envio', isActive: currentStatus >= 4),
          _CustomDivider(),
          _StatusDot(title: 'Entregue', isActive: currentStatus >= 5),
        ]
      ],
    );
  }
}

class _CustomDivider extends StatelessWidget {
  const _CustomDivider();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      height: 10,
      width: 2,
      color: Colors.grey.shade300,
    );
  }
}

class _StatusDot extends StatelessWidget {
  final String title;
  final bool isActive;
  final Color? backgroundColor;

  const _StatusDot({
    required this.title,
    required this.isActive,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 5,
      children: [
        Container(
          alignment: Alignment.center,
          height: 20,
          width: 20,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: isActive
                  ? backgroundColor ?? CustomColors.customSwatchColor
                  : CustomColors.customSwatchColor,
            ),
            color: isActive
                ? backgroundColor ?? CustomColors.customSwatchColor
                : Colors.transparent,
          ),
          child: isActive
              ? Icon(
                  Icons.check,
                  size: 13,
                  color: Colors.white,
                )
              : SizedBox.shrink(),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 12),
          ),
        ),
      ],
    );
  }
}
