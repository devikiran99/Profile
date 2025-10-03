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
    name: 'NoteApp',
    description:
        'A cloud-based note-making application built with Kotlin and Jetpack Compose on the frontend and Spring Boot on the backend, allowing users to create accounts, write notes, and securely store them online.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link: 'https://github.com/devikiran99/NoteApp',
    terms: "** Individual project",
  ),


  Project(
    name: 'ProfileApp',
    description:
    'My profile mobile and web application, built with Flutter, showcases my personal and professional information including my background, skills, and achievements. Optimized for seamless access across devices, it makes it easy for others to connect with me anytime.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link: 'https://github.com/devikiran99/Profile',
    terms: "** Individual project",
  ),

  Project(
    name: 'ShopA2Z',
    description:
    'The Flutter application consists of two distinct modules: one designed for users to browse and purchase items, and the other for administrators to manage and upload product listings efficiently.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link: 'https://github.com/devikiran99/ShopA2Z',
    terms: "** Individual project",
  ),

  Project(
    name: 'NewsApp',
    description:
        'A cloud-based news application that delivers the latest updates from the cloud, built using Clean Architecture and a Jetpack Compose (Kotlin) UI for a modern and intuitive experience.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link: 'https://github.com/devikiran99/NewsApp',
    terms: "** Individual project",
  ),

  Project(
    name: 'EarthquakeApp',
    description:
    'Flutter application displays recently occurred earthquake data by integrating the USGS Earthquake API. Users can easily filter the information based on the date of occurrence for quick and accurate insights.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link: 'https://github.com/devikiran99/EarthquakeApp',
    terms: "** Individual project",
  ),

  Project(
    name: 'WordHurdle',
    description:
    'Flutter application is a simple and fun Word Hurdle game that challenges players to guess words within limited attempts. It offers an engaging way to test vocabulary and problem-solving skills while keeping gameplay light and enjoyable.',
    linkName: 'Check on Github',
    linkImage: 'assets/images/skills/github.svg',
    link: 'https://github.com/devikiran99/WordHurdle',
    terms: "** Individual project",
  ),
];
