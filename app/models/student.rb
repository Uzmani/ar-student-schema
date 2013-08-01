require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  has_many :student_teachers, :foreign_key => :student_id
  has_many :teachers, :through => :student_teachers

  validates :email, format: { with: /.+@.+\.[a-z]{2,4}/ }, uniqueness: true
  validates :birthday, exclusion:  { in: Date.civil(2007,1,1)..Date.today }
  validates :phone_just_digits, length: { minimum: 10 }

  def name
    self.first_name + ' ' + self.last_name
  end

  def age
    (Date.new(2012).year - self.birthday.year)
  end

  def phone_just_digits
    read_attribute(:phone).gsub(/\D/, '')
  end
end