import 'package:haruapp/services/auth.dart';

class Validator {
  List<Function> _validatorList;
  String _value;
  Validator(List<Function> validatorList, String value) {
    this._validatorList = validatorList;
    this._value = value;
  }

  String validate() {
    String errorText;
    for (int i = 0; i < this._validatorList.length; i++) {
      errorText = this._validatorList[i](this._value);
      if (errorText != null) {
        break;
      }
    }
    return errorText;
  }
}

Function vIsRequired({String errorText}) => (value) =>
    value.isEmpty || value == null ? errorText ?? "필수로 입력해야합니다." : null;

Function vMinLength(int min, {String errorText}) => (value) => value == ""
    ? null
    : value.length < min
        ? errorText ?? "minimum length is $min characters"
        : null;

Function vMaxLength(int max, {String errorText}) => (value) => value == ""
    ? null
    : value.length > max
        ? errorText ?? "maximum length is $max characters"
        : null;

Function vLengthRange(int min, int max, {String errorText}) =>
    (value) => value == ""
        ? null
        : value.length < min || value.length > max
            ? errorText ?? "length must be between $min & $max characters"
            : null;

Function vMatch(String stringToMatch, {String errorText}) =>
    (value) => value == ""
        ? null
        : !RegExp("^$stringToMatch\$", caseSensitive: true).hasMatch(value)
            ? errorText ?? "Values doesn't match"
            : null;

Function vMatchPattern(String regExp, {String errorText}) =>
    (value) => value == ""
        ? null
        : !RegExp("$regExp").hasMatch(value)
            ? errorText ?? "Pattern doesn't match"
            : null;

Function vIsInt({String errorText}) => (value) => value == ""
    ? null
    : int.tryParse(value) == null ? errorText ?? "invalid integer" : null;

Function vIsDouble({String errorText}) => (value) => value == ""
    ? null
    : double.tryParse(value) == null ? errorText ?? "invalid double" : null;

Function vMin(int min, {String errorText}) => (value) => value == ""
    ? null
    : double.tryParse(value) == null || double.parse(value) < min
        ? errorText ?? "Number must be bigger than $min"
        : null;

Function vMax(int max, {String errorText}) => (value) => value == ""
    ? null
    : double.tryParse(value) == null || double.parse(value) > max
        ? errorText ?? "Number must be smaller than $max"
        : null;

Function vRange(int min, int max, {String errorText}) => (value) => value == ""
    ? null
    : double.tryParse(value) == null &&
            double.parse(value) < min &&
            double.parse(value) > max
        ? errorText ?? "Number must be between $min & $max"
        : null;

/*
 * 한글, 영문 가능
 * 한글 2~8 자릿수
 * 영문 4~16 자릿수
 * */
Function vUsername({String errorText}) =>
    (value) => !RegExp(r'[가-힣]{2,8}|[a-zA-Z]{4,16}').hasMatch(value)
        ? errorText ?? "잘못된 이름 입니다."
        : null;

/*
 * 영문, 숫자, 특수문자 필수
 * 8~16 자릿수
 * */
Function vPassword({String errorText}) =>
    (value) => !RegExp(r"^(?=.*[a-zA-Z])(?=.*[^a-zA-Z0-9])(?=.*[0-9]).{8,16}$")
            .hasMatch(value)
        ? errorText ?? "비밀번호는 영문, 숫자, 특수문자가 포함되야합니다."
        : null;

Function vPasswordConfirm(String password, {String errorText}) =>
    (value) => password != value ? errorText ?? "비밀번호가 일치하지 않습니다." : null;

Function vEmail({String errorText}) =>
    (value) => !RegExp(r"(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)")
            .hasMatch(value)
        ? errorText ?? "잘못된 이메일 입니다."
        : null;
