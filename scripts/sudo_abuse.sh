#!/bin/bash
# T1548 - Sudo Privilege Escalation simulation
for i in {1..6}; do sudo -u fakeuser whoami; done
