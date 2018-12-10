
source ./eiffel-versions.bash

if [[ "${DOCKER_HOST}" ]];
then
  export HOST=$(echo ${DOCKER_HOST} | sed -e 's|^tcp\://||;s|:.*$||');
else
  export HOST=$(hostname -I | tr " " "\n"| head -1);
  echo "Docker Host IP: $HOST"
fi

export EI_FRONTEND_EI_INSTANCES_LIST="[\
{ \"contextPath\": \"\", \"port\": \"8090\", \"name\": \"eiffel-intelligence-artifact\", \"host\": \"eiffel-intelligence-artifact\", \"https\": false, \"defaultBackend\": true},\
{ \"contextPath\": \"\", \"port\": \"8090\", \"name\": \"eiffel-intelligence-sourcechange\", \"host\": \"eiffel-intelligence-sourcechange\", \"https\": false, \"defaultBackend\": false},\
{ \"contextPath\": \"\", \"port\": \"8090\", \"name\": \"eiffel-intelligence-testexecution\", \"host\": \"eiffel-intelligence-testexecution\", \"https\": false, \"defaultBackend\": false},\
{ \"contextPath\": \"\", \"port\": \"8090\", \"name\": \"eiffel-intelligence-allevents\", \"host\": \"eiffel-intelligence-allevents\", \"https\": false, \"defaultBackend\": false}\
]"

