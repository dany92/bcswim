class Question < ActiveRecord::Base
	before_create :generate_token
 	protected
=begin
 	Use hashing instead later.
 	This does not generate a unique value
=end
 	def generate_token
		self.num=rand(999999)
    end
end

