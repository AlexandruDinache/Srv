#!/bin/sh
#Telegram notify ssh logins
#in /etc/pam.d/sshd add "session optional pam_exec.so seteuid PATH_TO_SCRIPT/login-notify-ssh.sh"

telegram_bot_api="YOUR_TELEGRAM_BOT"
telegram_chat_id="YOUR_CHAT_ID"
URL="https://api.telegram.org/bot$telegram_bot_api/sendMessage"

if [ "$PAM_TYPE" != "close_session" ]; then
    host="`hostname`"
    subject="SSH Login: $PAM_USER from $PAM_RHOST on $host"
    curl -s -X POST $URL -d chat_id=$telegram_chat_id -d text="$subject"
fi
