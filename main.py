import schedule
import subprocess

def job():
    subprocess.call(["spotdl", "--output=./songs/{title} - {artist}.{output-ext}", "https://open.spotify.com/playlist/7JtJzE3b8dtSDRvzC5lGfj"])

schedule.every().day.at("13:13").do(job)
# schedule.every(3).minutes.do(job)

job()
while True:
    schedule.run_pending()
