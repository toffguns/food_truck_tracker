class AddOmniauthToContributors < ActiveRecord::Migration
  def change
    add_column :contributors, :provider, :string
    add_column :contributors, :uid, :string
  end
end
