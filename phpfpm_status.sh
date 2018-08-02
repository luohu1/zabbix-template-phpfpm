#!/bin/bash
# Monitor phpfpm by zabbix
#
response="curl -s http://127.0.0.1/phpfpm_status"

case $1 in
    startSince)
        $response | awk '/^start since:/{print $NF}'
        ;;
    acceptedConn)
        $response | awk '/^accepted conn:/{print $NF}'
        ;;
    listenQueue)
        $response | awk '/^listen queue:/{print $NF}'
        ;;
    maxListenQueue)
        $response | awk '/^max listen queue:/{print $NF}'
        ;;
    listenQueueLen)
        $response | awk '/^listen queue len:/{print $NF}'
        ;;
    idleProcesses)
        $response | awk '/^idle processes:/{print $NF}'
        ;;
    activeProcesses)
        $response | awk '/^active processes:/{print $NF}'
        ;;
    totalProcesses)
        $response | awk '/^total processes:/{print $NF}'
        ;;
    maxActiveProcesses)
        $response | awk '/^max active processes:/{print $NF}'
        ;;
    maxChildrenReached)
        $response | awk '/^max children reached:/{print $NF}'
        ;;
    slowRequests)
        $response | awk '/^slow requests:/{print $NF}'
        ;;
    *)
        echo -e "\e[031mUsage: $0 {startSince|acceptedConn|listenQueue|maxListenQueue|listenQueueLen|idleProcesses|activeProcesses|totalProcesses|maxActiveProcesses|maxChildrenReached|slowRequests}\e[0m"
        exit 1
esac