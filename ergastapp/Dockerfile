FROM biennt/ergast-f1-api_01
RUN rm -rf /var/www/html/*
COPY ergast /var/www/html/ergast/
COPY config.json /
COPY start_unit.sh /
CMD /start_unit.sh
