export APPD_NODE_NAME=`awk -F/ '{ print $NF }' /proc/1/cpuset | cut -c -12`
sed -i "s/Flask1/$APPD_NODE_NAME/g" appdynamics.cfg

pyagent run -c appdynamics.cfg -- gunicorn -w 4 -b 0.0.0.0:5000 app:app

