class QuestionModel {
  final int id;
  final String question;
  final List<String> answers;

  QuestionModel(
      {required this.id, required this.question, required this.answers});
}

final List<QuestionModel> questions = [
  QuestionModel(
      id: 1,
      question: 'Question No 1 ',
      answers: ['Lion', 'Monkey', 'Cat', 'Dog']),
  QuestionModel(
      id: 2,
      question: 'Question No 2',
      answers: ['Dog', 'Monkey', 'Cheetah', 'Cat']),
  QuestionModel(
      id: 3,
      question: 'Question No 3',
      answers: ['Lion', 'cat', 'Rabbit', 'Monkey']),
  QuestionModel(
      id: 4,
      question: 'Question No 4',
      answers: ['cat', 'Lion', 'Monkey', 'dog']),
];
