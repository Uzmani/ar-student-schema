require_relative '../../db/config'


class StudentTeacher < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
end 