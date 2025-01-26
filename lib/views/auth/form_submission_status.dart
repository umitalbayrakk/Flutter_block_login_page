
abstract class FormSubmissionStatus {
  const FormSubmissionStatus();
}

class InitalFormStatus extends FormSubmissionStatus {
  const InitalFormStatus();
}

class FormSubmitting extends FormSubmissionStatus {
  const FormSubmitting();
}

class SubmissionSuccess extends FormSubmissionStatus {
  const SubmissionSuccess();
}

class SubmissionFailed extends FormSubmissionStatus {
  final Exception exception;
  SubmissionFailed(this.exception);
}


