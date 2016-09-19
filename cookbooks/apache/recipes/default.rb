#
# Cookbook Name:: apache
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apache::apache'
include_recipe 'apache::php'
include_recipe 'apache::java'
include_recipe 'apache::tomcat'
