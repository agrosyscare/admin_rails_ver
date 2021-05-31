module ControllerMessages
  extend ActiveSupport::Concern

  module ClassMethods
    # Localize messages for controller
    #
    # en:
    #   controllers:
    #     notices:
    #       created: '%{model} was successfully created.'
    #       updated: '%{model} was successfully updated.'
    #       destroyed: '%{model} was successfully destroyed.'
    #     specific_model:
    #       notices:
    #         created: Custom message.
    #
    # => String
    def human_notice(notice_key_name)
      default = I18n.t(
        notice_key_name,
        scope: [:controllers, :notices],
        model: self.model_name.human
      )

      I18n.t(
        notice_key_name,
        scope: [:controllers, self.name.underscore, :notices],
        model: self.model_name.human,
        default: default
      )
    end

    # Localize messages for view
    #
    # en:
    #   views:
    #     titles:
    #       create: 'Creating %{model}.'
    #       update: 'Editing %{model}.'
    #       destroy: 'Destroying %{model}.'
    #     specific_model:
    #       titles:
    #         create: Custom message.
    #
    # => String
    def human_title(key_name)
      default = I18n.t(
        key_name,
        scope: [:views, :titles],
        model: self.model_name.human
      )

      I18n.t(
        key_name,
        scope: [:views, self.name.underscore, :titles],
        model: self.model_name.human,
        default: default
      )
    end
  end
end
