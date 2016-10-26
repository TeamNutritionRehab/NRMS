class Child < ActiveRecord::Base
	#Associations

#/////////////////////////////////////////////////////////////////////
	#validations
	validates :reg_number, :unique => true

#/////////////////////////////////////////////////////////////////////
	#Variables with multiple options
	as_enum :maternal_HIV_serostatus, [:RR, :NR, :unknown], map: :string, source: :maternal_HIV_serostatus
	as_enum :twin_child, [:yes, :no], map: :string, source: :twin_child
	as_enum :sex, [:male, :female], :map => :string, source: :sex

#/////////////////////////////////////////////////////////////////////

end
