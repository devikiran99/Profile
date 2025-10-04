class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String certificateSrc;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.certificateSrc,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'Jetpack Compose Master class by Philip Lackner',
    organization: 'PL Coding',
    date: 'June 2025',
    skills: 'Jetpack Compose | Kotlin',
    certificateSrc: 'assets/images/certificates/jetpack_compose_certificate.png',
  ),

  CertificateModel(
    name: 'Flutter & Dart Essentials-Build Mobile Apps like a Pro',
    organization: 'Udemy',
    date: 'September 2025',
    skills: 'Flutter | IOS Development | Android Development',
    certificateSrc: 'assets/images/certificates/flutter_development_certificate.png',
  ),

  CertificateModel(
    name: 'GitLab CI/CD: Pipelines, CI/CD and DevOps for Beginners',
    organization: 'Udemy',
    date: 'September 2025',
    skills: 'CI/CD | AWS | Docker',
    certificateSrc:  'assets/images/certificates/ci_cd_pipeline_certificate.png',
  ),

  CertificateModel(
    name: 'Comprehensive Android Testing Guide with Jetpack Compose',
    organization: 'Udemy',
    date: 'September 2025',
    skills: 'Kotlin | Unit Test | Integration Test | System Test',
    certificateSrc:  'assets/images/certificates/android_testing_certificate.png',
  ),

  CertificateModel(
    name: 'Docker for Java Developers',
    organization: 'Udemy',
    date: 'June 2025',
    skills: 'Docker | Java',
    certificateSrc:  'assets/images/certificates/docker_certificate.png',
  ),
];
