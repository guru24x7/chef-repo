# default[:apache_tomcat][:java_url]='http://download.oracle.com/otn-pub/java/jdk/7u79-b15/jdk-7u79-linux-x64.tar.gz'
default[:apache_tomcat][:java_url]='http://192.168.79.1/sources/jdk-7u79-linux-x64.tar.gz'
default[:apache_tomcat][:java_src]='jdk-7u79-linux-x64.tar.gz'
default[:apache_tomcat][:java_unfold]='jdk1.7.0_79'

###################################################

# default[:apache_tomcat][:tomcat_url]='http://archive.apache.org/dist/tomcat/tomcat-6/v6.0.36/bin/apache-tomcat-6.0.36.tar.gz'
default[:apache_tomcat][:tomcat_url]='http://192.168.79.1/sources/apache-tomcat-6.0.36.tar.gz'
default[:apache_tomcat][:tomcat_src]='apache-tomcat-6.0.36.tar.gz'
default[:apache_tomcat][:tomcat_unfold]='apache-tomcat-6.0.36'

############################################################

# default[:apache_tomcat][:apache_url]='http://archive.apache.org/dist/httpd/httpd-2.4.10.tar.gz'
default[:apache_tomcat][:apache_url]='http://192.168.79.1/sources/httpd-2.4.10.tar.gz'
default[:apache_tomcat][:apache_src]='httpd-2.4.10.tar.gz'
default[:apache_tomcat][:apache_unfold]='httpd-2.4.10'
default[:apache_tomcat][:apache_conf]='/usr/local/apache/conf/httpd.conf'
default[:apache_tomcat][:apache_mime]='/usr/local/apache/conf/mime.types'
default[:apache_tomcat][:apache_wwwroot]='/usr/local/apache/htdocs'
default[:apache_tomcat][:timezone]='UTC'
#####################################################

# default[:apache_tomcat][:apr_url]='http://archive.apache.org/dist/apr/apr-1.5.1.tar.gz'
default[:apache_tomcat][:apr_url]='http://192.168.79.1/sources/apr-1.5.1.tar.gz'
default[:apache_tomcat][:apr_src]='apr-1.5.1.tar.gz'
default[:apache_tomcat][:apr_unfold]='apr-1.5.1'

#####################################################

# default[:apache_tomcat][:aprutil_url]='http://archive.apache.org/dist/apr/apr-util-1.5.4.tar.gz'
default[:apache_tomcat][:aprutil_url]='http://192.168.79.1/sources/apr-util-1.5.4.tar.gz'
default[:apache_tomcat][:aprutil_src]='apr-util-1.5.4.tar.gz'
default[:apache_tomcat][:aprutil_unfold]='apr-util-1.5.4'

########################################################

#default[:apache_tomcat][:php_url]='http://php.net/distributions/php-5.5.14.tar.gz'
default[:apache_tomcat][:php_url]='http://192.168.79.1/sources/php-5.5.14.tar.gz'
default[:apache_tomcat][:php_src]='php-5.5.14.tar.gz'
default[:apache_tomcat][:php_unfold]='php-5.5.14'

########################################################

default[:apache_tomcat][:rhel6_url]='http://192.168.79.1/sources/rhel-server-6.5-x86_64-dvd.iso'
default[:apache_tomcat][:rhel6_iso]='rhel-server-6.5-x86_64-dvd.iso'
