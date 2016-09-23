Knife command for AWS
=================


knife ec2 server create -I ami-2e6c467c -r "role[apache-tomcat]" -Z ap-southeast-1a --security-group-ids sg-aef44fcb --subnet subnet-37dd1040 -f t2.medium --region ap-southeast-1 --ssh-user ec2-user --ssh-key XXXX-chef --identity-file .chef/XXXX-chef.pem -N "Trial-via-chef"

Recipes are available at: chef-repo/cookbooks/apache-tomcat/recipes/
