# frozen_string_literal: true

class ProjectsQuery < GenericQuery
  attr_reader :relation

  def initialize(query_params, relation = Project.all)
    @relation = relation.includes(:author, :tags)
    @sort_by = query_params[:sort_by]
    super query_params, @relation
  end

  def results
    apply_sorting(super, @sort_by)
  end

  private

  def apply_sorting(results, sort_by)
    case sort_by
    when "date_desc"
      results.order(created_at: :desc)
    when "date_asc"
      results.order(created_at: :asc)
    when "views_desc"
      results.order(view: :desc)
    when "views_asc"
      results.order(view: :asc)
    when "stars_desc"
      results.order(stars_count: :desc)
    when "stars_asc"
      results.order(stars_count: :asc)
    else
      results.order(created_at: :desc)
    end
  end
end
