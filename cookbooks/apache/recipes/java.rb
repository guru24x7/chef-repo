file "/usr/local/#{node[:apache][:java_src]}" do
  action :delete
end

ruby_block "Install Java" do
        block do
                require 'fileutils'
                FileUtils.cd "/usr/local"
                system "wget --no-check-certificate --no-cookies --header 'Cookie: oraclelicense=accept-securebackup-cookie'  #{node[:apache][:java_url]}"
                system "tar -xzf #{node[:apache][:java_src]}"
        end
        action :create
end

# Create jdk link
execute "Make Java link" do
        cwd "/usr/local"
	command "ln -sf #{node[:apache][:java_unfold]} java"
end

# Creating a startup/export file for java
cookbook_file "/etc/profile.d/java.sh" do
  source "java.sh"
  owner "root"
  group "root"
  mode 0755
  action :create_if_missing
end

# Creating a bash script to run java.sh
cookbook_file "/tmp/act_java.sh" do
  source "act_java.sh"
  owner "root"
  group "root"
  mode 0755
  action :create_if_missing
end

# Executing the bash to activate java
execute "Sourcing Java" do
  command "bash /tmp/act_java.sh"
end

