/// Exception class for handling various errors.
class TExceptions implements Exception {
  /// The associated error message.
  final String message;

  /// Default constructor with a generic error message.
  const TExceptions([this.message = 'An unexpected error occurred. Please try again.']);

  /// Create an authentication exception from a Firebase authentication exception code.
  factory TExceptions.fromCode(String code) {
    switch (code) {
      case 'email-already-in-use':
        return const TExceptions('Бұл электрондық пошта мекенжайы қазірдің өзінде тіркелген. Өзге мекенжай пайдаланыңыз.');
      case 'invalid-email':
        return const TExceptions('Берілген электрондық пошта мекенжайы жарамсыз. Жарамды мекенжай енгізіңіз.');
      case 'weak-password':
        return const TExceptions('Құпия сөз тым әлсіз. Қаттырақ құпия сөз таңдаңыз.');
      case 'user-disabled':
        return const TExceptions('Бұл пайдаланушы тіркелгісі өшірілген. Көмек алу үшін қолдау қызметіне хабарласыңыз.');
      case 'user-not-found':
        return const TExceptions('Кіру мәліметтері жарамсыз. Пайдаланушы табылмады.');
      case 'wrong-password':
        return const TExceptions('Құпия сөз дұрыс емес. Құпия сөзіңізді тексеріп, қайта көріңіз.');
      case 'INVALID_LOGIN_CREDENTIALS':
        return const TExceptions('Кіру деректері жарамсыз. Мәліметтеріңізді қайта тексеріңіз.');
      case 'too-many-requests':
        return const TExceptions('Тым көп сұраулар. Кейінірек қайталап көріңіз.');
      case 'invalid-argument':
        return const TExceptions('Куәландыру әдісіне берілген аргумент жарамсыз.');
      case 'invalid-password':
        return const TExceptions('Құпия сөз дұрыс емес. Қайта көріңіз.');
      case 'invalid-phone-number':
        return const TExceptions('Берілген телефон нөмірі жарамсыз.');
      case 'operation-not-allowed':
        return const TExceptions('Сіздің Firebase жобаңыз үшін кіру қызметі өшірілген.');
      case 'session-cookie-expired':
        return const TExceptions('Firebase сессиясының cookie-файлының мерзімі өтіп кеткен. Қайта кіріңіз.');
      case 'uid-already-exists':
        return const TExceptions('Берілген пайдаланушы ID-і басқа бір пайдаланушымен пайдаланылуда.');
      case 'sign_in_failed':
        return const TExceptions('Кіру сәтсіз аяқталды. Қайта көріңіз.');
      case 'network-request-failed':
        return const TExceptions('Желі сұрауы сәтсіз аяқталды. Интернет байланысыңызды тексеріңіз.');
      case 'internal-error':
        return const TExceptions('Ішкі қате. Кейінірек қайталап көріңіз.');
      case 'invalid-verification-code':
        return const TExceptions('Куәландыру коды жарамсыз. Жарамды код енгізіңіз.');
      case 'invalid-verification-id':
        return const TExceptions('Куәландыру ID-сі жарамсыз. Жаңа куәландыру кодын сұраңыз.');
      case 'quota-exceeded':
        return const TExceptions('Квота асып кетті. Кейінірек қайталап көріңіз.');
      default:
        return const TExceptions();

    }
  }
}
