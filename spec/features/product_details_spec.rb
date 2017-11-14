require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the product details" do
    visit root_path
    @first_product = first("article.product").click
    @link = @first_product.find_link('Details')
    @link.click

    # commented out b/c it's for debugging only
    save_screenshot

    expect(page).to have_css 'article.product'
  end

end
