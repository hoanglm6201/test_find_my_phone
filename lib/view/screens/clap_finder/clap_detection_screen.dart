import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:infinite_listview/infinite_listview.dart';
import 'package:test_find_my_phone/data/model/icon_sound_model.dart';
import 'package:test_find_my_phone/utils/icon_sound.dart';
import 'package:test_find_my_phone/utils/locator_support.dart';

class ClapDetectionScreen extends StatefulWidget {
  @override
  _ClapDetectionScreenState createState() => _ClapDetectionScreenState();
}

class _ClapDetectionScreenState extends State<ClapDetectionScreen> {
  bool isActive = false;

  final List<IconSoundModel> items = IconSound.iconSoundItems;
  int selectedIndex = 0;

  void onSelectedIndex(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  final InfiniteScrollController _controller = InfiniteScrollController();
  final double unselectedItemSize = 170.0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Cuộn đến item mặc định
      _controller.animateTo(
        selectedIndex + items.length * 170, // Đặt item mặc định vào trung tâm
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  void _onScroll() {
    // Xác định item nằm ở giữa màn hình
    final double offset = _controller.offset;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double centerPosition = screenWidth / 2;
    final double centerItemIndex = (offset + centerPosition - (185 / 2)) /
        185; // Tính index theo vị trí trung tâm
    final int index = centerItemIndex.round();
    final int actualIndex = index % items.length;

    if (selectedIndex != actualIndex) {
      setState(() {
        selectedIndex = (actualIndex + items.length) % items.length; // Đảm bảo chỉ số không âm
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Image.asset('assets/images/ic_find_my_phone.png', width: 136, height: 21,),
          ),
          Align(
            alignment: Alignment.topRight,
            child: InkWell(
              borderRadius: BorderRadius.circular(28),
              onTap: (){

              },
              child: Container(
                padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
                child: Image.asset('assets/images/ic_setting.png', width: 28, height: 28, fit: BoxFit.cover,)
              )
            )
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(context.locale.swipe_to_select_custom_sound_alert, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),

                  customListSound(),

                  Image.asset('assets/images/ic_arrow_down.png', height: 86,),
                  const SizedBox(height: 8,),
                  Text(context.locale.click_start_to_enable, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                  Text(context.locale.clap_finder_mode, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white.withOpacity(0.6)),),
                  const SizedBox(height: 16,),
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.symmetric(horizontal: 23),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: !isActive ? const Color(0xFF4E5DFF).withOpacity(0.35) : const Color(0xFFC92929).withOpacity(0.33), // Màu viền
                        width: 1, // Độ dày viền
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: TextButton(
                      onPressed: (){
                        setState(() {
                          isActive = !isActive;
                        });
                      },
                      child: Stack(
                        children: [
                          Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            gradient: LinearGradient(colors: [!isActive ? const Color(0xFF297DFC) : const Color(0xFFFF4949), !isActive ? const Color(0xFF1221C2) : const Color(0xFFC82525)], begin: Alignment.topCenter, end: Alignment.bottomCenter)
                          ),
                          width: double.infinity,
                          height: 74,
                          child:
                            Text(
                              !isActive ? context.locale.active : context.locale.stop,
                              style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w700, color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: Offset.fromDirection(0, 1.0), // Độ lệch của shadow
                                    blurRadius: 5.64,          // Độ mờ của shadow
                                    color: Colors.white.withOpacity(0.73), // Màu của shadow
                                  ),
                                ],
                              ),
                            )
                          ),
                          Positioned(
                            bottom: 0,
                            child: Image.asset('assets/images/button_blur.png', width: 316, fit: BoxFit.cover,)
                          )
                        ],
                      )
              
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget customListSound(){
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification notification) {
        _onScroll();
        return true;
      },
      child: Container(
        padding: EdgeInsets.only(top: 40),
        height: 240, // Chiều cao lớn nhất để chứa item
        child: InfiniteListView.builder(
          controller: _controller,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final actualIndex = index % items.length; // Lấy chỉ số thực
            final isSelected = actualIndex == selectedIndex;

            return Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: isSelected ? 203 : 172,
                  height: isSelected ? 203 : 172,
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(colors: [Color(0xFF3770A5), Color(0xFF333FA2), Color(0xFF3FA3C3)], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(40),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 200), // Hiệu ứng chuyển đổi mượt
                  width: isSelected ? 200 : 170,
                  height: isSelected ? 200 : 170,
                  decoration: BoxDecoration(
                    gradient: isSelected ? const LinearGradient(colors: [Color(0xFF297DFC), Color(0xFF1221C2)], begin: Alignment.topCenter, end: Alignment.bottomCenter) : LinearGradient(colors: [Colors.black, Colors.black], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                    borderRadius: BorderRadius.circular(40),

                  ),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Image.asset(
                        items[actualIndex].asset,
                        width: 130,
                        height: 130,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        items[actualIndex].name,
                      )
                    ]
                  ),
                ),
              ]
            );
          },
        ),
      ),
    );
  }
}