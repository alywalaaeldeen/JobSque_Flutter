import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

final String logo = '''<svg width="141" height="33" viewBox="0 0 141 33" fill="none" xmlns="http://www.w3.org/2000/svg">
<path d="M0.423828 20.1895C0.423828 23.9629 3.0625 26.4102 7.0957 26.4102C11.3203 26.4102 13.8359 24.0176 13.8359 19.8203V6.27148H9.70703V19.793C9.70703 21.7754 8.77734 22.8418 7.05469 22.8418C5.49609 22.8418 4.45703 21.7891 4.42969 20.1895H0.423828ZM53.8207 26C58.0316 26 60.643 23.8262 60.643 20.3535C60.643 17.7422 58.6742 15.7871 55.9945 15.582V15.4727C58.0863 15.1582 59.6996 13.3535 59.6996 11.1934C59.6996 8.17188 57.3754 6.27148 53.6703 6.27148H45.0844V26H53.8207ZM49.2133 9.34766H52.6039C54.5316 9.34766 55.6391 10.25 55.6391 11.8359C55.6391 13.5039 54.3812 14.4746 52.1801 14.4746H49.2133V9.34766ZM49.2133 22.9238V17.1953H52.6723C55.1059 17.1953 56.432 18.1797 56.432 20.0254C56.432 21.9121 55.1469 22.9238 52.768 22.9238H49.2133ZM63.3763 20.3809C63.4993 24.0859 66.5208 26.3418 71.2649 26.3418C76.1595 26.3418 79.263 23.9219 79.263 20.0938C79.263 17.0859 77.5403 15.3906 73.5891 14.543L71.1966 14.0371C68.927 13.5176 67.97 12.834 67.97 11.6172C67.97 10.1543 69.3372 9.18359 71.3743 9.18359C73.4388 9.18359 74.9016 10.1953 75.0384 11.8633H78.9075C78.8391 8.29492 75.9544 5.92969 71.3606 5.92969C66.9583 5.92969 63.8138 8.33594 63.8138 11.9727C63.8138 14.8574 65.6048 16.7031 69.2415 17.4824L71.8118 18.043C74.1907 18.5762 75.1341 19.2871 75.1341 20.5723C75.1341 22.0215 73.6302 23.0742 71.429 23.0742C69.2415 23.0742 67.5462 22.0078 67.3548 20.3809H63.3763ZM91.8263 26.3418C93.0705 26.3418 94.2189 26.1641 95.2716 25.7949L96.6798 27.8594H100.686L98.1837 24.0859C100.221 22.4043 101.328 19.6152 101.328 16.1426C101.328 9.86719 97.6642 5.92969 91.8263 5.92969C85.9748 5.92969 82.3107 9.86719 82.3107 16.1426C82.3107 22.4727 85.9748 26.3418 91.8263 26.3418ZM91.8263 22.9238C88.5861 22.9238 86.5216 20.2715 86.5216 16.1426C86.5216 12 88.5861 9.33398 91.8263 9.33398C95.0529 9.33398 97.1173 12 97.1173 16.1426C97.1173 18.043 96.5978 19.6152 95.6681 20.6816L94.8068 19.5059H91.0744L93.2345 22.7324C92.797 22.8555 92.3322 22.9238 91.8263 22.9238ZM109.257 6.27148H105.128V19.0273C105.128 23.375 108.341 26.3418 113.399 26.3418C118.444 26.3418 121.657 23.375 121.657 19.0273V6.27148H117.528V18.6172C117.528 21.1465 116.038 22.8008 113.399 22.8008C110.747 22.8008 109.257 21.1465 109.257 18.6172V6.27148ZM139.143 22.582H130.201V17.6055H138.637V14.4336H130.201V9.67578H139.143V6.27148H126.072V26H139.143V22.582Z" fill="#111827"/>
<path d="M38 15C38 19.97 33.97 24 29 24C24.03 24 20 19.97 20 15C20 10.03 24.03 6 29 6" stroke="#3366FF" stroke-width="2.5" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M36.9299 24.6898C37.4599 26.2898 38.6699 26.4498 39.5999 25.0498C40.4499 23.7698 39.8899 22.7198 38.3499 22.7198C37.2099 22.7098 36.5699 23.5998 36.9299 24.6898Z" stroke="#3366FF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M32 9H38" stroke="#3366FF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
<path d="M32 12H35" stroke="#3366FF" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
</svg>
''';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: SvgPicture.string(logo , width: 40, height: 30,),
      ),
    );
  }
}
