FROM ubuntu:latest

RUN apt-get update -y && apt-get install -y python-pip python-dev curl build-essential
RUN pip install flask==0.10.1 python-consul appdynamics==4.5.0.0 gunicorn

#Add in Application
ADD /admin.py /app/admin.py
ADD /app.py /app/app.py
ADD /static /app/static
ADD /templates /app/templates
ADD /gunicorn.conf /app/gunicorn.conf
ADD /logging.conf /app/logging.conf

#ADD Appdynamics config and start script that will set environment
ADD /appd/start.sh /app/start.sh
ADD /appd/appdynamics.cfg /app/appdynamics.cfg

WORKDIR /app

HEALTHCHECK CMD curl --fail http://localhost:5000/health || exit 1

EXPOSE 5000
EXPOSE 9000
#CMD python app.py & python admin.py
#CMD pyagent run -- gunicorn -w 4 -b 0.0.0.0:5000 app:app
# & gunicorn -w 4 -b 0.0.0.0:9000 admin:app
# RUN export APPD_NODE_NAME=`awk -F/ '{ print $NF }' /proc/1/cpuset`
#CMD pyagent run -- gunicorn -w 4 -b 0.0.0.0:5000 app:app
RUN chmod +x /app/start.sh
CMD /app/start.sh
