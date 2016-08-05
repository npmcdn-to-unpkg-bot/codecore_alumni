class SearchController < ApplicationController

  # Note: In its current state the search is still far from optimal and rather ugly.
  # If anyone knows how to display the results from pgsearch without making another database query, or feels like implementing other improvements, please go ahead and make a pull request with a fix

  def search
    @query = params[:q]
    @results = []
    @user_results, @profile_results, @category_results, @profile_adj_results, @other_results = [], [], [], [], []
    if @query.empty?
      flash[:alert] = "Your search is empty"
      render :search
    else
      @results = PgSearch.multisearch @query
      @results.each do |r|
        if r.searchable_type.downcase == 'user'
          @user_results << (User.find r.searchable_id)
        elsif r.searchable_type.downcase == 'profile'
          @profile_results << (Profile.find r.searchable_id)
        elsif r.searchable_type.downcase == 'category'
          @category_results << (Category.find r.searchable_id)
        elsif r.searchable_type.downcase == 'skill' || 'education' || 'experience' || 'project'
          if r.searchable_type.downcase == 'skill'
            @profile_adj_results << (Skill.find r.searchable_id)
          elsif r.searchable_type.downcase == 'education'
            @profile_adj_results << (Education.find r.searchable_id)
          elsif r.searchable_type.downcase == 'experience'
            @profile_adj_results << (Experience.find r.searchable_id)
          elsif r.searchable_type.downcase == 'project'
            @profile_adj_results << (Project.find r.searchable_id)
          end
        else
          @other_results << r
        end
      end
      # @results.concat( User.where("first_name ILIKE ? OR last_name ILIKE ?", "%#{@query}%", "%#{@query}%" ))
      # @results.flatten
    end
  end

end
