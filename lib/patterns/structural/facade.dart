// Если хотим предоставить простой интерфейс к сложной системе
// Также, если решим использовать другую систему, достаточно переписать фасад

class VideoFile {}

class MP4Codec implements ICodec {}

class OGGCodec implements ICodec {}

class ICodec {}

class VideoConverter {
  void convert() {
    final file = VideoFile();
    late ICodec codec;
    if (1 > 2) {
      codec = MP4Codec();
    } else {
      codec = OGGCodec();
    }
    // some logic
  }
}
