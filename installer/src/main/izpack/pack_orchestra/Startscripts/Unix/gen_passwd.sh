#!/bin/sh

. ./orchestra_env.sh

CP="$ORC_HOME_WEBINF/classes:$ORC_HOME_WEBINF/lib/*"

$ORC_JAVA_EXEC -showversion -cp "$CP" emds.epi.impl.security.TwoWayPassword $@
