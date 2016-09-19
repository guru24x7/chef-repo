file "/usr/local/#{node[:apache_tomcat][:apache_src]}" do
	action :delete
end


file "/usr/local/#{node[:apache_tomcat][:php_src]}" do
        action :delete
end

