import 'package:api/src/model/absent_employee.dart';
import 'package:api/src/model/absent_leave_record.dart';
import 'package:api/src/model/active_hunt_response.dart';
import 'package:api/src/model/apply_leave_for_user_request.dart';
import 'package:api/src/model/apply_leave_request.dart';
import 'package:api/src/model/appraisal.dart';
import 'package:api/src/model/appraisal_answer.dart';
import 'package:api/src/model/appraisal_answers.dart';
import 'package:api/src/model/appraisal_cycle.dart';
import 'package:api/src/model/appraisal_question.dart';
import 'package:api/src/model/attendance_day.dart';
import 'package:api/src/model/attendance_finding.dart';
import 'package:api/src/model/attendance_month.dart';
import 'package:api/src/model/attendance_report.dart';
import 'package:api/src/model/attendance_summary.dart';
import 'package:api/src/model/auth_user.dart';
import 'package:api/src/model/colleague.dart';
import 'package:api/src/model/download_link.dart';
import 'package:api/src/model/employee.dart';
import 'package:api/src/model/employee_events.dart';
import 'package:api/src/model/event_person.dart';
import 'package:api/src/model/festival_info.dart';
import 'package:api/src/model/festival_theme_response.dart';
import 'package:api/src/model/forgot_password_request.dart';
import 'package:api/src/model/holiday.dart';
import 'package:api/src/model/holiday_request.dart';
import 'package:api/src/model/kudos.dart';
import 'package:api/src/model/kudos_request.dart';
import 'package:api/src/model/leave.dart';
import 'package:api/src/model/leave_employee.dart';
import 'package:api/src/model/leave_summary.dart';
import 'package:api/src/model/login_request.dart';
import 'package:api/src/model/login_response.dart';
import 'package:api/src/model/mark_leave_request.dart';
import 'package:api/src/model/message_response.dart';
import 'package:api/src/model/notice.dart';
import 'package:api/src/model/notice_acknowledgement.dart';
import 'package:api/src/model/notice_acknowledgements.dart';
import 'package:api/src/model/notice_request.dart';
import 'package:api/src/model/payment.dart';
import 'package:api/src/model/save_answers_request.dart';
import 'package:api/src/model/settings.dart';
import 'package:api/src/model/update_password_request.dart';

final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ReturnType deserialize<ReturnType, BaseType>(dynamic value, String targetType,
    {bool growable = true}) {
  switch (targetType) {
    case 'String':
      return '$value' as ReturnType;
    case 'int':
      return (value is int ? value : int.parse('$value')) as ReturnType;
    case 'bool':
      if (value is bool) {
        return value as ReturnType;
      }
      final valueString = '$value'.toLowerCase();
      return (valueString == 'true' || valueString == '1') as ReturnType;
    case 'double':
      return (value is double ? value : double.parse('$value')) as ReturnType;
    case 'AbsentEmployee':
      return AbsentEmployee.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AbsentLeaveRecord':
      return AbsentLeaveRecord.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ActiveHuntResponse':
      return ActiveHuntResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ApplyLeaveForUserRequest':
      return ApplyLeaveForUserRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ApplyLeaveRequest':
      return ApplyLeaveRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Appraisal':
      return Appraisal.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'AppraisalAnswer':
      return AppraisalAnswer.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AppraisalAnswers':
      return AppraisalAnswers.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AppraisalCycle':
      return AppraisalCycle.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AppraisalQuestion':
      return AppraisalQuestion.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AttendanceDay':
      return AttendanceDay.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AttendanceFinding':
      return AttendanceFinding.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AttendanceMonth':
      return AttendanceMonth.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AttendanceReport':
      return AttendanceReport.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AttendanceSummary':
      return AttendanceSummary.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'AuthUser':
      return AuthUser.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Colleague':
      return Colleague.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'CycleStatus':
    case 'DownloadLink':
      return DownloadLink.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Employee':
      return Employee.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'EmployeeEvents':
      return EmployeeEvents.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'EventPerson':
      return EventPerson.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'FestivalInfo':
      return FestivalInfo.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'FestivalThemeResponse':
      return FestivalThemeResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'ForgotPasswordRequest':
      return ForgotPasswordRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Holiday':
      return Holiday.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'HolidayRequest':
      return HolidayRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Kudos':
      return Kudos.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'KudosRequest':
      return KudosRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'Leave':
      return Leave.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LeaveEmployee':
      return LeaveEmployee.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'LeaveReason':
    case 'LeaveStatus':
    case 'LeaveSummary':
      return LeaveSummary.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LeaveType':
    case 'LoginRequest':
      return LoginRequest.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'LoginResponse':
      return LoginResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MarkLeaveRequest':
      return MarkLeaveRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'MessageResponse':
      return MessageResponse.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Notice':
      return Notice.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'NoticeAcknowledgement':
      return NoticeAcknowledgement.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'NoticeAcknowledgements':
      return NoticeAcknowledgements.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'NoticeRequest':
      return NoticeRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Payment':
      return Payment.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'QuestionType':
    case 'Role':
    case 'SaveAnswersRequest':
      return SaveAnswersRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    case 'Settings':
      return Settings.fromJson(value as Map<String, dynamic>) as ReturnType;
    case 'UpdatePasswordRequest':
      return UpdatePasswordRequest.fromJson(value as Map<String, dynamic>)
          as ReturnType;
    default:
      RegExpMatch? match;

      if (value is List && (match = _regList.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toList(growable: growable) as ReturnType;
      }
      if (value is Set && (match = _regSet.firstMatch(targetType)) != null) {
        targetType = match![1]!; // ignore: parameter_assignments
        return value
            .map<BaseType>((dynamic v) => deserialize<BaseType, BaseType>(
                v, targetType,
                growable: growable))
            .toSet() as ReturnType;
      }
      if (value is Map && (match = _regMap.firstMatch(targetType)) != null) {
        targetType = match![1]!.trim(); // ignore: parameter_assignments
        return Map<String, BaseType>.fromIterables(
          value.keys as Iterable<String>,
          value.values.map((dynamic v) => deserialize<BaseType, BaseType>(
              v, targetType,
              growable: growable)),
        ) as ReturnType;
      }
      break;
  }
  throw Exception('Cannot deserialize');
}
