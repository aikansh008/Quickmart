import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class AddressCard extends StatelessWidget {
  const AddressCard({super.key, required this.selectedAddress, required this.name, required this.number, required this.address});

  final bool selectedAddress;
  final String name;
  final String number;
  final String address;
  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Container(
      width: double.infinity,
    
      decoration: BoxDecoration(
          color: selectedAddress
          ? ecolor.primary.withOpacity(0.5)
          : Colors.transparent,
          border: Border.all(
              width: 1,
              color: selectedAddress
                  ? Colors.transparent
                  : dark
                      ? Colors.grey
                      : Colors.black),
                      borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.only(bottom: ESizes.spaceBtwItems),
      child: Stack(children: [
        Positioned(right: -300, left: 0, child: Icon(Icons.check_circle)),
        Center(
          child: Column(
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              SizedBox(height: ESizes.sm / 2),
              Text(
               number,
               style: TextStyle(fontWeight: FontWeight.w700),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                
              ),
              SizedBox(height: ESizes.sm / 2),
              Text(address),
              
            ],
          ),
        )
      ]),
    );
  }
}
