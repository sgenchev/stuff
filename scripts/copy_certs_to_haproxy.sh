#!/bin/bash
#
certs_dir='/data/certs'
haproxy_certs='/data/etc/haproxy/certs'

copy_cert_to_haproxy () {
  certname=`basename $1`
  cat ${1}/fullchain.cer ${1}/${certname}.key >$haproxy_certs/$certname
}
for cert in `find ${certs_dir}/* -maxdepth 0 -type d -name *genchev.us`; do 
  copy_cert_to_haproxy $cert
done
