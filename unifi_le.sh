#!/bin/bash
#
# Lets Encrypt Import Script for Unifi Controller
# Version 1.0
# Last Updated Sept 3, 2018
# By Michael Tanner, inspired by Steve Jenkins
# For Ubuntu and Debian Users
#

printf "Please enter your domain name... without the http/s \n"

read domainname

certdir=/etc/letsencrypt/live/$domainname
keytooldir=/usr/bin #java keytool located in /usr/bin
keystoredir=/var/lib/unifi
#
printf "Stopping unifi service\n"
service unifi stop
printf "Exporting new key to pkcs12 format\n"
openssl pkcs12 -export -out $certdir/certificate.p12 -name unifi -inkey $certdir/privkey.pem -in $certdir/fullchain.pem -caname root -password pass:aircontrolenterprise 
printf "Backing up keystore\n"
cp $keystoredir/keystore $keystoredir/keystore-backup
printf "Importing new cert\n"
keytool -importkeystore -destkeystore $keystoredir/keystore -deststorepass aircontrolenterprise -destkeypass aircontrolenterprise -srckeystore $certdir/certificate.p12 -srcstoretype PKCS12 -srcstorepass aircontrolenterprise -noprompt -deststoretype pkcs12 
printf "\n"
printf "!!!NOTICE!!!\n"
printf "!!! If you get a key tool error above please ignore as it should still work... !!! \n"
printf "\n"
printf "Starting unifi service\n"
service unifi start
printf "Done!\n"
printf "Visit https://$domainname to see your SSL Cert in the flesh...\n"
open https://$domainname