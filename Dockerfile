FROM ubuntu:latest

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/hello-cron

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/hello-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

#Install Cron
RUN apt-get update
RUN apt-get -y install cron ffmpeg pip

RUN pip install yt-dlp spotdl

WORKDIR /app
ADD work.sh /app
RUN chmod 777 /app/work.sh

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log