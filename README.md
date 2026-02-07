# Bash Backup Script

A simple Bash script to back up a local Drupal project, with logging of all operations.

---

## 📝 Description

The script copies the contents of the source directory (`SOURCE_DIR`) to the backup directory (`BACKUP_DIR`) using `rsync`.  
It preserves permissions, timestamps, and creates a mirrored copy of the files.  
All operations are logged in a log file (`backups.log`).

---

## ⚙️ Configuration

Edit the variables at the top of the script:

```bash
SOURCE_DIR="/path/to/project"
BACKUP_DIR="/path/to/backup/project"
LOG_DIR="/path/to/backup/logs"
LOG_FILE="${LOG_DIR}/backups.log"
