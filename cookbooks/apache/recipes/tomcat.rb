file "/usr/local/#{node[:apache][:tomcat_src]}" do
  action :delete
end
# Download and extract the tomcat
ruby_block "Install Tomcat" do
        block do
                require 'fileutils'
                FileUtils.cd "/usr/local"
                system "wget #{node[:apache][:tomcat_url]}"
                system "tar -xzf #{node[:apache][:tomcat_src]}"
        end
        action :create
end

# Creating a startup file for tomcat
cookbook_file "/etc/init.d/tomcat6" do
  source "tomcat6"
  owner "root"
  group "root"
  mode 0755
  action :create_if_missing
end

# Enable tomcat to verify the startup options and start tomcat
service 'tomcat6' do
  supports :status => true, :start => true, :stop => true, :restart => true
  action [:enable, :start]
end

# Replace server.xml by the template
template "/usr/local/#{node[:apache][:tomcat_unfold]}/conf/server.xml" do
        source "server.xml.erb"
        mode 0644
end
