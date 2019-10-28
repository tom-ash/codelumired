# frozen_string_literal: true

module AnnouncementsShared
  def calculate_rent_amounts
    @announcement_object = {}
    handle_rent_amount
    @response = @announcement_object
    render_ok
  end

  private

  def handle_rent_amount
    @area = params[:area].to_i
    @net_rent_amount = params[:net_rent_amount].to_i
    return unless @net_rent_amount != 0 && @area != 0

    @gross_rent_amount = @net_rent_amount * 1.23
    @announcement_object.merge!(
      area: @area,
      net_rent_amount: @net_rent_amount,
      net_rent_amount_per_sqm: ((@net_rent_amount * 100) / @area).ceil,
      gross_rent_amount: (@gross_rent_amount * 100).ceil,
      gross_rent_amount_per_sqm: ((@gross_rent_amount * 100) / @area).ceil
    )
  end

  def handle_availability_date
    @announcement_object[:availability_date] = Date.current if params[:availability_date] == 'now'
  end

  def parse_availability_date
    @announcement[:availability_date] = 'now' if Date.current >= @announcement[:availability_date].to_date
  end
end
