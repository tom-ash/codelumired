# frozen_string_literal: true

module AnnouncementsShared
  def calculate_rent_amounts
    @announcement_object = {}
    handle_rent_amount
    @response = @announcement_object
    ok
  end

  private

  def handle_rent_amount
    @category = params[:category].to_i

    if params[:longitude] && params[:latitude]
      @longitude = params[:longitude].truncate(7)
      @longitude_int = @longitude * 10_000_000
      @latitude = params[:latitude].truncate(7)
      @latitude_int = @latitude * 10_000_000
    end

    @announcement_object.merge!(
      longitude: @longitude,
      longitude_int: @longitude_int,
      latitude: @latitude,
      latitude_int: @latitude_int
    )

    @area = params[:area].to_f
    @area_int = @area * 100

    if @category == 2
      @gross_rent_amount = params[:gross_rent_amount].to_f
      @gross_rent_amount_int = @gross_rent_amount * 100
      @gross_rent_amount_per_sqm_int = ((@gross_rent_amount_int / @area_int) * 100).ceil
      @gross_rent_amount_per_sqm = @gross_rent_amount_per_sqm_int / 100.0

      @announcement_object.merge!(
        area: @area,
        area_int: @area_int,
        gross_rent_amount: @gross_rent_amount,
        gross_rent_amount_int: @gross_rent_amount_int,
        gross_rent_amount_per_sqm: @gross_rent_amount_per_sqm,
        gross_rent_amount_per_sqm_int: @gross_rent_amount_per_sqm_int
      )
    else
      @net_rent_amount = params[:net_rent_amount].to_f
      @net_rent_amount_int = @net_rent_amount * 100
      @net_rent_amount_per_sqm_int = ((@net_rent_amount_int / @area_int) * 100).ceil
      @net_rent_amount_per_sqm = @net_rent_amount_per_sqm_int / 100.0
      @gross_rent_amount = @net_rent_amount.to_f * 1.23
      @gross_rent_amount_int = @gross_rent_amount * 100
      @gross_rent_amount_per_sqm_int = ((@gross_rent_amount_int / @area_int) * 100).ceil
      @gross_rent_amount_per_sqm = @gross_rent_amount_per_sqm_int / 100.0

      @announcement_object.merge!(
        area: @area,
        area_int: @area_int,
        net_rent_amount: @net_rent_amount,
        net_rent_amount_int: @net_rent_amount_int,
        net_rent_amount_per_sqm: @net_rent_amount_per_sqm,
        net_rent_amount_per_sqm_int: @net_rent_amount_per_sqm_int,
        gross_rent_amount: @gross_rent_amount,
        gross_rent_amount_int: @gross_rent_amount_int,
        gross_rent_amount_per_sqm: @gross_rent_amount_per_sqm,
        gross_rent_amount_per_sqm_int: @gross_rent_amount_per_sqm_int
      )
    end
  end

  def handle_availability_date
    @announcement_object[:availability_date] = Date.current if params[:availability_date] == 'now'
  end

  def parse_availability_date
    return if @announcement[:availability_date].blank?
    
    @announcement[:availability_date] = 'now' if Date.current >= @announcement[:availability_date].to_date
  end
end
