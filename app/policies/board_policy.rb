class BoardPolicy < ApplicationPolicy
    def hide?
      # 有登入，且角色是
      user && (user.role == 'bm' || user.role == 'admin') 
    end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
