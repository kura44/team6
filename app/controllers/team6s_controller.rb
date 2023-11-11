class Team6sController < ApplicationController
    def index
        @shindans = Shindan.all
    end
    def new
        @shindan = Shindan.new
    end
    def create
        shindan = Shindan.new(shindan_params)
        if shindan.save
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
    end

    def type1

    end
    def type2

    end
    def type3

    end
    def type4

    end
    def type5

    end
    private
  def shindan_params
    params.require(:shindan).permit(:japanese,:math,:english,:science,:society,:interview,:gd)
  end
end
