class SupportTicket < ActiveRecord::Base
    # Validations
    validates :name , presence: true
    VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
    validates :email, format: VALID_EMAIL_REGEX, uniqueness: true
    validates :message, presence: true
    validates :department, presence: true
    # End Validations

    # methods
    scope :search, -> (term) {where("name ILIKE :term OR email ILIKE :term OR department ILIKE :term OR message ILIKE :term", {term: "%#{term}%"})}

    def self.paginate(page)
        order(created_at: :desc).limit(7).offset(7 * (page))
    end


    after_initialize :set_default_values

    def set_default_values
      self.complete ||= false
    end

end
