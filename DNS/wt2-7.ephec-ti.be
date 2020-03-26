$TTL 604800
$ORIGIN wt2-7.ephec-ti.be.
@               IN      SOA     ns1.wt2-7.ephec-ti.be. admin.wt2-7.ephec-ti.be. (
                                        2001062501 ;serial
                                        3600       ;refresh
                                        700        ;retry
                                        1209600    ;expire
                                        3600 )     ;minimum


wt2-7.ephec-ti.be.                      IN      NS              ns1.wt2-7.ephec-ti.be.

ns1                                     IN      A               51.178.41.9
www                                     IN      A               51.178.41.9
b2b                                     IN      CNAME           www
intranet                                IN      CNAME           www
