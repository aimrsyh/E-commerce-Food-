import 'dart:io';

import 'package:ecomm_food/utils/colors.dart';
import 'package:ecomm_food/utils/dimensions.dart';
import 'package:ecomm_food/widgets/app_icon.dart';
import 'package:ecomm_food/widgets/big_text.dart';
import 'package:ecomm_food/widgets/expandable_text_widget.dart';
import 'package:flutter/material.dart';

class RecommendedFoodDetail extends StatelessWidget {
  const RecommendedFoodDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(icon: Icons.clear),
                AppIcon(icon: Icons.shopping_cart_outlined)
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(20),
              child: Container(
                child: Center(
                  child:
                      BigText(size: Dimensions.font26, text: "Silver App Bar"),
                ),
                width: double.maxFinite,
                padding: EdgeInsets.only(top: 5, bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(Dimensions.radius20),
                      topRight: Radius.circular(Dimensions.radius20),
                    )),
              ),
            ),
            pinned: true,
            backgroundColor: AppColors.yellowColor,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
                background: Image.asset(
              "assets/image/nasilemak.jpg",
              width: double.maxFinite,
              fit: BoxFit.cover,
            )),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  child: ExpandableTextWidget(
                      text:
                          "Nasi lemak merupakan makanan tradisi orang Melayu yang terdapat di semua bahagian Malaysia, Singapura, Indonesia dan Brunei. Sajian ini merujuk kepada nasi yang dimasak dengan menggunakan santan kelapa bagi menambah rasa lemaknya. Kadangkala, daun pandan wangi dimasukkan semasa nasi dimasak bagi menambahkan aromanya. Nasi lemak biasanya dihidangkan dengan telur, timun, ikan bilis goreng, kacang goreng dan sambal. Tetapi, kini nasi lemak dijual dengan pelbagai lauk yang termasuk tetapi tidak terhad kepada daging, ayam, sotong, udang, limpa, dan hati lembu. Bahan-bahan untuk membuat Nasi Lemak juga mudah didapati.sebagai contoh daun pandan,halia, serai dan halba boleh dibeli daripada kedai runcit atau pasar awam. Ikan bilis dan telur boleh dibeli di pasar raya. Nasi lemak ialah hidangan yang mudah dan ringkas. Hidangannya lengkap berasaskan nasi yang berlemak santan ditambah rasa pedas sambal, kerangupan ikan bilis, kepejalan telur rebus dan ditawarkan pedasnya dengan timun. Namun begitu, nasi lemak asalnya bukanlah merupakan makanan sarapan harian wajib masyarakat Melayu Malaysia pada umumnya. Amalan pemakanan nasi lemak merupakan satu bentuk bekalan hidangan/bungkusan makanan kepada para pesawah padi mahupun orang yang mengusahakan kebun getah, kelapa sawit, sayur-sayuran dan lain-lain. Oleh sebab nasi lemak mempunyai jumlah kalori/tenaga yang tinggi, selain mempunyai komposisi lemak yang tinggi untuk membekalkan tenaga yang lebih baik dari karbohidrat, kebanyakan masyarakat Melayu di Semenanjung Malaysia, Selatan Thailand, Brunei dan Singapura, menjadikan nasi lemak sebagai bekalan untuk santapan mereka selepas membanting keringat. Nasi untuk membuat nasi lemak boleh dimasak menggunakan periuk dapur biasa atau periuk elektrik. Nasi lemak menggunakan santan untuk melemakkan dan menyedapkan lagi serta menggunakan daun pandan untuk mewangikan lagi masakan. Nasi lemak dikatakan tidak begitu sihat untuk dimakan hari-hari kerana tinggi kalori dan lemaknya oleh pakar pemakanan. Pada 2011, timbul cadangan agar nasi lemak dihadkan jualannya pada dua kali seminggu. Cadangan penyenaraian 70 jenis makanan dan larangan 15 jenis makanan itu disediakan Bahagian Pemakanan Kementerian Kesihatan mengikut peruntukan Akta Makanan 1983 dan Peraturan-Peraturan Makanan 1985. Langkah ini diambil sebagai satu usaha kementerian menangani masalah obesiti dan diabetes yang semakin meningkat pada kalangan rakyat, terutama kanak-kanak."),
                  margin: EdgeInsets.only(
                      left: Dimensions.width20, right: Dimensions.width20),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.remove),
                BigText(
                  text: "\$12.88 " + " X " + " 0 ",
                  color: AppColors.mainBlackColor,
                  size: Dimensions.font26,
                ),
                AppIcon(
                    iconSize: Dimensions.iconSize24,
                    iconColor: Colors.white,
                    backgroundColor: AppColors.mainColor,
                    icon: Icons.add)
              ],
            ),
          ),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20),
            decoration: BoxDecoration(
                color: AppColors.buttonBackgroundColor,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    Icons.favorite,
                    color: AppColors.mainColor,
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: Dimensions.height20,
                      bottom: Dimensions.height20,
                      left: Dimensions.width20,
                      right: Dimensions.width20),
                  child: BigText(
                    text: "\$10 | Add to cart",
                    color: Colors.white,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: AppColors.mainColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
