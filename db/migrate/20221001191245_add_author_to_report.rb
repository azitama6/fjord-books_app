# frozen_string_literal: true

class AddAuthorToReport < ActiveRecord::Migration[6.1]
  def change
    add_reference :reports, :report, foreign_key: true
  end
end
