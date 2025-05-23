import 'package:hortifruit/src/models/cart_item_model.dart';
import 'package:hortifruit/src/models/item_model.dart';
import 'package:hortifruit/src/models/order_models.dart';
import 'package:hortifruit/src/models/user_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  itemName: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  itemName: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  itemName: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  itemName: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  itemName: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  itemName: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Frutas',
  'Grãos',
  'Verduras',
  'Temperos',
  'Cerais',
];

List<CartItemModel> cartItems = [
  CartItemModel(item: mango, quantity: 1),
  CartItemModel(item: guava, quantity: 3),
  CartItemModel(item: apple, quantity: 2),
];

UserModel user = UserModel(
  name: "Dalessandro",
  email: "dalessandro@gmail.com",
  phone: "99 99999-9999",
  cpf: "999.999.999-99",
  password: "senhasuperforte",
);

List<OrderModels> orders = [
  OrderModels(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse('2025-04-16 11:00:10.458'),
    overdueDateTime: DateTime.parse('2025-04-23 00:00:10.458'),
    id: 'asd6a54d6s2d1',
    status: 'pending_payment',
    total: 11.0,
    items: [
      CartItemModel(
        item: apple,
        quantity: 2,
      ),
      CartItemModel(
        item: mango,
        quantity: 2,
      ),
    ],
  ),
  OrderModels(
    copyAndPaste: 'q1w2e3r4t5y6',
    createdDateTime: DateTime.parse('2025-04-16 11:00:10.458'),
    overdueDateTime: DateTime.parse('2025-04-23 00:00:10.458'),
    id: 'asd6a54d6s2d1',
    status: 'delivered',
    total: 11.0,
    items: [
      CartItemModel(
        item: guava,
        quantity: 1,
      ),
    ],
  )
];
