# Download rhel6 iso and mount
ruby_block "download_rhel_and_mount" do
        block do
                require 'fileutils'
                FileUtils.cd "/opt"
		system "wget #{node[:apache_tomcat][:rhel6_url]}"
                system "mount -o loop #{node[:apache_tomcat][:rhel6_iso]} /mnt"

	end
        action :create
end

# Creating a yum repo file for rhel6 iso
cookbook_file "/etc/yum.repos.d/rhel6.repo" do
  source "rhel6.repo"
  owner "root"
  group "root"
  mode 0755
  action :create_if_missing
end

# Updating yum repo
ruby_block "updating_yum_repo" do
        block do
                system "yum clean all"
		system "yum repolist"
        end
        action :create
end

