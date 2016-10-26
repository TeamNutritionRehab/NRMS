class Child < ActiveRecord::Base
	#Associations
	has_one :admission, :dependent => :destroy
	has_one :discharge, :dependent => :destroy
	has_many :tests, :dependent => :destroy
	has_one :anthropometry, :dependent => :destroy
	has_many :feed_plans, :dependent => :destroy
	has_many :follow_ups, :dependent => :destroy
	has_one :routine_treatment, :dependent => :destroy
		
#/////////////////////////////////////////////////////////////////////
	#validations
	validates :reg_number, uniqueness: true

#/////////////////////////////////////////////////////////////////////
	#Variables with multiple options
	as_enum :maternal_HIV_serostatus, [:RR, :NR, :unknown], map: :string, source: :maternal_HIV_serostatus
	as_enum :twin_child, [:yes, :no], map: :string, source: :twin_child
	as_enum :sex, [:male, :female], :map => :string, source: :sex

#/////////////////////////////////////////////////////////////////////

end
