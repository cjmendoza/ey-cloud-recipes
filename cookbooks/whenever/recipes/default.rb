#
# Cookbook Name:: whenever
# Recipe:: default
#

ey_cloud_report "whenever" do
  message "starting whenever recipe"
end
 
# Set your application name here
appname = "vidaguard4"
 
if ['solo', 'util'].include?(node[:instance_role])
 
  # be sure to replace "app_name" with the name of your application.
  local_user = node[:users].first
  execute "whenever" do
    cwd "/data/#{appname}/current"
    user local_user[:username]
    command "whenever --update-crontab '#{appname}_#{node[:environment][:framework_env]}'"
    action :run
  end
  
  ey_cloud_report "whenever" do
    message "whenever recipe complete"
  end
end
