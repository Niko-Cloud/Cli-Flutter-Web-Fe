
import '../model/work_experience_dto.dart';

final workExperienceMockData = [
  WorkExperienceDto(
    id: 1,
    company: 'CIMB Niaga',
    position: 'Software Engineer',
    startDate: DateTime.parse('2024-02-01T00:00:00Z'),
    endDate: DateTime.parse('4712-01-01T00:00:00Z'),
    description: const [
      'Developed and maintained microservice-based applications using Java Spring Boot in an Agile environment.',
      'Completed required sprint points faster than average, allowing extra capacity to support teammates in debugging and feature improvements.',
      'Participated in sprint planning and reviews, delivering features on time for internal applications.',
    ],
    techStack: const ['Java', 'React', 'Flutter'],
  ),
  WorkExperienceDto(
    id: 2,
    company: 'PT CAZH Indonesia',
    position: 'Internship',
    startDate: DateTime.parse('2023-08-01T00:00:00Z'),
    endDate: DateTime.parse('2023-12-12T00:00:00Z'),
    description: const [
      'Helped develop a partner management system using Laravel and PostgreSQL.',
      'Worked with the development team to deliver key features and UI components.',
      'Assisted in testing and bug fixing, reducing QA issues.',
    ],
    techStack: const ['Laravel'],
  ),
  WorkExperienceDto(
    id: 3,
    company: 'Bangkit',
    position: 'Bangkit Cohort Android Development',
    startDate: DateTime.parse('2023-02-01T00:00:00Z'),
    endDate: DateTime.parse('2023-01-05T00:00:00Z'),
    description: const [
      'Built a mobile application to scan gym equipment using Kotlin, MVVM, and REST APIs.',
      'Integrated ML image recognition and supported backend setup using ExpressJS and PostgreSQL.',
    ],
    techStack: const ['Kotlin', 'Flutter'],
  ),
  WorkExperienceDto(
    id: 4,
    company: 'Diponegoro University',
    position: 'Practicum Assistant',
    startDate: DateTime.parse('2023-02-01T00:00:00Z'),
    endDate: DateTime.parse('2023-01-06T00:00:00Z'),
    description: const [
      'Assisted in teaching SQL Databases, Algorithm Strategy, and Computer Networking courses',
      'Supported students during lab sessions and helped evaluate assignments and practical work',
    ],
    techStack: const ['Communication', 'Teamwork'],
  ),
];
