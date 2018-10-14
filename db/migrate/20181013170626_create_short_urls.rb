class CreateShortUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :short_urls do |t|
      t.string :simplified_url
      t.string :short_url
    	
      t.timestamps
    end
  end
end
