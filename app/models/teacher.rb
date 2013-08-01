require_relative '../../db/config'


class Teacher < ActiveRecord::Base
  has_many :student_teachers, :foreign_key => :teacher_id
  has_many :students, :through => :student_teachers
  validates :email, format: { with: /.+@.+\.[a-z]{2,4}/ }, uniqueness: true
end