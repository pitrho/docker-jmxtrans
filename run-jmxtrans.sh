#!/bin/bash
: ${LOG_DIR:="/var/log/jmxtrans"}
: ${LOG_FILE:="/var/log/jmxtrans/jmxtrans.log"}
: ${SECONDS_BETWEEN_RUNS:="60"}
: ${JSON_DIR:="/var/lib/jmxtrans"}
: ${JAVAJDK_BIN:="/usr/bin/java"}
: ${JAVA_OPTS:="-Djava.awt.headless=true -Djava.net.preferIPv4Stack=true"}
: ${HEAP_SIZE:="512"}
: ${PERM_SIZE:="384"}
: ${MAX_PERM_SIZE:="384"}
: ${JMX_PORT:="7199"}
: ${LOG_LEVEL:="info"}
: ${CONTINUE_ON_ERROR:="false"}
: ${JMXTRANS_OPTS:="-Djmxtrans.log.level=${LOG_LEVEL} -Djmxtrans.log.dir=$LOG_DIR"}


MONITOR_OPTS=${MONITOR_OPTS:="-Dcom.sun.management.jmxremote -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.authenticate=false -Dcom.sun.management.jmxremote.port=${JMX_PORT}  -Dcom.sun.management.jmxremote.rmi.port=${JMX_PORT} "}
GC_OPTS=${GC_OPTS:="-Xms${HEAP_SIZE}m -Xmx${HEAP_SIZE}m -XX:PermSize=${PERM_SIZE}m -XX:MaxPermSize=${MAX_PERM_SIZE}m"}
ADDITIONAL_JARS_OPTS=$(  [ -z $ADDITIONAL_JARS ] && echo "" || echo "-a $ADDITIONAL_JARS" )
JSON_FILES=$( [ -z $FILENAME ] && echo "-j $JSON_DIR" || echo "-f $FILENAME" )
EXEC=${EXEC:="com.googlecode.jmxtrans.JmxTransformer -e $JSON_FILES -s $SECONDS_BETWEEN_RUNS -c $CONTINUE_ON_ERROR $ADDITIONAL_JARS_OPTS"}


echo "starting jmxtrans ..." >> $LOG_FILE
echo $JAVAJDK_BIN -server $JAVA_OPTS $JMXTRANS_OPTS $GC_OPTS $MONITOR_OPTS $EXEC
exec $JAVAJDK_BIN -server $JAVA_OPTS $JMXTRANS_OPTS $GC_OPTS $MONITOR_OPTS $EXEC
