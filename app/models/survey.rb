class Survey < ActiveRecord::Base
	#has_many :questions, :dependent => :destroy
	has_and_belongs_to_many :questions
	accepts_nested_attributes_for :questions, allow_destroy: true
end
