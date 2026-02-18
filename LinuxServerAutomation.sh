#!/bin/bash


DATE=$(date +"%Y-%m-%d %H:%M:%S")
REPORT_FILE="/var/log/server_maintenance_report.log"

echo "===================================================" >> "$REPORT_FILE"
echo " SERVER MAINTENANCE REPORT - $DATE" >> "$REPORT_FILE"
echo "===================================================" >> "$REPORT_FILE"



echo "===== DISK USAGE =====" >> "$REPORT_FILE"
DISK_USAGE=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')
df -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "---------------------------------------------------" >> "$REPORT_FILE"

echo "===== MEMORY USAGE =====" >> "$REPORT_FILE"
free -h >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "---------------------------------------------------" >> "$REPORT_FILE"

echo "===== CLEANING LOGS =====" >> "$REPORT_FILE"
echo "Deleting logs older than 7 days..." >> "$REPORT_FILE"
find /var/log -type f -name "*.log" -mtime +7 -exec rm -f {} \;
echo "" >> "$REPORT_FILE"

echo "===== FAILED SERVICES =====" >> "$REPORT_FILE"
systemctl --failed >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "===================================================" >> "$REPORT_FILE"
echo " Maintenance completed successfully." >> "$REPORT_FILE"
echo "===================================================" >> "$REPORT_FILE"
echo "" >> "$REPORT_FILE"

echo "Report saved to path:" >> "$REPORT_FILE"
pwd >> "$REPORT_FILE"
echo "$REPORT_FILE" >> "$REPORT_FILE"