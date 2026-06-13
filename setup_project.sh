#!/usr/bin/env bash
#This script bootstraps the attendance tracker project
read -p "Enter project version/name: " input
trap 'echo "Cancelled! Archiving and cleaning up..."; tar -czf "attendance_tracker_${input}_archive.tar.gz" "attendance_tracker_$input"; rm -rf "attendance_tracker_$input"; exit' SIGINT
if [ -d "attendance_tracker_$input" ]; then
echo "Error: Project attendance_tracker_$input already exists!"
exit 1
fi
mkdir -p attendance_tracker_$input/Helpers
mkdir -p attendance_tracker_$input/reports
touch attendance_tracker_$input/attendance_checker.py
touch attendance_tracker_$input/Helpers/assets.csv
cat > attendance_tracker_$input/Helpers/config.json << 'EOF'
{
    "thresholds": {
        "warning": 75,
        "failure": 50
    },
    "run_mode": "live",
    "total_sessions": 15
}
EOF
touch attendance_tracker_$input/reports/reports.log
read -p "Enter new Warning threshold (default 75): " warning
read -p "Enter new failure threshold (default 50): " failure
if [[ "$warning" =~ ^[0-9]+$ ]]; then
sed -i "s/\"warning\": 75/\"warning\": $warning/" attendance_tracker_$input/Helpers/config.json
else
echo "Warning value is not a number. Keeping default (75)."
fi
if [[ "$failure" =~ ^[0-9]+$ ]]; then
sed -i "s/\"failure\": 50/\"failure\": $failure/" attendance_tracker_$input/Helpers/config.json
else
echo "Failure value is not a number. Keeping default (50)."
fi
if python3 --version; then
echo "python3 is installed."
else
echo "Failed: Python3 is not installed."
fi
