class House < ApplicationRecord
    validates :address, presence: false

    has_many :residents,
        primary_key: :id,
        foreign_key: :house_id,
        class_name: :Person
end