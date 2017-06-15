#!/bin/bash
HOST=git.trading.imc.intra
PID=`ps ax|grep "ssh -fMNn $HOST"|grep -v grep|sed -e 's/^ *//'|cut -d ' ' -f 1`
if [ "$PID" != '' ]; then kill $PID; fi
rm -f ~/.ssh/cm_$HOST
ssh -fMNn $HOST
