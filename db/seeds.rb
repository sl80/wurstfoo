# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)


%w(bob jim steve).each do |name|
  
  user = User.create(:email => "#{name}@foo.org", :password => "password")
  
  (1..5).each do |n|
    m = Message.create(:user => user,
      :title => "Message #{n} from #{name}",
      :text => "Ich moechte fuer den BuVo kandideren."
    )
    m.tags.create(:name => 'wurst') if n % 3 == 0
    m.tags.create(:name => 'kaas') if n % 2 == 0
    m.tags.create(:name => 'foo') if n % 4 == 0
  end
  
end
