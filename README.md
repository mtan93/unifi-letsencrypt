# unifi-letsencrypt
Scripts to allow easy import of LE certs into keystore for Unifi on Ubuntu/Debian after use of certbot.

<p>Script was designed to avoid:</p>
<pre>Warning:
The JKS keystore uses a proprietary format. It is recommended to migrate to PKCS12 which is an industry standard format using "keytool -importkeystore -srckeystore /var/lib/unifi/keystore -destkeystore /var/lib/unifi/keystore -deststoretype pkcs12".</pre>
<p>after running certbot (Please make sure that your certs were placed in /etc/letsencrypt/live/yourdomain.name/ and not&nbsp;<span>/etc/letsencrypt/live/yourdomain.name-0001,2,3,etc/.</span></p>
<p>&nbsp;</p>
<p>Paste into terminal/ssh:</p>
<p>&nbsp;</p>
<pre>wget&nbsp;https://raw.githubusercontent.com/mtan93/unifi-letsencrypt/master/unifi_le.sh&nbsp;&amp;&amp; chmod +x unifi_le.sh &amp;&amp; ./unifi_le.sh
</pre>
<p>&nbsp;</p>
<p><span>Then simply enter your domain name (without http/s) when asked to do so and the script will do the rest for you :)</span></p>
