#
# Cookbook Name:: apache-tomcat
# Recipe:: default
#
# Copyright 2015, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'apache-tomcat::yum'
include_recipe 'apache-tomcat::subversion'
#include_recipe 'apache-tomcat::java'
#include_recipe 'apache-tomcat::tomcat'
#include_recipe 'apache-tomcat::tomcat_mod'
#include_recipe 'apache-tomcat::apache'
#include_recipe 'apache-tomcat::apache_tuning'
#include_recipe 'apache-tomcat::php'
