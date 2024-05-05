#!/bin/bash

if [ "$WILDFLY_MODE" = "standalone" ]; then
  ${JBOSS_HOME}/bin/standalone.sh -b 0.0.0.0 -bmanagement 0.0.0.0
elif [ "$WILDFLY_MODE" = "domain" ]; then
  ${JBOSS_HOME}/bin/domain.sh -b 0.0.0.0 -bmanagement 0.0.0.0
else
  echo "Unsupported WILDFLY_MODE: $WILDFLY_MODE"
  exit 1
fi