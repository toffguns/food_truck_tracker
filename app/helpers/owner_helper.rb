module OwnerHelper
  def resource_name
    :owner
  end

  def resource
    @resource ||= Owner.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:owner]
  end
end
