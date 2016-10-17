larry1123/socket-to-port
=======

This was made to be able to export a docker unix socket to an tsl port.  
It's intended use is for use on systems like unRAID where you do not have direct control over the docker daemon.

It can be reused for other things.

Just set your port mappings to have it map to the host port of your liking.

You must add the socket you want to proxy as a volume to `/opt/socat/socket.socket`.

You must provide `server.pem` and `ca.crt` in `/opt/socat/.ssh/`.

For extra info about socat ssl setup.  
http://www.dest-unreach.org/socat/doc/socat-openssltunnel.html

License
-------------
http://www.apache.org/licenses/LICENSE-2.0.html
