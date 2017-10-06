class UserDecorator < Draper::Decorator
  delegate :id, :full_name, :email, :level, :profile_image, :role

  decorates_association :invites
  decorates_association :assessments

  def full_name_with_email
    "#{object.full_name} (#{object.email})"
  end

  def full_name_with_role
    "#{object.full_name} (#{display_role})"
  end

  def display_role
    User::ROLES[object.role.to_sym]
  end

  def info
    "#{display_role}, Уровень: #{object.level}"
  end
end
