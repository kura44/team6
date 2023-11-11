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

  def show

    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    @sum = @j + @m + @e + @sc + @so
    @ave = @sum / 5
    @sum3 = (@j + @m + @e)/3
    # 合計値
    @tashizan = @j + @m + @e + @sc + @so + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #5教科のうち高得点の3教科の合計点
    @sumTop3 =(@subjects[4]+@subjects[3]+@subjects[2])

    #最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    if @j > 50
      redirect_to team6s_type1_path
    elsif @j == 50
      redirect_to team6s_type2_path
    elsif @j > 40
      redirect_to team6s_type3_path
    elsif @j > 30
      redirect_to team6s_type4_path
    else
      redirect_to team6s_type5_path
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
