class SitesController < ApplicationController
  expose(:sites) { Site.all }
end
