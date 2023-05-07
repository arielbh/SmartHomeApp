// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_room.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppRoom {
  RoomType get type => throw _privateConstructorUsedError;
  List<String> get deviceIds => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppRoomCopyWith<AppRoom> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppRoomCopyWith<$Res> {
  factory $AppRoomCopyWith(AppRoom value, $Res Function(AppRoom) then) =
      _$AppRoomCopyWithImpl<$Res, AppRoom>;
  @useResult
  $Res call({RoomType type, List<String> deviceIds});
}

/// @nodoc
class _$AppRoomCopyWithImpl<$Res, $Val extends AppRoom>
    implements $AppRoomCopyWith<$Res> {
  _$AppRoomCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? deviceIds = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoomType,
      deviceIds: null == deviceIds
          ? _value.deviceIds
          : deviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppRoomCopyWith<$Res> implements $AppRoomCopyWith<$Res> {
  factory _$$_AppRoomCopyWith(
          _$_AppRoom value, $Res Function(_$_AppRoom) then) =
      __$$_AppRoomCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RoomType type, List<String> deviceIds});
}

/// @nodoc
class __$$_AppRoomCopyWithImpl<$Res>
    extends _$AppRoomCopyWithImpl<$Res, _$_AppRoom>
    implements _$$_AppRoomCopyWith<$Res> {
  __$$_AppRoomCopyWithImpl(_$_AppRoom _value, $Res Function(_$_AppRoom) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? deviceIds = null,
  }) {
    return _then(_$_AppRoom(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as RoomType,
      deviceIds: null == deviceIds
          ? _value._deviceIds
          : deviceIds // ignore: cast_nullable_to_non_nullable
              as List<String>,
    ));
  }
}

/// @nodoc

class _$_AppRoom implements _AppRoom {
  const _$_AppRoom({required this.type, required final List<String> deviceIds})
      : _deviceIds = deviceIds;

  @override
  final RoomType type;
  final List<String> _deviceIds;
  @override
  List<String> get deviceIds {
    if (_deviceIds is EqualUnmodifiableListView) return _deviceIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_deviceIds);
  }

  @override
  String toString() {
    return 'AppRoom(type: $type, deviceIds: $deviceIds)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppRoom &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality()
                .equals(other._deviceIds, _deviceIds));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, type, const DeepCollectionEquality().hash(_deviceIds));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppRoomCopyWith<_$_AppRoom> get copyWith =>
      __$$_AppRoomCopyWithImpl<_$_AppRoom>(this, _$identity);
}

abstract class _AppRoom implements AppRoom {
  const factory _AppRoom(
      {required final RoomType type,
      required final List<String> deviceIds}) = _$_AppRoom;

  @override
  RoomType get type;
  @override
  List<String> get deviceIds;
  @override
  @JsonKey(ignore: true)
  _$$_AppRoomCopyWith<_$_AppRoom> get copyWith =>
      throw _privateConstructorUsedError;
}
