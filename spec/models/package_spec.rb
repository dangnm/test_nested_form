require 'rails_helper'

RSpec.describe Package, type: :model do
  describe "#update" do
    let!(:item_translation_1) { create(:item_translation, name: "item tran 1") }
    let!(:item_1) { create(:item, name: "item 1", item_translations: [item_translation_1]) }
    let!(:package_1) { create(:package, name: "package 1", items: [item_1]) }
    it "should create successfully" do
      package_1.update({
        name: "package 1 updated",
        items_attributes: {
          '0' => {
            id: item_1.id,
            item_translations_attributes: {
              '1' => {
                id: item_translation_1.id,
                locale: "en",
                name: "item tran 1 updated"
              },
              '2' => {
                locale: "vi",
                name: "item tran 2"
              }
            }
          }
        }
      })
      return_package = Package.find(package_1.id)
      expect(return_package.name).to eq("package 1 updated")
      expect(return_package.items.first.item_translations.size).to eq(2)
      expect(return_package.items.first.item_translations.first.name).to eq("item tran 1 updated")
      expect(return_package.items.first.item_translations.last.name).to eq("item tran 2")
    end
  end
  describe "#create" do
    let!(:package_1) { create(:package, name: "test") }
    it "should create successfully" do
      expect(package_1.name).to eq("test")
    end
  end
end
