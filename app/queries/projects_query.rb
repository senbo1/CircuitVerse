# frozen_string_literal: true

class ProjectsQuery < GenericQuery
  attr_reader :relation

  SORT_OPTIONS = {
    "date_desc" => { created_at: :desc },
    "date_asc" => { created_at: :asc },
    "views_desc" => { view: :desc },
    "views_asc" => { view: :asc },
    "stars_desc" => { stars_count: :desc },
    "stars_asc" => { stars_count: :asc }
  }.freeze

  def initialize(query_params, relation = Project.all)
    @relation = relation.includes(:author, :tags)
    @sort_by = query_params[:sort_by]
    super(query_params, @relation)
  end

  def results
    apply_sorting(super, @sort_by)
  end

  private

    def apply_sorting(results, sort_by)
      results.order(SORT_OPTIONS[sort_by] || { created_at: :desc })
    end
end
