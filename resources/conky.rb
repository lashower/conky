resource_name :conky

#property :package_name, String, name_property: true

action :create do
  Dir.open('/home').each do |user_dir|
      next if user_dir.start_with?('.')
      template "/home/#{user_dir}/.conkyrc" do
        source 'conkyrc.erb'
        owner "#{user_dir}"
        group "#{user_dir}"
      end
  end
end
