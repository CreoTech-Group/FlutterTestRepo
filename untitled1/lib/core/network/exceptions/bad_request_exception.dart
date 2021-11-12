
import 'package:untitled1/core/network/exceptions/network_exception.dart';

class BadRequestException extends NetworkException {
  BadRequestException([message]) : super(message, "Invalid Request: ");
}
