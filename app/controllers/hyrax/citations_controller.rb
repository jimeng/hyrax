module Hyrax
  class CitationsController < ApplicationController
    include WorksControllerBehavior
    include Breadcrumbs
    include SingularSubresourceController

    before_action :build_breadcrumbs, only: [:work, :file]

    def work
      show
    end

    def file
      # We set _@presenter_ here so it isn't set in WorksControllerBehavior#presenter
      # which is intended to find works (not files)
      solr_file = ::SolrDocument.find(params[:id])
      authorize! :show, solr_file
      @presenter = FileSetPresenter.new(solr_file, current_ability, request)
      show
    end

    private

      def show_presenter
        WorkShowPresenter
      end
  end
end
