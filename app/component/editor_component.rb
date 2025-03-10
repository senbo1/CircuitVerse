# frozen_string_literal: true

class EditorComponent < ViewComponent::Base
 def initialize(editor_content:)
    @editor_content = editor_content
  end
end
