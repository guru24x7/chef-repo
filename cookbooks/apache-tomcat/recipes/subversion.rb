execute "Subversion install" do
        command "yum install -y subversion"
end

subversion 'CouchDB Edge' do
  repository 'http://svn.apache.org/repos/asf/couchdb/trunk'
  revision 'HEAD'
  destination '/opt/couch'
  action :checkout
end
