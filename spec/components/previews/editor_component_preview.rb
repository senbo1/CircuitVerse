# frozen_string_literal: true

class EditorComponentPreview < ViewComponent::Preview
  def default
    render(EditorComponent.new(editor_content: "Hello, world!"))
  end
end
