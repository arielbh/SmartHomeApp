// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AppHome {
  String get name => throw _privateConstructorUsedError;
  List<AppRoom> get rooms => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AppHomeCopyWith<AppHome> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppHomeCopyWith<$Res> {
  factory $AppHomeCopyWith(AppHome value, $Res Function(AppHome) then) =
      _$AppHomeCopyWithImpl<$Res, AppHome>;
  @useResult
  $Res call({String name, List<AppRoom> rooms});
}

/// @nodoc
class _$AppHomeCopyWithImpl<$Res, $Val extends AppHome>
    implements $AppHomeCopyWith<$Res> {
  _$AppHomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rooms = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rooms: null == rooms
          ? _value.rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<AppRoom>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AppHomeCopyWith<$Res> implements $AppHomeCopyWith<$Res> {
  factory _$$_AppHomeCopyWith(
          _$_AppHome value, $Res Function(_$_AppHome) then) =
      __$$_AppHomeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, List<AppRoom> rooms});
}

/// @nodoc
class __$$_AppHomeCopyWithImpl<$Res>
    extends _$AppHomeCopyWithImpl<$Res, _$_AppHome>
    implements _$$_AppHomeCopyWith<$Res> {
  __$$_AppHomeCopyWithImpl(_$_AppHome _value, $Res Function(_$_AppHome) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? rooms = null,
  }) {
    return _then(_$_AppHome(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rooms: null == rooms
          ? _value._rooms
          : rooms // ignore: cast_nullable_to_non_nullable
              as List<AppRoom>,
    ));
  }
}

/// @nodoc

class _$_AppHome implements _AppHome {
  const _$_AppHome({required this.name, required final List<AppRoom> rooms})
      : _rooms = rooms;

  @override
  final String name;
  final List<AppRoom> _rooms;
  @override
  List<AppRoom> get rooms {
    if (_rooms is EqualUnmodifiableListView) return _rooms;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_rooms);
  }

  @override
  String toString() {
    return 'AppHome(name: $name, rooms: $rooms)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AppHome &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality().equals(other._rooms, _rooms));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, const DeepCollectionEquality().hash(_rooms));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AppHomeCopyWith<_$_AppHome> get copyWith =>
      __$$_AppHomeCopyWithImpl<_$_AppHome>(this, _$identity);
}

abstract class _AppHome implements AppHome {
  const factory _AppHome(
      {required final String name,
      required final List<AppRoom> rooms}) = _$_AppHome;

  @override
  String get name;
  @override
  List<AppRoom> get rooms;
  @override
  @JsonKey(ignore: true)
  _$$_AppHomeCopyWith<_$_AppHome> get copyWith =>
      throw _privateConstructorUsedError;
}
