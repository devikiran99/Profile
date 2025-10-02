class Project {
  final String name;
  final String description;
  final String linkName;
  final String linkImage;
  final String link;
  final String terms;

  Project({
    required this.name,
    required this.description,
    required this.linkName,
    required this.linkImage,
    required this.link,
    required this.terms,
  });
}

List<Project> projectList = [
  Project(
    name: 'AudiOn:Voice Recorder & Editor',
    description:
        'AudiOn, the cutting-edge Android voice recording app with lossless audio recording, background noise removal, equalization, reverb and other powerful audio editing features!',
    linkName: 'Check on Google PlayStore',
    linkImage: 'assets/utils/google_play.svg',
    link:
        'https://play.google.com/store/apps/details?id=com.globaldelight.audiorecorder',
    terms: "**Developed at Global Delight Technology; all rights reserved.",
  ),

  Project(
    name: 'Boom: Bass Booster & Equalizer',
    description:
        'The premium music player comprises a set of supreme features that will set out ultimate intensified effects as you get immersed in your music.',
    linkName: 'Check on Google PlayStore',
    linkImage: 'assets/utils/google_play.svg',
    link:
        'https://play.google.com/store/apps/details?id=com.globaldelight.boom',
    terms: "**Developed at Global Delight Technology; all rights reserved.",
  ),

  Project(
    name: 'Vizmato – Video editor & maker',
    description:
        'Vizmato is an easy to use movie maker, that lets you add filters, themes, music, effects and text to make your videos super cool. Share these videos or GIFs on Facebook, Instagram, YouTube, Whatsapp and within our community of over a million users!',
    linkName: 'Check on Google PlayStore',
    linkImage: 'assets/utils/google_play.svg',
    link:
        'https://play.google.com/store/apps/details?id=com.globaldelight.vizmato',
    terms: "**Developed at Global Delight Technology; all rights reserved.",
  ),

  Project(
    name: 'Shop A-Z Ecommerce App',
    description:
        'The Flutter application consists of two distinct modules: one designed for users to browse and purchase items, and the other for administrators to manage and upload product listings efficiently.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link:
        'https://play.google.com/store/apps/details?id=com.globaldelight.vizmato',
    terms: "** Individual project",
  ),

  Project(
    name: 'Notes',
    description:
        'A cloud-based note-making application built with Kotlin and Jetpack Compose on the frontend and Spring Boot on the backend, allowing users to create accounts, write notes, and securely store them online.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link:
        'https://play.google.com/store/apps/details?id=com.globaldelight.vizmato',
    terms: "** Individual project",
  ),

  Project(
    name: 'Newsy App',
    description:
        'A cloud-based news application that delivers the latest updates from the cloud, built using Clean Architecture and a Jetpack Compose (Kotlin) UI for a modern and intuitive experience.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link:
        'https://play.google.com/store/apps/details?id=com.globaldelight.vizmato',
    terms: "** Individual project",
  ),
];
