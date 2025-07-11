# frozen_string_literal: true

module UsersCircuitverseHelper
  def get_priority_countries
    priority_countries = ["IN"]
    geo_contry = Geocoder.search(request.remote_ip).first&.country
    priority_countries.prepend(geo_contry) if priority_countries.exclude?(geo_contry) && !geo_contry.nil?
    priority_countries
  end

  def user_profile_picture(attachment)
    if attachment.attached?
      attachment
    else
      image_path("thumb/Default.jpg")
    end
  end

  def project_image_preview(project)
    if project.circuit_preview.attached?
      project.circuit_preview
    else
      image_path("empty_project/default.png")
    end
  end
end
