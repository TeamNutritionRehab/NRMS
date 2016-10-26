class Test < ActiveRecord::Base
	belongs_to :child

#////////////////////////////////////////////////////////////////////////////////////////////
	as_enum :stools, [:three_times, :four_times , :atleast_five], map: :string, source: :stools
	as_enum :yes_appetite, [:very_good, :good, :poor, :very_poor], map: :string, source: :yes_appetite
	as_enum :referred_by, [:own, :NRU, :otherOTP], :map => :string, source: :referred_by

#///////////////////////////////////////////////////////////////////////////////////////////
	scope :appetite_pass, lambda {where(:Appetite_test => true)}
	scope :appetite_fail, lambda {where(:Appetite_test => false)}

end
