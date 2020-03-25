;
;BIND File
;

$TTL 1d
$ORIGIN wt14.ephec-ti.be.
@       1D      IN      SOA     ns1.wt7.ephec-ti.be. root.wt7.ephec-ti.be. (
                                1       ; serial
                                3H      ; refresh
                                15      ; retry
                                1w      ; expire
                                3h)     ;

;NS RECORDS
@       IN      NS              ns1.wt7.ephec-ti.be.           ;Utilisé pour définir quels serveurs répondent pour cette zone.
        IN      MX      10      mail.wt7.ephec-ti.be.
        IN      TXT      "v=spf1 a mx ip4:51.178.41.9 include:_spf.google.com ~all"
;Records
ns1     IN      A       51.178.41.9                    ; Cet enregistrement fait correspondre une adresse IP à un nom de machine.
        IN      AAAA    2001:41d0:0304:0200:0000:0000:0000:010c


;Configuration WEB

web             IN      A       51.178.41.9 ; VPS - TIMOTHY GILLES
web             IN      AAAA    2001:41d0:0304:0200:0000:0000:0000:010c
www             IN      CNAME   web
b2b             IN      CNAME   web

;configuration MAIL

mail            IN      A       51.178.41.9
mail            IN      AAAA    2001:41d0:0304:0200:0000:0000:0000:010c
smtp            IN      CNAME   mail
pop3            IN      CNAME   mail
imap            IN      CNAME   mail
default._domainkey      IN      TXT     ( "v=DKIM1; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAtZsCvhpDGxc/27EoW/QAbFEkKSSNcT2FUHoN5mpLpQGCSnHSCMPJSDOS26dDIYJ4+QYLJ+YiH7N5w3LsgBxDFNphn4p0DFppYHjeW0wkd5fY4Z7dLdhTmplAmQ+lK65Xh+KJCVMYYAABae9v1uLK/M7PH5L9RbCXn7FsmVuamaSwYT+ECkcI4BvqzLVGQnt9R+W1PXBGZ715/l"
          "A8/8BBzxVMARDkDFHGJQ1eSsFMqI12ZMiQDuSOdOgnqNlRHyMjQhmzv1DdWWFnmXX1XLuAII9D+JAhlqahTX0dPiQd7tvqmgxQ0LDxriBoR/duk/hUibdXvzcty8IOWSdJtcyNJQIDAQAB" )  ; ----- DKIM key default for wt14.ephec-ti.be
_dmarc          IN      TXT     ( "v=DMARC1; p=none; pct=100; fo=1; rua=mailto:dmarck-reports@wt14.ephec-ti.be")



;Serveur sip
sip.wt14.ephec-ti.be.   IN      A       51.178.41.9
sip.wt14.ephec-ti.be.   IN      AAAA    2001:41d0:0304:0200:0000:0000:0000:010c
_sip._udp               IN SRV 0 0 5060 sip.wt7.ephec-ti.be.
_sip._tcp               IN SRV 0 0 5060 sip.wt7.ephec-ti.be.

$INCLUDE /etc/bind/Kwt7.ephec-ti.be.+008+44655.key
$INCLUDE /etc/bind/Kwt7.ephec-ti.be.+008+45862.key
$INCLUDE /etc/bind/db.wt7.ephec-ti.be.signed
