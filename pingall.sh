#!/bin/bash

nmap -sP 192.168.1.0/24
arp -a | grep -vi incomplete

