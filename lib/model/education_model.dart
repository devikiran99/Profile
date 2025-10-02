class EducationModel {
  final String name;
  final String institutionName;
  final String score;
  final String duration;
  final String status;
  final String imgSrc;

  EducationModel({
    required this.name,
    required this.institutionName,
    required this.score,
    required this.duration,
    required this.status,
    required this.imgSrc,
  });
}

List<EducationModel> educationList = [
  EducationModel(
    name: 'Masters Of Computer Application',
    institutionName: 'Nitte Mahalinga Adyantaya Memorial Institute of Technology (NMAMIT), Nitte, Karnataka',
    score: 'CGPA: 9.32 ',
    duration: '2022',
    status: 'Completed',
    imgSrc: 'assets/images/institution/nmamit_nitte_logo.png'
  ),

  EducationModel(
      name: 'Bachelors Of Computer Applications',
      institutionName: 'Vivekananda Degree College, Puttur, Karnataka',
      score: 'CGPA: 9.32 ',
      duration: '2020',
      status: 'Completed',
      imgSrc: 'assets/images/institution/vc_puttur_logo.png'
  ),

  EducationModel(
      name: 'PUE Commerce',
      institutionName: 'Karnataka Pre University Education Board| KPUEB',
      score: '89 %',
      duration: '2017',
      status: 'Completed',
      imgSrc: 'assets/images/institution/kseb_logo.jpg'
  )
];
