
SCRIPT=$(readlink -f $0)
SCRIPTPATH=`dirname $SCRIPT`
source ${SCRIPTPATH}/eiffel-versions.bash

export HOST=$(hostname -I | tr " " "\n"| head -1)
