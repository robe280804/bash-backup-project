#!/bin/bash

# -- Configuration --
SOURCE_DIR="/home/roberto-dev/my-drupal-project"
BACKUP_DIR="/home/roberto-dev/backup/drupal-poject"
LOG_DIR="/home/roberto-dev/backup/logs"
LOG_FILE="${LOG_DIR}/backups.log"
DATE=$(date +"%Y-%m-%d %T")

# -- Scritp --
mkdir -p "${BACKUP_DIR}"
mkdir -p "${LOG_DIR}" && touch "${LOG_FILE}"

echo "------------------------" >> "$LOG_FILE"
echo "${DATE}: Backup process started" >> "$LOG_FILE"

# rsync = copy only what changed in file
# a = archive modality
# v = show details about what's doing
# z = compress data
# --delete = delete file that doesn't exists anymore in resources
# 2>&1 = show also error from stderr in backups.log
rsync -avz --delete "$SOURCE_DIR/" "$BACKUP_DIR/" >> "$LOG_FILE" 2>&1

# -- Check rsync status --
if [ $? -eq 0 ]; then
	echo "$DATE: Backup completed successfully." >> "$LOG_FILE"
else
	echo "$DATE: Backup FAILED. Check rsync error above" >> "$LOG_FILE"
fi
