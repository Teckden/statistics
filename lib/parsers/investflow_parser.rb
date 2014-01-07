#!/usr/bin/env ruby
# -*- coding: utf-8 -*-
class InvestflowParser

  def initialize(trader_data=nil)
    @agent = Mechanize.new
    @trader_data = trader_data
  end

  def start
    return 'No trader data passed. Nothing to parse' if @trader_data.nil? && !@trader_data.is_a?(Hash)
    find_data_and_save_to_file
  end

  def find_data_and_save_to_file
    puts 'Starting to look for the data...'

    traders = {}
    @trader_data.each { |key, value| traders[key] = get_data_from_trader(value) }
    traders.each {|i| p i}
  end

  def get_data_from_trader(url_trader)
    page = @agent.get(url_trader)
    profit = page.link_with('text' => "Доходность").click
    clean_data = []

    profit.search("#wt_2013, #wt_2014").each do |year|
      year.search("tr").each do |tr|
        tp_week_start = tr.search("td:first-child").text.strip! unless tr.search("td:first-child").text.strip!.nil?
        if tp_week_start && Time.parse(tp_week_start) > (Time.now - (28*24*60*60))
          clean_tr_string = []
          tr.search("td").each_with_index do |td, i|
            td.css('div').first.remove if td.css(".badge").any?
            clean_tr_string << td.text.strip! if [0,1,2].include?(i)
          end
          clean_data << clean_tr_string.flatten
        end
      end
    end
    return clean_data
  end
end
