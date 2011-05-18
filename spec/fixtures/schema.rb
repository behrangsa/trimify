ActiveRecord::Schema.define do

  create_table :users, :force => true do |t|
    t.string   :first_name, :not_null, :type
    t.string   :middle_name, :not_null, :type
    t.string   :last_name, :not_null, :type
    t.integer  :salary
    t.datetime :birthday
  end

  create_table :posts, :force => true do |t|
    t.string   :name
  end

  create_table :categories, :force => true do |t|
    t.string   :title, :description
  end

end