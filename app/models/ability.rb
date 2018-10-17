class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    alias_action :read, :update, :destroy,:show,:edit, :to => :rud
    alias_action :create,:read, :update,:edit, :destroy,:new,:show, :to => :crud
    alias_action :read, :show, :to => :see

    user ||= User.new # guest user (not logged in)

    if user.is? "superadmin"
      can :manage, DashboardsController
      can :manage, Letter
      can :manage, Disposition
      can :manage, Delegation
      can :manage, User
      can :manage, CostCentre
      can :manage, Directorate
      can :manage, Type
      can :manage, Attribute
      can :manage, HistoryController

    elsif user.is? "dirut"
      can :see, DashboardsController
      can :see, Letter
      can :see, HistoryController

    elsif user.is? "direksi"
      can :see, DashboardsController
      can :see, Letter
      can :crud, Disposition
      can :see, HistoryController

    elsif user.is? "kadiv"
      can :see, DashboardsController
      can :see, Letter
      can :crud, Disposition
      can :see, HistoryController

    elsif user.is? "sekretaris_dirut"
      can :see, DashboardsController
      can :crud, Letter
      can :crud, Delegation
      can :see, HistoryController

    elsif user.is? "sekretaris_direksi"
      can :see, DashboardsController
      can :crud, Letter
      can :crud, Delegation
      can :crud, Disposition
      can :see, HistoryController

    elsif user.is? "admin"
      can :see, DashboardsController
      can :crud, Letter
      can :crud, Disposition
      can :crud, Delegation
      can :see, Disposition
      can :see, HistoryController

    elsif user.is? "manajer"
      can :see, DashboardsController
      can :crud, Disposition
      can :see, Disposition
      can :see, HistoryController

    elsif user.is? "staf"
      can :see, Disposition


    else

    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
