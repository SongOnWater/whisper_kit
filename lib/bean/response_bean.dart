import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_bean.freezed.dart';
part 'response_bean.g.dart';

@unfreezed
class WhisperTranscribeResponse with _$WhisperTranscribeResponse {
  factory WhisperTranscribeResponse({
    @JsonKey(name: '@type') required String type,
    required String text,
    @JsonKey(name: 'segments')
    required List<WhisperTranscribeSegment>? segments,
  }) = _WhisperTranscribeResponse;

  factory WhisperTranscribeResponse.fromJson(Map<String, dynamic> json) =>
      _$WhisperTranscribeResponseFromJson(json);
}

@unfreezed
class WhisperTranscribeWord with _$WhisperTranscribeWord {
  factory WhisperTranscribeWord({
    required String text,
    @JsonKey(
      name: 'from_ts',
      fromJson: WhisperTranscribeWord._durationFromInt,
    )
    required Duration fromTs,
    @JsonKey(
      name: 'to_ts',
      fromJson: WhisperTranscribeWord._durationFromInt,
    )
    required Duration toTs,
  }) = _WhisperTranscribeWord;

  factory WhisperTranscribeWord.fromJson(Map<String, dynamic> json) =>
      _$WhisperTranscribeWordFromJson(json);

  static Duration _durationFromInt(int timestamp) {
    return Duration(milliseconds: timestamp * 10);
  }
}

@unfreezed
class WhisperTranscribeSegment with _$WhisperTranscribeSegment {
  ///
  factory WhisperTranscribeSegment({
    @JsonKey(
      name: 'from_ts',
      fromJson: WhisperTranscribeSegment._durationFromInt,
    )
    required Duration fromTs,
    @JsonKey(
      name: 'to_ts',
      fromJson: WhisperTranscribeSegment._durationFromInt,
    )
    required Duration toTs,
    required String text,
    @Default(<WhisperTranscribeWord>[]) List<WhisperTranscribeWord> words,
  }) = _WhisperTranscribeSegment;

  /// Parse [json] to WhisperTranscribeSegment
  factory WhisperTranscribeSegment.fromJson(Map<String, dynamic> json) =>
      _$WhisperTranscribeSegmentFromJson(json);

  static Duration _durationFromInt(int timestamp) {
    return Duration(
      milliseconds: timestamp * 10,
    );
  }
}

@unfreezed
class WhisperVersionResponse with _$WhisperVersionResponse {
  factory WhisperVersionResponse({
    @JsonKey(name: '@type') required String type,
    required String message,
  }) = _WhisperVersionResponse;

  factory WhisperVersionResponse.fromJson(Map<String, dynamic> json) =>
      _$WhisperVersionResponseFromJson(json);
}
