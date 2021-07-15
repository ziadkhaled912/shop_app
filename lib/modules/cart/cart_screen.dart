import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:shop_app_final/modules/cart/cart_item_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_final/modules/cart/empty_cart_screen.dart';
import 'package:shop_app_final/modules/checkout/checkout_screen.dart';
import 'package:shop_app_final/modules/home_layout/cubit/cubit.dart';
import 'package:shop_app_final/modules/home_layout/cubit/states.dart';
import 'package:shop_app_final/shared/componants/componants.dart';
import 'package:shop_app_final/shared/styles/colors.dart';

class CartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getCart(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state)
        {
          final cartModel = HomeCubit.get(context).cartModel;
          final updateCart = HomeCubit.get(context).updateCart;
          final updateCartModel = HomeCubit.get(context).updateCartModel;
          final daleteCart = HomeCubit.get(context).deleteCart;
          return Conditional.single(
            context: context,
            conditionBuilder: (context) => cartModel != null,
            fallbackBuilder: (context) => Scaffold(
                appBar: AppBar(
                  title : Text("My Cart"),
                ),
                body: Center(child: CircularProgressIndicator())),
            widgetBuilder: (context) => Conditional.single(
              context: context,
              conditionBuilder: (context) => cartModel!.data!.cartItems.length != 0,
              fallbackBuilder: (context) => EmptyCartScreen(),
              widgetBuilder: (context) => Scaffold(
                  appBar: AppBar(
                    title : Text("My Cart"),
                  ),
                  floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
                  floatingActionButton: FloatingActionButton.extended(
                    onPressed: () {
                      navigateTo(
                          context,
                          CheckOutScreen(),
                      );
                    },
                    tooltip: 'checkout',
                    icon: Icon(
                      Icons.credit_card_outlined,
                      color: Colors.white,
                    ),
                    label:  Text(
                      'checkout'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white
                      ),
                    ),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 5),
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              children: [
                                Text(
                                  'total'.toUpperCase(),
                                  style: TextStyle(
                                    color: primaryColor,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  '${cartModel!.data!.cartItems.length} items',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                Spacer(),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'clear cart'.toUpperCase(),
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if(state is UpdateCartLoading || state is GetCartLoading)
                          LinearProgressIndicator(),
                        SizedBox(height: 10),
                        ListView.separated(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => CartItemBuilder(
                            model: cartModel.data!.cartItems[index],
                            updateCartModel: updateCartModel,
                            updateCart: updateCart,
                            deleteCart: daleteCart,
                          ),
                          separatorBuilder: (context, index) => Container(
                            width: double.infinity,
                            height: 1,
                            color: Colors.grey[200],
                          ),
                          itemCount: cartModel.data!.cartItems.length,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Colors.grey[200],
                            ),
                            width: double.infinity,
                            padding: EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Products',
                                    ),
                                    Spacer(),
                                    Text('x${cartModel.data!.cartItems.length}'),
                                  ],
                                ),
                                SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                      'Total:',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17,
                                      ),
                                    ),
                                    Spacer(),
                                    Text(
                                        '${cartModel.data!.total} L.E'
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              ),
            ),
          );
        },
      ),
    );
  }
}
