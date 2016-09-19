# Delete source file if already exist
file "/usr/local/#{node[:apache][:php_src]}" do
        action :delete
end
# Delete uncompressed source if already exist
file "/usr/local/#{node[:apache][:php_unfold]}" do
        action :delete
end

# Update system and development libraries
execute "PHP dependencies" do
        command "yum update -y"
	command "yum groupinstall 'Development Tools' -y && yum install -y mysql-devel bzip2-devel libcurl-devel curl-devel libpng-devel db4-devel libXpm-devel gmp-devel libicu-devel libc-client-devel openldap-devel unixODBC-devel postgresql-devel sqlite-devel aspell-devel readline-devel net-snmp-devel libxslt-devel freetype-devel libxml2-devel pcre-devel t1lib-devel.x86_64 libmcrypt-devel.x86_64 libtidy libtidy-devel libjpeg-devel libvpx-devel enchant-devel"
end
# Download and compile the php
ruby_block "Install PHP" do
	block do
		require 'fileutils'
    		FileUtils.cd "/usr/local"
		system "wget #{node[:apache][:php_url]}"
		system "tar -xzf #{node[:apache][:php_src]}"
		
		FileUtils.cd "/usr/local/#{node[:apache][:php_unfold]}"
		system "./configure \
			--with-apxs2=/usr/local/apache/bin/apxs \
			--prefix=/usr/local/apache/php \
			--with-config-file-path=/usr/local/apache/php \
			--libdir=/usr/lib64 \
			--with-libdir=lib64 \
			--enable-force-cgi-redirect \
			--enable-pic \
			--with-curl=/usr \
			--with-curlwrappers \
			--enable-exif \
			--enable-ftp \
			--enable-shared \
			--with-gd \
			--with-bz2 \
			--with-db4=/usr \
			--with-freetype-dir=/usr \
			--with-png-dir=/usr \
			--enable-gd-native-ttf \
			--with-gettext \
			--with-ncurses=shared \
			--with-gmp \
			--with-iconv \
			--with-jpeg-dir=/usr \
			--with-openssl \
			--with-png \
			--without-gdbm \
			--with-xml \
			--with-expat-dir=/usr \
			--with-dom=shared,/usr \
			--with-dom-xslt=/usr \
			--with-dom-exslt=/usr \
			--with-xmlrpc=shared \
			--with-zlib \
			--enable-bcmath \
			--enable-sockets \
			--enable-track-vars \
			--enable-yp \
			--enable-wddx \
			--with-pear \
			--with-ldap=shared \
			--enable-ucd-snmp-hack \
			--enable-shmop \
			--enable-calendar \
			--enable-zip \
			--enable-dbx \
			--enable-dio \
			--enable-mbstring=shared \
			--enable-mbstr-enc-trans \
			--enable-mbregex \
			--enable-memcache \
			--with-mime-magic=/usr/share/file/magic.mime \
			--with-mysqli=/usr/bin/mysql_config \
			--with-mysql \
			--with-pdo-mysql"
		system "make && make install"
	end
	action :create
end

# Add php mime type in httpd.conf
mime_types="#{node[:apache][:apache_mime]}"
added_line1 = /^application\/x-httpd-php\sphp\sphtml\sphp4\sphp5/m
ruby_block "Adding a mime type in Apache" do
        block do
                sed = Chef::Util::FileEdit.new(mime_types)
                sed.insert_line_if_no_match(added_line1, 'application/x-httpd-php php phtml php4 php5')
                sed.write_file
        end
end

# Restart Apache
service 'apache2' do
  action [:restart]
end

# Add index.php in Apache www-root
file "#{node[:apache][:apache_wwwroot]}/index.php" do
	content '<?php phpinfo(); ?>'
	mode '0666'
  	owner 'daemon'
  	group 'daemon'
end
