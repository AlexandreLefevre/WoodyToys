
$TTL 604800
$ORIGIN wt2-7.ephec-ti.be.
@               IN      SOA     ns1.wt2-7.ephec-ti.be. admin.wt2-7.ephec-ti.be. (
                                        2001062501 ;serial
                                        3600       ;refresh
                                        700        ;retry
                                        1209600    ;expire
                                        3600 )     ;minimum


wt2-7.ephec-ti.be.                      IN      NS              ns1.wt2-7.ephec-ti.be.
                                        IN      MX      10      mail.wt2-7.ephec-ti.be.

ns1                                     IN      A               51.178.41.9
#WEB
www                                     IN      A               51.178.41.9
b2b                                     IN      CNAME           www
intranet                                IN      CNAME           www

#MAIL
mail                                    IN      A               51.178.41.98
smtp                                    IN      CNAME           mail
pop3                                    IN      CNAME           mail
imap                                    IN      CNAME           mail


#VOIP
sip.wt2-7.ephec-ti.be.   IN      A       51.178.41.32
_sip._udp               IN SRV 0 0 5060 sip.wt2-7.ephec-ti.be.
_sip._tcp               IN SRV 0 0 5060 sip.wt2-7.ephec-ti.be.
