import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../controllers/upload_data_controller.dart';

class UploadDataScreen extends StatelessWidget {
  const UploadDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(UploadDataController());
    return Scaffold(
      appBar: const TAppBar(title: Text('Деректерді жүктеп салу'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Column(
          children: [
            /// -- Profile Body
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const TSectionHeading(title: 'Негізгі жазба', showActionButton: false),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.category, size: 28, color: TColors.primary),
                    title: Text('Санаттарды жүктеп салу', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadCategories(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.shop, size: 28, color: TColors.primary),
                    title: Text('Брендтерді жүктеп салу', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrands(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.shopping_cart, size: 28, color: TColors.primary),
                    title: Text('Өнімдерді жүктеп салу', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProducts(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.image, size: 28, color: TColors.primary),
                    title: Text('Баннерлер жүктеп салу', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBanners(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwSections),
                  const TSectionHeading(title: 'Қарым-қатынастар', showActionButton: false),
                  const Text('Жоғарыдағы барлық мазмұнды жүктеп салғаныңызға көз жеткізіңіз.'),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.link, size: 28, color: TColors.primary),
                    title: Text('Брендтер мен санаттар қатынасы деректерін жүктеп салыңыз', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadBrandCategory(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems),
                  ListTile(
                    leading: const Icon(Iconsax.link, size: 28, color: TColors.primary),
                    title: Text('Өнім санаттары қатысты деректерді жүктеп салу', style: Theme.of(context).textTheme.titleMedium),
                    trailing: IconButton(
                      onPressed: () => controller.uploadProductCategories(),
                      icon: const Icon(Iconsax.arrow_up_1, size: 28, color: TColors.primary),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
