class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pessoa
  belongs_to :table

  validates :date, :start_time, :end_time, presence: true
  validate :starts_before_ends
  validate :no_time_overlap

  private

  def starts_before_ends
    # only compare if both fields are filled

    #
    return if start_time.blank? || end_time.blank?

    # ensure start is always before end
    return if start_time < end_time

    errors.add(:end_time, "deve ser depois da hora de início")
  end


  def no_time_overlap
    return if start_time.blank? || end_time.blank?

    scope = Reservation.where(table_id: table_id, date: date)
    scope = scope.where.not(id: id) if id.present?
    conflitantes = scope.where("start_time < ? AND end_time > ?", end_time, start_time)

    if conflitantes.exists?
      errors.add(:base, "Mesa já reservada nesse horário")
    end
  end
end
