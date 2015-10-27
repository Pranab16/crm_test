class SearchController < ApplicationController
  def index

  end

  def dropdown
    query = prepare_query_for_search(params[:key] || '')
    #options = {:match_mode=>:extended, :sort_mode=>:extended, :star=>true,
    #           :ignore_errors=>true, :populate=>true, :page=>page, :per_page=>results_limit, :retry_stale=>true}
    options = {:match_mode=>:extended, :sort_mode=>:extended, :star=>true, :populate=>true, :page=>1,
               :per_page=>3, :retry_stale=>true}
    #options = {page: 1, per_page: 3}

    results = []
    category_ids = []
    products = Product.search(query, options.merge({include: :category}))

    products.each do |product|
      results << {value: product.name, id: product.id, category: product.category.name}
      category_ids << product.category_id
    end

    categories = Category.search(query, options.merge({without: {category_id: category_ids}}))

    categories.each do |category|
      results << {value: category.name, id: category.id}
    end
    render json: results.to_json
  end

  private
  def prepare_query_for_search query
    query = Riddle::Query.escape(query).gsub("\\\"","\"")
    "(#{query.scan(/"[^"]*"|\S+/).join(") | (")})"
  end
end