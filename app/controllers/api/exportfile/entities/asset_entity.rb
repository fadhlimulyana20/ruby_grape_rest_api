module Api
  module Exportfile
    module Entities
      class AssetEntity < Grape::Entity
        expose :id
        expose :name
        expose :ext
        expose :loc
        expose :created_at
        expose :updated_at
      end
    end
  end
end
