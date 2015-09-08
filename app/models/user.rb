class User < ActiveRecord::Base
	has_secure_password
	def coach?
		self.role =='coach'
	end
	def admin?
		self.role =='admin'
	end

end
