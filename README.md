# 🧱 Project 1: Linux Server Automation

## 🔹 Project Overview
Automated maintenance system tailor-made for **Amazon Linux** instances on **AWS EC2**. It handles resource monitoring, log rotation, and service health reporting automatically.

### Core Features:
- **Disk Usage Monitor**: Root partition health check.
- **Memory & CPU Profiler**: Real-time AWS instance resource tracking.
- **Log Management**: Auto-deletes logs older than 7 days.
- **Service Health Check**: Reports failed system services (`systemctl`).
- **Automated Reporting**: Generates timestamped logs.

---

## 🛠️ Tools & Technologies
- **Platform**: AWS EC2
- **OS**: Amazon Linux 2 / 2023
- **Language**: Bash Scripting
- **Automation**: Cron Jobs
- **Utilities**: `df`, `free`, `top`, `find`, `systemctl`

---

## 🚀 Getting Started

### 1. Execution
Run manually on your EC2 instance:
```bash
chmod +x LinuxServerAutomation.sh
sudo ./LinuxServerAutomation.sh
```

### 2. Log File Location
Report saved at:
`/var/log/server_maintenance_report.log`

---

## ⏰ Automation (Cron Job)
To automate daily at 12:00 AM:

1. Open crontab:
   ```bash
   sudo crontab -e
   ```
2. Add:
   ```bash
   0 0 * * * /home/ec2-user/LinuxServerAutomation.sh
   ```


