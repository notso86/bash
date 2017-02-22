#!/bin/bash

ps -o comm,pid,ppid,user,time,etime,start,pcpu,state --sort=comm aH | grep '^COMMAND\|R$'

