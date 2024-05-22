import 'package:flutter/material.dart';

import '../../../../utils/constants/sizes.dart';
import '../../../../utils/helpers/pricing_calculator.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key, required this.subTotal});

  final double subTotal;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// -- Sub Total
        Row(
          children: [
            Expanded(child: Text('Бағасы', style: Theme.of(context).textTheme.bodyMedium)),
            Text('$subTotal тг', style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),

        /// -- Shipping Fee

        /// -- Tax Fee
        Row(
          children: [
            Expanded(child: Text('Жеткізу құны', style: Theme.of(context).textTheme.bodyMedium)),
            Text(
              '${TPricingCalculator.calculateTax(subTotal, 'US')} тг',
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems),

        /// -- Order Total
        Row(
          children: [
            Expanded(child: Text('Жалпы құны', style: Theme.of(context).textTheme.titleMedium)),
            Text('${TPricingCalculator.calculateTotalPrice(subTotal, 'US')} тг',
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
      ],
    );
  }
}
