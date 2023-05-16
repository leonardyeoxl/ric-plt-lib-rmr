## Build with NNG support
1. mkdir build
2. cd build
3. cmake .. -DSKIP_EXTERNALS=0 -DPACK_EXTERNALS=1 -DBUILD_NNG=1
4. make

## Test Receiver Container
```sh
docker run -it -p 43086:43086 -v `pwd`/shared/:/app/shared/ -e RMR_SEED_RT=/app/shared/route_table.rt examples_rmr_receiver:latest
```

## Test Sender Container
```sh
docker run -it -p 4560:4560 -v `pwd`/examples/shared/:/app/shared/ -e RMR_SEED_RT=/app/shared/route_table_sender.rt examples_rmr_sender:latest
```

## List docker containers
```
$ docker ps -a
CONTAINER ID   IMAGE                    COMMAND                  CREATED         STATUS                    PORTS     NAMES
e3777b69b561   examples_rmr_sender      "./usr/local/bin/sen…"   6 minutes ago   Up 5 minutes                        examples_rmr_sender_1
4496574384d0   examples_rmr_receiver    "./usr/local/bin/rec…"   6 minutes ago   Up 5 minutes                        examples_rmr_receiver_1
```

## 
```
$ docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' examples_rmr_sender_1
172.21.0.3
```

## 
```
$ ip addr | grep 172.21.0.1
    inet 172.21.0.1/16 brd 172.21.255.255 scope global br-32d6efe94cfa
```

## CA
### Generate a private key
```
$ openssl genrsa -out ca.key 2048
Generating RSA private key, 2048 bit long modulus (2 primes)
...............................................................................+++++
..+++++
e is 65537 (0x010001)
```

#### Create a self-signed CA certificate
```
$ openssl req -new -x509 -days 3650 -key ca.key -out ca.crt
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:
Email Address []:
```

## Sender Certificate
### Generate a private key
```
$ openssl genrsa -out sender.key 2048
Generating RSA private key, 2048 bit long modulus (2 primes)
...........+++++
.+++++
e is 65537 (0x010001)
```

### Create a Certificate Signing Request (CSR)
```
$ openssl req -new -key sender.key -out sender.csr
You are about to be asked to enter information that will be incorporated
into your certificate request.
What you are about to enter is what is called a Distinguished Name or a DN.
There are quite a few fields but you can leave some blank
For some fields there will be a default value,
If you enter '.', the field will be left blank.
-----
Country Name (2 letter code) [AU]:
State or Province Name (full name) [Some-State]:
Locality Name (eg, city) []:
Organization Name (eg, company) [Internet Widgits Pty Ltd]:
Organizational Unit Name (eg, section) []:
Common Name (e.g. server FQDN or YOUR name) []:
Email Address []:

Please enter the following 'extra' attributes
to be sent with your certificate request
A challenge password []:
An optional company name []:
```

### Sign the sender CSR with CA
```
$ openssl x509 -req -in sender.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out sender.crt -days 365
Signature ok
subject=C = AU, ST = Some-State, O = Internet Widgits Pty Ltd
Getting CA Private Key
```