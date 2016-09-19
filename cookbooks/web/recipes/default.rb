#
# Cookbook Name:: web
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
include_recipe "apt"

package "apache2" do
	action :install	
end

service "apache2" do
	action [:enable, :start]
end

template "/var/www/html/index.html" do
	source "index.html.erb"
	mode "0644"
end
