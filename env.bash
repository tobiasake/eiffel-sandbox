
source ./eiffel-versions.bash

if [[ "${DOCKER_HOST}" ]];
then
  export HOST=$(echo ${DOCKER_HOST} | sed -e 's|^tcp\://||;s|:.*$||');
else
  export HOST=$(hostname -I | tr " " "\n"| head -1);
fi
