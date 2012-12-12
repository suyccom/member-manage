# Users
$super_grover = User.create(:name => 'super_grover',
  :email_address => 'super_grover@sesamestreet.net',
  :password => 'super_grover_sesamestreet',
  :administrator => true,
  :remember_token => 'faad090acf6a266dec4e154ee84b7260c937324a',
  :remember_token_expires_at => (Time.now + 1.day).to_s(:db),
  :key_timestamp => Time.now.to_s(:db))
$grover = User.create(:name => 'grover',
  :email_address => 'grover@sesamestreet.net',
  :password => 'grover_sesamestreet',
  :administrator => false,
  :remember_token => 'badf090acf6a266dec4e154ee84b7260c937515e',
  :remember_token_expires_at => (Time.now + 1.day).to_s(:db),
  :key_timestamp => Time.now.to_s(:db))

# Members
$bert = Member.create(:name => 'Bert',
  :email => 'bert@sesamestreet.net')
$ernie = Member.create(:name => 'Ernie',
  :email => 'ernie@sesamestreet.net')

# Set users as active users
User.find_by_name('super_grover').update_attribute(:state,'active')
User.find_by_name('grover').update_attribute(:state,'active')
