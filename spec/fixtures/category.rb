class Category < ActiveRecord::Base
  trimify :title
  trimify :description
end