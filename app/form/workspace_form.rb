class WorkspaceForm
include ActiveModel::model

attr_accessor :name, :user_id, :workspace_id, :address, :price, :recommendation

validates :name, presence: true
  validates :address, presence: true
  validates :user_id, presence: true

  def save
    return false unless valid?

    workspace = Workspace.new(
      name: name,
      address: address,
      user_id: user_id,
      price: price,
      recommendation: recommendation
    )

  end

end