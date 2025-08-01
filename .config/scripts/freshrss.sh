set -xu

docker pull freshrss/freshrss

docker stop freshrss
docker rm freshrss

docker run -d --restart unless-stopped --log-opt max-size=10m \
  -p 127.0.0.1:10001:80 \
  -e TZ=Asia/Kolkata \
  -e 'CRON_MIN=1,31' \
  -v freshrss_data:/var/www/FreshRSS/data \
  -v freshrss_extensions:/var/www/FreshRSS/extensions \
  --name freshrss \
  freshrss/freshrss
