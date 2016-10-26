class Anthropometry < ActiveRecord::Base
#Associations
	belongs_to :child
#//////////////////////////////////////////////////////////////////////////////////
	#conditions
	scope :no_oedema, lambda { where(:oedema_cd => "no_oedema")}
	scope :oedema_plus, lambda { where(:oedema_cd => "level_one")}
	scope :oedema_2plus, lambda { where(:oedema_cd => "level_two")}
	scope :oedema_3plus, lambda { where(:oedema_cd => "level_three")}

#//////////////////////////////////////////////////////////////////////////////////	
	as_enum :oedema, [:no_oedema, :level_one, :level_two, :level_three], map: :string, source: :oedema

end
