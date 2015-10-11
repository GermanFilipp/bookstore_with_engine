class Ability
  include CanCan::Ability

  def initialize(customer)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
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


    #customer ||= Customer.new
  if customer
    if customer.admin?
      can :access, :rails_admin       # only allow admin users to access Rails Admin
      can :dashboard
      can :manage, :all
    else
      #can [:index,:destroy,:create,:update,:destroy_all], OrderItem
      can [:create, :new],Rating,customer:customer
      can [:index,:show,:home],Book
      can :show,Category
      can :read,DeliveryMethod,customer:customer
      can [:read,:create,:update],Address,customer:customer
      can [:read,:create,:update],CreditCard,customer:customer
      can [:destroy,:show,:update],Customer, customer:customer
      can [:show,:index,:update],ShopCart::Order, customer:customer

    end
  else
    can [:index,:show,:home], Book
    can :show, Category
  end


  end
end
