#!/bin/bash
tput setaf 7;echo 'Burp Certificate from DER to PEM'
openssl x509 -inform DER -in burp.der -out burp.pem

tput setaf 7;echo 'Rename the certificate using the subject hash'
tput setaf 4;openssl x509 -inform PEM -subject_hash_old -in burp.pem | head -1
cp burp.pem 9a5ba575.0

tput setaf 7;echo 'Certificate output'
tput setaf 4;ls -la

tput setaf 7;echo 'Listing devices'
tput setaf 4;adb devices
adb root

tput setaf 7; echo 'ADB as root'
tput setaf 4;adb shell 'whoami'

tput setaf 7; echo 'Pushing Burp certificate'
adb remount
adb push 9a5ba575.0 /etc/security/cacerts/9a5ba575.0

tput setaf 7; echo 'Change permissions'
adb shell 'chmod 644 /etc/security/cacerts/9a5ba575.0'
tput setaf 4;adb shell 'ls -la /etc/security/cacerts/'

tput setaf 7; echo 'ADB Unroot'
adb unroot
tput setaf 4;adb shell 'whoami'
