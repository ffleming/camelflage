class SqlInjectionsController < ApplicationController
  def raw_sql
    render plain: raw_sql_command.execute
  end

  def raw_where
    render plain: raw_where_command.execute
  end

  def index
    render json: {
      raw_sql_command: raw_sql_command.hint,
      raw_where_command: raw_where_command.hint,
    }
  end

  private

  def sql_params
    params.permit(:name)
  end

  def raw_sql_command
    @raw_sql_command ||= RawSql.new(sql_params[:name])
  end

  def raw_where_command
    @raw_where_command ||= RawWhere.new(sql_params[:name])
  end

end
