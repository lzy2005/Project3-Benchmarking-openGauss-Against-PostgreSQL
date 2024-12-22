su - omm
cd ../..
mkdir -p /dbs/pg14/data
mkdir -p /pg14/soft
chown -R postgres:postgres /dbs
chown -R postgres:postgres /pg14
chmod -R 775 /pg14
chmod -R 775 /dbs

dnf install -y perl-ExtUtils-Embed readline-devel python3-devel pam-devel libxml2-devel libxslt-devel openldap-devel lz4-devel llvm-devel systemd-devel container-selinux selinux-policy-devel openssl-devel clang-devel flex-devel bison-devel glibc-devel gcc-c++ gcc cmake lsof net-tools tar zlib-devel --allowerasing --skip-broken

cd pg14/soft
wget https://ftp.postgresql.org/pub/source/v14.11/postgresql-14.11.tar.gz
tar -zxvf postgresql-14.11.tar.gz
cd postgresql-14.11
./configure --prefix=/pg14/soft --without-readline
make && make install

vim ~/.bash_profile

i

export PGPORT=5666
export PGDATA=/dbs/pg14/data
export PGHOME=/pg14/soft
export PATH=$PGHOME/bin:$PATH:.

esc

:wq

source ~/.bash_profile

initdb
pg_ctl start -D $PGDATA
