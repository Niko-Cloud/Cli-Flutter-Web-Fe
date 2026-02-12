

import '../model/command_dto.dart';

final commandMockData = [
  CommandDto(
    id: 1,
    name: 'help',
    description: 'Displays available commands',
    usage: 'help [command]',
    helpText:
    'For more information on a specific command, type HELP command-name.',
  ),
  CommandDto(
    id: 2,
    name: 'whoami',
    description: 'Displays profile information',
    usage: 'whoami',
    helpText: 'Shows name, role, and description.',
  ),
  CommandDto(
    id: 3,
    name: 'skill',
    description: 'Lists technical skills',
    usage: 'skills',
    helpText: 'Displays a list of skills.',
  ),
  CommandDto(
    id: 4,
    name: 'education',
    description: 'Lists education history',
    usage: 'education',
    helpText: 'Displays education background.',
  ),
  CommandDto(
    id: 5,
    name: 'work',
    description: 'Lists work experience',
    usage: 'work [id]',
    helpText: 'Displays work experience history.',
  ),
  CommandDto(
    id: 6,
    name: 'showcase',
    description: 'Displays portfolio projects',
    usage: 'showcase [id]',
    helpText: 'Displays featured projects.',
  ),
];
