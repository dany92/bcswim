class Question < ActiveRecord::Base
=begin
	before_create :generate_token
 	protected

 	def generate_token
		new_token = rand(999999999)
		self.num = new_token
    end
=end
end

