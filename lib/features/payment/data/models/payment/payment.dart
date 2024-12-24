import 'session.dart';

class Payment {
	String? message;
	Session? session;

	Payment({this.message, this.session});

	factory Payment.fromJson(Map<String, dynamic> json) => Payment(
				message: json['message'] as String?,
				session: json['session'] == null
						? null
						: Session.fromJson(json['session'] as Map<String, dynamic>),
			);

	Map<String, dynamic> toJson() => {
				'message': message,
				'session': session?.toJson(),
			};
}
