class Team6sController < ApplicationController
    def index
        @shindans = Shindan.all
    end
    def new
        @shindan = Shindan.new
    end
    def create
        @shindan = Shindan.new(shindan_params)
        if @shindan.save
          redirect_to team6_path(@shindan)
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

  def show

    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    @tashizan = @j + @m + @e + @sc + @so + @i + @g

  end
  private
  def shindan_params
    params.require(:shindan).permit(:japanese,:math,:english,:science,:society,:interview,:gd)
  end
end
