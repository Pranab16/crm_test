module ApplicationHelper

  def formatted_leads(leads)
    formatted = {}
    leads.each do |lead|
      date_diff = (lead.created_at.to_date - Date.current).to_i
      if formatted[date_diff]
        formatted[date_diff] << lead
      else
        formatted[date_diff] = [lead]
      end
    end
    formatted[0] = [] if formatted[0].nil?
    formatted
  end
end
