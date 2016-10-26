class FeedPlan < ActiveRecord::Base
	belongs_to :child

	as_enum :food_package, [:sachet, :bottle ], map: :string, source: :food_package

end
