# Apache Constants
default[:apache][:apache_url]='http://archive.apache.org/dist/httpd/httpd-2.4.10.tar.gz'
#default[:apache][:apache_url]='http://192.168.79.1/sources/httpd-2.4.10.tar.gz'
default[:apache][:apache_src]='httpd-2.4.10.tar.gz'
default[:apache][:apache_unfold]='httpd-2.4.10'
default[:apache][:apache_conf]='/usr/local/apache/conf/httpd.conf'
default[:apache][:apache_mime]='/usr/local/apache/conf/mime.types'
default[:apache][:apache_wwwroot]='/usr/local/apache/htdocs'
default[:apache][:timezone]='UTC'

# Apr Constants
default[:apache][:apr_url]='http://archive.apache.org/dist/apr/apr-1.5.1.tar.gz'
#default[:apache][:apr_url]='http://192.168.79.1/sources/apr-1.5.1.tar.gz'
default[:apache][:apr_src]='apr-1.5.1.tar.gz'
default[:apache][:apr_unfold]='apr-1.5.1'

# Apr-Utils Constants
default[:apache][:aprutil_url]='http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.gz'
#default[:apache][:aprutil_url]='http://192.168.79.1/sources/apr-util-1.5.4.tar.gz'
default[:apache][:aprutil_src]='apr-util-1.5.4.tar.gz'
default[:apache][:aprutil_unfold]='apr-util-1.5.4'

# PHP Constants
default[:apache][:php_url]='http://php.net/distributions/php-5.5.14.tar.gz'
#default[:apache][:php_url]='http://192.168.79.1/sources/php-5.5.14.tar.gz'
default[:apache][:php_src]='php-5.5.14.tar.gz'
default[:apache][:php_unfold]='php-5.5.14'
default[:apache][:phptz]=''

# Tomcat Constants
default[:apache][:tomcat_url]='http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.36/bin/apache-tomcat-6.0.36.tar.gz'
#default[:apache_tomcat][:tomcat_url]='http://192.168.79.1/sources/apache-tomcat-6.0.36.tar.gz'
default[:apache][:tomcat_src]='apache-tomcat-6.0.36.tar.gz'
default[:apache][:tomcat_unfold]='apache-tomcat-6.0.36'

# Java Constants
default[:apache][:java_url]='http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz'
#default[:apache][:java_url]='http://192.168.79.1/sources/jdk-7u79-linux-x64.tar.gz'
default[:apache][:java_src]='jdk-7u79-linux-x64.tar.gz'
default[:apache][:java_unfold]='jdk1.7.0_79'

