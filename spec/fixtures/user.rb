class User < ActiveRecord::Base
  trimify :first_name, :middle_name
  trimify :last_name, :nilify => false
end