template "/usr/local/apache-tomcat-6.0.36/conf/server.xml" do
	source "server.xml.erb"
	mode 0755
end

template "/usr/local/apache-tomcat-6.0.36/webapps/j/WEB-INF/classes/logback.xml" do
	source "logback_j.xml.erb"
	mode 0755
end

template "/usr/local/apache-tomcat-6.0.36/webapps/push/WEB-INF/classes/logback.xml" do
        source "logback_push.xml.erb"
        mode 0755
end

template "/usr/local/apache/conf/httpd.conf" do
        source "httpd.conf.erb"
        mode 0755
end

template "/usr/local/apache/conf/extra/httpd-vhosts.conf" do
        source "httpd-vhosts.conf.erb"
        mode 0755
end


