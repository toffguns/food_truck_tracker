module ContributorsHelper

  # Purpose: to determined if register link should be shown
  # Signature: (Object, boolean) -> true/false
  # Examples:
  # show_register(nil, true) -> ..
  # ...
  # show_register(Owner.first, true) -> ...
  # show_register(Owner.first, false) ->
  def show_register#(current_owner, contributor_signed_in)
    current_owner.nil? && !contributor_signed_in?
  end
end
