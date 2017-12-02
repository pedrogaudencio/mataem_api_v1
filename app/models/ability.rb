class Ability
  include CanCan::Ability

  def initialize(user)
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
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    user ||= User.new
    if user.customer?
      can :read, [Address,
                  Area,
                  City,
                  Restaurant,
                  Vendor,
                  VendorCategory,
                  VendorCuisine,
                  VendorDeliveryArea,
                  ItemChoiceVariant,
                  ItemChoice,
                  MenuItem,
                  MenuItemCategory,
                  MenuItemCuisine,
                  Enquiry,
                  Question,
                  Answer,
                  SocialMedia,
                  Review]
      can :create, [Order, Review]
      can :read, Order, :profile => { :id => user.profile.id }

      # Profile
      can [:read, :create, :update,
           :get_mobile_verification_code,
           :change_mobile_number,
           :verify_mobile_number], Profile, :id => user.profile.id
      can :activate_profile, Profile, :status => 1
      can :deactivate_profile, Profile, :status => 0
    elsif user.delivery_boy?
      # can :read, Order, :order_assignment => { :assignee => {
      #     :id => user.id
      #   }
      # }
      # can :list_pending, OrderAssignment
      # can :accept_assignment, OrderAssignment, :status => 0
      # can , OrderIssue
    elsif user.business?
      # can [:read, :create, :update], Restaurant, :id => user.profile.restaurant.id
      # can [:read, :create, :update], Order, :restaurant {
      #   :id => user.profile.restaurant.id
      # }
      # can [:read, :create, :update], OrderAssignment, :order => {
      #   :restaurant => {
      #     :id => user.profile.restaurant.id
      #   }
      # }
    elsif user.admin?
      can :manage, :all
    else

    end
  end
end
