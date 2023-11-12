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
    @es = @shindan["essay"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    #主要５教科合計値
    @sum5 = @j + @m + @e + @sc + @so
    #主要５教科平均
    @ave = @sum5 / 5
    #国数英３教科合計
    @sum3 = @j + @m + @e
    #８教科合計値
    @sum8 = @j + @m + @e + @sc + @so + @es + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #主要5教科のうち高得点の3教科の合計点
    @sumTop3 =(@sort[4]+@sort[3]+@sort[2])

    #主要５教科のうち最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    #全ての基準で計算、最も高い点数を選ぶ
    #1.バカロレア
    @scoreBac = @es * 10 + @i * 5 + @g * 5 + @m / 2
    #100点満点に換算
    @scoreBac100 = @scoreBac * 100 / 250
    #2.500点満点
    @score500 = @sum5 / 5
    #3.高得点の3教科
    @scoreTop3 = @sumTop3 / 3
    #4.国数英の3教科
    @scoreKSE = @sum3  / 3

    #格納して降順にソート
    @score = [@scoreBac100, @score500, @scoreTop3, @scoreKSE]
    @goal = @score.sort

    if @goal[3] == @scoreBac100
      redirect_to team6type5_path
    elsif @goal[3] == @score500
      redirect_to team6type1_path
    elsif @goal[3] == @scoreTop3
      redirect_to team6type2_path
    elsif @goal[3] == @scoreKSE
      redirect_to team6type4_path
    else 
      redirect_to team6type3_path
    end

  end


  def type1
    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @es = @shindan["essay"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    #主要５教科合計値
    @sum5 = @j + @m + @e + @sc + @so
    #主要５教科平均
    @ave = @sum5 / 5
    #国数英３教科合計
    @sum3 = @j + @m + @e
    #８教科合計値
    @sum8 = @j + @m + @e + @sc + @so + @es + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #主要5教科のうち高得点の3教科の合計点
    @sumTop3 =(@sort[4] + @sort[3] + @sort[2])

    #主要５教科のうち最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    #全ての基準で計算、最も高い点数を選ぶ
    #1.バカロレア
    @scoreBac = @es * 10 + @i * 5 + @g * 5 + @m / 2
    #100点満点に換算
    @scoreBac100 = @scoreBac * 100 / 250
    #2.500点満点
    @score500 = @sum5 / 5
    #3.高得点の3教科
    @scoreTop3 = @sumTop3 / 3
    #4.国数英の3教科
    @scoreKSE = @sum3  / 3

    #格納して降順にソート
    @score = [@scoreBac100, @score500, @scoreTop3, @scoreKSE]
    @goal = @score.sort

  end
  def type2
    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @es = @shindan["essay"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    #主要５教科合計値
    @sum5 = @j + @m + @e + @sc + @so
    #主要５教科平均
    @ave = @sum5 / 5
    #国数英３教科合計
    @sum3 = @j + @m + @e
    #８教科合計値
    @sum8 = @j + @m + @e + @sc + @so + @es + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #主要5教科のうち高得点の3教科の合計点
    @sumTop3 =(@sort[4]+@sort[3]+@sort[2])

    #主要５教科のうち最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    #全ての基準で計算、最も高い点数を選ぶ
    #1.バカロレア
    @scoreBac = @es * 10 + @i * 5 + @g * 5 + @m / 2
    #100点満点に換算
    @scoreBac100 = @scoreBac * 100 / 250
    #2.500点満点
    @score500 = @sum5 / 5
    #3.高得点の3教科
    @scoreTop3 = @sumTop3 / 3
    #4.国数英の3教科
    @scoreKSE = @sum3  / 3

    #格納して降順にソート
    @score = [@scoreBac100, @score500, @scoreTop3, @scoreKSE]
    @goal = @score.sort

  end
  def type3
    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @es = @shindan["essay"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    #主要５教科合計値
    @sum5 = @j + @m + @e + @sc + @so
    #主要５教科平均
    @ave = @sum5 / 5
    #国数英３教科合計
    @sum3 = @j + @m + @e
    #８教科合計値
    @sum8 = @j + @m + @e + @sc + @so + @es + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #主要5教科のうち高得点の3教科の合計点
    @sumTop3 =(@sort[4]+@sort[3]+@sort[2])

    #主要５教科のうち最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    #全ての基準で計算、最も高い点数を選ぶ
    #1.バカロレア
    @scoreBac = @es * 10 + @i * 5 + @g * 5 + @m / 2
    #100点満点に換算
    @scoreBac100 = @scoreBac * 100 / 250
    #2.500点満点
    @score500 = @sum5 / 5
    #3.高得点の3教科
    @scoreTop3 = @sumTop3 / 3
    #4.国数英の3教科
    @scoreKSE = @sum3  / 3

    #格納して降順にソート
    @score = [@scoreBac100, @score500, @scoreTop3, @scoreKSE]
    @goal = @score.sort

  end
  def type4
    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @es = @shindan["essay"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    #主要５教科合計値
    @sum5 = @j + @m + @e + @sc + @so
    #主要５教科平均
    @ave = @sum5 / 5
    #国数英３教科合計
    @sum3 = @j + @m + @e
    #８教科合計値
    @sum8 = @j + @m + @e + @sc + @so + @es + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #主要5教科のうち高得点の3教科の合計点
    @sumTop3 =(@sort[4]+@sort[3]+@sort[2])

    #主要５教科のうち最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    #全ての基準で計算、最も高い点数を選ぶ
    #1.バカロレア
    @scoreBac = @es * 10 + @i * 5 + @g * 5 + @m / 2
    #100点満点に換算
    @scoreBac100 = @scoreBac * 100 / 250
    #2.500点満点
    @score500 = @sum5 / 5
    #3.高得点の3教科
    @scoreTop3 = @sumTop3 / 3
    #4.国数英の3教科
    @scoreKSE = @sum3  / 3

    #格納して降順にソート
    @score = [@scoreBac100, @score500, @scoreTop3, @scoreKSE]
    @goal = @score.sort

  end
  def type5
    @shindan = Shindan.find(params[:id])
    @j = @shindan["japanese"]
    @m = @shindan["math"]
    @e = @shindan["english"]
    @sc = @shindan["science"]
    @so = @shindan["society"]
    @es = @shindan["essay"]
    @i = @shindan["interview"]
    @g = @shindan["gd"]

    #主要５教科合計値
    @sum5 = @j + @m + @e + @sc + @so
    #主要５教科平均
    @ave = @sum5 / 5
    #国数英３教科合計
    @sum3 = @j + @m + @e
    #８教科合計値
    @sum8 = @j + @m + @e + @sc + @so + @es + @i + @g

    #教科を昇順で格納
    @subjects = [@j, @m, @e, @sc, @so] # データ配列subjects
    @sort = @subjects.sort #配列subjectsを昇順化

    #主要5教科のうち高得点の3教科の合計点
    @sumTop3 =(@sort[4]+@sort[3]+@sort[2])

    #主要５教科のうち最大値と最小値の差(一教科特化型か否かの判断に使用)
    @diff = @sort[4] - @sort[0]

    #全ての基準で計算、最も高い点数を選ぶ
    #1.バカロレア
    @scoreBac = @es * 10 + @i * 5 + @g * 5 + @m / 2
    #100点満点に換算
    @scoreBac100 = @scoreBac * 100 / 250
    #2.500点満点
    @score500 = @sum5 / 5
    #3.高得点の3教科
    @scoreTop3 = @sumTop3 / 3
    #4.国数英の3教科
    @scoreKSE = @sum3  / 3

    #格納して降順にソート
    @score = [@scoreBac100, @score500, @scoreTop3, @scoreKSE]
    @goal = @score.sort

  end

  private
  def shindan_params
    params.require(:shindan).permit(:japanese,:math,:english,:science,:society,:interview,:gd,:essay)
  end
end
