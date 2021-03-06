class InputField {
  final int id;
  final int stepID;
  final int requestID;
  final int inputFieldTypeID;
  String title;
  final int ipIndex;

  InputField({
    this.id,
    this.stepID,
    this.requestID,
    this.inputFieldTypeID,
    this.title,
    this.ipIndex,
  });

  factory InputField.fromJson(Map<String, dynamic> json) {
    return InputField(
      id: json['ID'],
      stepID: json['StepID'],
      requestID: json['RequestID'],
      inputFieldTypeID: json['InputFieldTypeID'],
      title: json['Title'],
      ipIndex: json['IpIndex'],
    );
  }
}
