# frozen_string_literal: true

# Repository to store state of objects. It would act like a Database.
# This class will store only ItemRepository Objects and can retrieves
# them with for method.
#
# For example:
#
#   Repository.register (:user, ItemRepository.new)
#
# and then we can retrieve this :user instance for saving User models:
#
#   Repository.for(:user).save(user_object)
#
# It can be replaced with ActiveRecord, however it has its own advantages like
# decoupling from DB technologies and also Single Responsibility.
#
class Repository
  def self.register(name, model)
    registery[name] = model
  end

  def self.registery
    @registery ||= {}
  end

  def self.for(type)
    @registery[type]
  end

  def self.all
    @registery
  end
end
