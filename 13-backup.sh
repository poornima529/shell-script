#!/bin/bash


R="\e[31m"
G="\e[32m"
Y="\e[33m"
n="\e[0m"

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14} # if user is not providing number of days, we are taking 14 as default

LOGS_FOLDER="/var/log/shellscript-logs"
LOGS_FILE=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 ... $R FAILURE $N"
        exit 1
    else 
        echo -e "$2 ... $G SUCCESS $N"
    fi       
}  

USAGE(){
    echo -e "$R USAGE:: $N sh 13-backup.sh <SOURCE_DIR> <DEST_DIR> <DAYS(Optional)>"
}

if [ $# -lt 2 ]
then
    USAGE
fi 

echo "script started executing at: $TIMESTAMP" &>>$LOG_FILE_NAME