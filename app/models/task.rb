class Task < ApplicationRecord
	belongs_to :user
	belongs_to :teamlead, optional: true
end
