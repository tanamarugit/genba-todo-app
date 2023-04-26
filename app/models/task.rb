class Task < ApplicationRecord
  before_validation :set_nameless_name

  validates :name, presence: true
  validates :name, length: { maximum: 30 }

  validate :validate_name_not_imcluding_comma

  belongs_to :user

  scope :recent, -> { order(created_at: :desc) }
  # Ex:- scope :active, -> {where(:active => true)}

  has_one_attached :image

  def self.csv_attributes
    ["name", "description", "created_at", "updated_at"]
  end
  
  def self.generate_csv
    CSV.generate(headers: true) do |csv|
      csv << csv_attributes
      all.each do |task|
        csv << csv_attributes.map{|attr| task.send(attr)}
      end
    end
  end
  
  
  private

  def set_nameless_name
    self.name = '名前なし' if name.blank?
  end

  def validate_name_not_imcluding_comma
    errors.add(:name, 'にカンマを含めることはできません。') if name&.include?(',')
  end

  def self.ransackable_attributes(auth_objct = nil)
    %w[name created_at]
  end

  def self.ransackable_associations(auth_objct= nil)
    []
  end
  

end
