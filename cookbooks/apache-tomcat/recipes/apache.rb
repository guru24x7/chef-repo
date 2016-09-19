file "/usr/local/#{node[:apache_tomcat][:apache_src]}" do
        action :delete
end
# Update and install system and the development libraries
execute "Apache dependencies" do
	command "yum update -y"
	command "yum groupinstall 'Development Tools' -y && yum install -y gcc apr-devel apr-util-devel openssl-devel pcre-devel libxml2-devel libcurl-devel"
end
# Download and compile the apache
ruby_block "Install Apache" do
	block do
		require 'fileutils'
    		FileUtils.cd "/usr/local"
		system "wget #{node[:apache_tomcat][:apache_url]}"
		
		system "tar -xzf #{node[:apache_tomcat][:apache_src]}"

		FileUtils.cd "/usr/local/#{node[:apache_tomcat][:apache_unfold]}/srclib"
		system "wget #{node[:apache_tomcat][:apr_url]}"
                system "wget #{node[:apache_tomcat][:aprutil_url]}"
		system "tar -xzf #{node[:apache_tomcat][:apr_src]}"
                system "tar -xzf #{node[:apache_tomcat][:aprutil_src]}"

		system "mv #{node[:apache_tomcat][:apr_unfold]} apr"
		system "mv #{node[:apache_tomcat][:aprutil_unfold]} apr-util"
		
		FileUtils.cd "/usr/local/#{node[:apache][:apache_unfold]}"
		system "./configure \
			--prefix=/usr/local/apache \
			--with-apr=/usr/local/apr \
			--with-apr-util=/usr/local/apr/bin \
			--enable-cgi \
			--enable-info \
			--enable-speling \
			--enable-usertrack \
			--enable-deflate \
			--enable-ssl \
			--enable-proxy \
			--enable-proxy-connect \
			--enable-proxy-ftp \
			--enable-expires \
			--enable-headers \
			--enable-proxy-http \
			--enable-rewrite \
			--enable-so \
			--with-included-apr \
			--enable-proxy-fdpass
			"
		system "make && make install"
	end
	action :create
end

httpd_config="#{node[:apache][:apache_conf]}"
commented_line1 = /^#(LoadModule\sslotmem_shm_module\smodules\/mod_slotmem_shm\.so)\b/m
commented_line2 = /^#ServerName\swww\.example\.com:80/m
ruby_block "Uncommenting" do
	block do
		sed = Chef::Util::FileEdit.new(httpd_config)
		sed.search_file_replace(commented_line1, '\1')
		sed.search_file_replace(commented_line2, 'ServerName localhost')
		sed.write_file
	end
end

# Creating a startup file for apache
cookbook_file "/etc/init.d/apache2" do
  source "apache2"
  owner "root"
  group "root"
  mode 0755
  action :create_if_missing
end

# Enable apache to verify the startup options and start apache
service 'apache2' do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

template "/usr/local/apache/conf/httpd.conf" do
        source "httpd.conf.erb"
        mode 0644
end


template "/etc/hosts" do
        source "hosts.erb"
        mode 0644
end

