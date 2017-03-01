#!/bin/bash
ls /dev/tty* > /tmp/1;
echo "Reset your Arduino Leonardo now";
while [[ -z $USB ]]; do
  sleep 1;
  ls /dev/tty* > /tmp/2;
  USB=`diff /tmp/1 /tmp/2 | grep -o '/dev/tty.*'`;
done;
echo DEV: $USB
DEV=$USB make program KEYMAP=default
