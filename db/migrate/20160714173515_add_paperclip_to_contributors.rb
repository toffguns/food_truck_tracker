class AddPaperclipToContributors < ActiveRecord::Migration
  def change
    add_attachment :contributors, :image

  end
end
