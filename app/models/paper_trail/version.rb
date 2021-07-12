module PaperTrail
  class Version < ActiveRecord::Base
    include ControllerMessages
    include PaperTrail::VersionConcern
  end
end