class Item < ActiveRecord::Base
  belongs_to :package
  has_many :item_translations, dependent: :destroy
  accepts_nested_attributes_for :item_translations, allow_destroy: true, :reject_if => :all_blank
end
