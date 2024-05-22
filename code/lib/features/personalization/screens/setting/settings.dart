import '../../../../common/widgets/list_tiles/user_profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../common/widgets/custom_shapes/containers/primary_header_container.dart';
import '../../../../common/widgets/list_tiles/settings_menu_tile.dart';
import '../../../../common/widgets/texts/section_heading.dart';
import '../../../../home_menu.dart';
import '../../../../utils/constants/colors.dart';
import '../../../../utils/constants/sizes.dart';
import '../../../shop/screens/cart/cart.dart';
import '../../../shop/screens/order/order.dart';
import '../../controllers/user_controller.dart';
import '../address/address.dart';
import '../profile/profile.dart';
import 'upload_data.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = UserController.instance;
    return PopScope(
      canPop: false,
      // Intercept the back button press and redirect to Home Screen
      onPopInvoked: (value) async => Get.offAll(const HomeMenu()),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              /// -- Header
              TPrimaryHeaderContainer(
                child: Column(
                  children: [
                    /// AppBar
                    TAppBar(title: Text('Аккаунт', style: Theme.of(context).textTheme.headlineMedium!.apply(color: TColors.white))),

                    /// User Profile Card
                    TUserProfileTile(onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: TSizes.spaceBtwSections),
                  ],
                ),
              ),

              /// -- Profile Body
              Padding(
                padding: const EdgeInsets.all(TSizes.defaultSpace),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// -- Account  Settings
                    const TSectionHeading(title: 'Аккаут баптаулары', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.safe_home,
                      title: 'Мекен-жайым',
                      subTitle: 'Жеткізу мекен-жайын еңгізіңіз',
                      onTap: () => Get.to(() => const UserAddressScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.shopping_cart,
                      title: 'Себет',
                      subTitle: 'Өнімдерді қосыңыз, алып тастаңыз және төлемге көшіңіз',
                      onTap: () => Get.to(() => const CartScreen()),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.bag_tick,
                      title: 'Тапсырыстарым',
                      subTitle: 'Орындалмаған және аяқталған тапсырыстар',
                      onTap: () => Get.to(() => const OrderScreen()),
                    ),
                    const TSettingsMenuTile(
                        icon: Iconsax.bank, title: 'Менің ақшам', subTitle: 'Тіркелген банк шотына балансты алыңыз'),
                    const TSettingsMenuTile(
                        icon: Iconsax.discount_shape, title: 'Менің купондарым', subTitle: 'Барлық жеңілдік купондарының тізімі'),
                    TSettingsMenuTile(
                        icon: Iconsax.notification, title: 'Хабарландырулар', subTitle: 'Кез келген хабарландыру түрін орнатыңыз', onTap: () {}),
                    const TSettingsMenuTile(
                        icon: Iconsax.security_card, title: 'Есептік жазбаның құпиялылығы', subTitle: 'Деректерді пайдалануды және қосылған тіркелгілерді басқарыңыз'),

                    /// -- App Settings
                    const SizedBox(height: TSizes.spaceBtwSections),
                    const TSectionHeading(title: 'Қолданба параметрлері', showActionButton: false),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.document_upload,
                      title: 'Деректерді жүктеу',
                      subTitle: 'Деректерді Cloud Firebase жүйесіне жүктеп салыңыз',
                      onTap: () => Get.to(() => const UploadDataScreen()),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TSettingsMenuTile(
                      icon: Iconsax.location,
                      title: 'Геолокация',
                      subTitle: 'Орынға негізделген ұсынысты орнатыңыз',
                      trailing: Switch(value: true, onChanged: (value) {}),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Қауіпсіз режим',
                      subTitle: 'Іздеу нәтижесі барлық жастағы адамдар үшін қауіпсіз',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),
                    TSettingsMenuTile(
                      icon: Iconsax.image,
                      title: 'HD кескін сапасы',
                      subTitle: 'Көру үшін кескін сапасын орнатыңыз',
                      trailing: Switch(value: false, onChanged: (value) {}),
                    ),

                    /// -- Logout Button
                    const SizedBox(height: TSizes.spaceBtwSections),
                    SizedBox(
                        width: double.infinity, child: OutlinedButton(onPressed: () => controller.logout(), child: const Text('Logout'))),
                    const SizedBox(height: TSizes.spaceBtwSections * 2.5),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
