class CreateShortUrlDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :short_url_details do |t|
      t.references :short_url, foreign_key: true
      t.string :ip_address
      t.string :location
      
      t.timestamps
    end
  end
end
