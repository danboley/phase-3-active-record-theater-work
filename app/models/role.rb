class Role < ActiveRecord::Base

    has_many :auditions

    def actors
        auditions.map do |actor|
            actor.actor
        end
    end

    # def actors
    #     auditions.pluck(:actor)
    # end

    def locations
        auditions.map do |location|
            location.location
        end
    end

    # def locations
    #     auditions.pluck(:locations)
    # end

    def lead
        auditions.find_by(hired: true) || "no actor has been hired for this role"
    end

    def understudy
        auditions.where(hired: true).second || "no actor has been hired for understudy for this role"
    end

end