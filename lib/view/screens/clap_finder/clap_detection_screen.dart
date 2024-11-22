import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:vibration/vibration.dart';
import 'package:audioplayers/audioplayers.dart';

class ClapDetectionScreen extends StatefulWidget {
  @override
  _ClapDetectionScreenState createState() => _ClapDetectionScreenState();
}

class _ClapDetectionScreenState extends State<ClapDetectionScreen> {
  FlutterSoundRecorder _audioRecorder = FlutterSoundRecorder();
  bool _isRecording = false;
  AudioPlayer _audioPlayer = AudioPlayer();
  double _clapThreshold = 0.7; // Ngưỡng để phát hiện vỗ tay

  @override
  void initState() {
    super.initState();
    _requestPermissions();
  }

  // Yêu cầu quyền truy cập micro
  Future<void> _requestPermissions() async {
    var status = await Permission.microphone.request();
    if (!status.isGranted) {
      print("Không có quyền truy cập micro.");
    }
  }

  // Bắt đầu ghi âm nhưng không lưu vào file
  void _startRecording() async {
    await _audioRecorder.openRecorder();
    await _audioRecorder.startRecorder(toFile: null);  // Không lưu file âm thanh
    setState(() {
      _isRecording = true;
    });
    print("Bắt đầu ghi âm...");
  }

  // Dừng ghi âm
  void _stopRecording() async {
    await _audioRecorder.stopRecorder();
    await _audioRecorder.closeRecorder();
    setState(() {
      _isRecording = false;
    });
    print("Dừng ghi âm...");
  }

  // Phát hiện vỗ tay (dựa trên mức độ âm thanh)
  void _detectClap(double amplitude) {
    if (amplitude > _clapThreshold) {
      print("Phát hiện tiếng vỗ tay!");
      _onClapDetected();
    }
    print("Phát hiện tiếng vỗ tay!");
    _onClapDetected();
  }

  // Xử lý khi phát hiện vỗ tay: Rung điện thoại và phát chuông
  void _onClapDetected() {
    // Rung điện thoại
    Vibration.vibrate();

    // Phát chuông báo (có thể thay bằng âm thanh tùy ý)
    // _audioPlayer.play(AssetSource('assets/ringtone.mp3'));
  }

  // Phương thức để lắng nghe và phân tích âm thanh trong quá trình ghi âm
  void _listenToMicrophone() {
    _audioRecorder.onProgress!.listen((event) {
      double amplitude = event.decibels ?? 0.0;  // Lấy giá trị mức âm thanh (amplitude)

      // Kiểm tra mức âm thanh để phát hiện vỗ tay
      _detectClap(amplitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vỗ tay để tìm điện thoại"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_isRecording ? "Đang ghi âm..." : "Chưa ghi âm."),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _isRecording ? _stopRecording : () {
                _startRecording();
                _listenToMicrophone();  // Bắt đầu lắng nghe khi ghi âm
              },
              child: Text(_isRecording ? "Dừng ghi âm" : "Bắt đầu ghi âm"),
            ),
          ],
        ),
      ),
    );
  }
}