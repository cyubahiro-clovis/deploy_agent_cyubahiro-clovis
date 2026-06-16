# Attendance Tracker Project Bootstrapper

## Description
setup_project.sh automates the setup of a Student Attendance Tracker project. It creates the directory structure (folders and files), writes a config file with default thresholds (Warning 75, Failure 50) that the user can customize, validates that the input is numeric, checks that python3 is installed, and safely archives and cleans up the project if the user cancels.

## How to Run
1. Make the script executable: chmod +x setup_project.sh
2. Run it: ./setup_project.sh
3. The script will prompt you for:
   - A project name (for example: cohort1)
   - A new Warning threshold (default 75)
   - A new Failure threshold (default 50)
4. If you enter valid numbers, the config is updated with sed . If you enter non-numbers, the defaults are kept.
5. The script then checks whether python3 is installed and reports the result.

## How to Trigger the Archive Feature
To trigger the archive feature, press Ctrl+C while the script is running. The script catches the interrupt (SIGINT) using a trap, prints "Cancelled! Archiving and cleaning up...", bundles the incomplete project folder into a compressed archive named attendance_tracker_NAME_archive.tar.gz, and then deletes the incomplete folder to keep the workspace clean.
## Walkthrough Video
Video explanation and demo: https://www.loom.com/share/a03cc4ae65c24f3d8e90e659ae4ed6a5
