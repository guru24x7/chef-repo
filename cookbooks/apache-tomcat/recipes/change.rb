## LoadModule slotmem_shm_module modules/mod_slotmem_shm.so
#^#\sLoadModule\sslotmem_shm_module\smodules\/mod_slotmem_shm\.so
pam_config = "/usr/local/apache/conf/httpd.conf"
commented_limits = /^#(LoadModule\sslotmem_shm_module\smodules\/mod_slotmem_shm\.so)\b/m
ruby_block "uncommenting a module" do
block do
sed = Chef::Util::FileEdit.new(pam_config)
sed.search_file_replace(commented_limits, '\1')
sed.write_file
end
end
