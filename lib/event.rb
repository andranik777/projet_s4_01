require 'date'
require 'pry'
require 'time'
require_relative 'user.rb'

class Event
    attr_accessor :start_date, :duration, :title, :attendees
    def initialize(e_date, e_duration, e_title,e_attendees)
        @start_date = Time.parse(e_date)#.strftime("%d-%m-%Y %H:%M:%S")
        #e_duration = Time.new.strftime("%d-%m-%Y %H:%M:%S")
        @duration = e_duration.to_i
        @title = e_title.to_s
        @attendees = e_attendees.to_a
    end
    def postpone_24h
        self.start_date += (60*60*24)
    end
    def end_date
        ev_fin = self.start_date + (self.duration * 60)
        return "L'heure de fin d'un événement est #{ev_fin.strftime("%H:%M:%S")}"
    end
    def is_past?
        a = Time.new
        return  a.rfc2822 > self.start_date.rfc2822
    end
    def is_future?
        a = Time.new
        return  a.rfc2822 < self.start_date.rfc2822
    end
    def is_soon?
        a = Time.new
        a.to_f - self.start_date.to_f <(60*60*0.5)
    end 
    def to_s
        puts ">Titre :#{title}"
        puts ">Date de début : #{start_date.strftime("%d-%m-%Y %H:%M:%S")}"
        puts ">Durée : #{duration} minutes"
        puts ">Invités : #{attendees}"
    end 
end

#a =DateTime.strptime('12-10-2020 16:15:06', '%d-%m-%Y %H:%M:%S')
#a = Date.today.strftime("%d-%m-%Y %H:%M:%S")
#a = Time.new.strftime("%d-%m-%Y %H:%M:%S")


#binding.pry

#https://devdocs.io/ruby~2.5/time