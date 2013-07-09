class SitesController < ApplicationController
  expose(:site) { Site.find(params[:id]) }
  expose(:sites) { Site.scoped }
end
