#!/usr/bin/env bash 
#This script bootstraps the attendance tracker project
read -p "Enter project version/name: " input
mkdir -p attendance_tracker_$input/Helpers
mkdir -p attendance_tracker_$input/reports
touch attendance_tracker_$input/attendance_checker.py
touch attendance_tracker_$input/Helpers/assets.csv
touch attendance_tracker_$input/Helpers/config.json
touch attendance_tracker_$input/reports/reports.log
