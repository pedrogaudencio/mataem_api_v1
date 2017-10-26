class CreateSocialMedia < ActiveRecord::Migration[5.1]
  def change
    create_table :social_media do |t|
      t.references :restaurant, foreign_key: true
      t.string :facebook_url
      t.string :twitter_url
      t.string :google_plus_url
      t.string :linkedin_url
      t.string :facebook_app_id
      t.string :facebook_secret_key

      t.timestamps
    end
  end
end
