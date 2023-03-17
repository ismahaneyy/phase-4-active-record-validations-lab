class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :must_not_have_true_facts

    def must_not_have_true_facts
        if self.title == "True Facts"
            errors.add(:title, "Can't contain True Facts")
        end
    end

end
