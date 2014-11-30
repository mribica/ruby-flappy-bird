Shoes.app :width => 300 do
  background "assets/bg.png"
  @gravity = 0
  @bird_x = 0.5
  @bird_y = 0

  @bird = image "assets/bird.png"
  @bird.move @bird_x, @bird_y

  @pipe_x = 0.9
  @pipe_y = 0.7
  @pipe = image "assets/pipe.png"
  @pipe.move @pipe_x, @pipe_y

  @rotation = 0

  @animate = animate(20) do
    @gravity = @gravity + 0.002
    @bird_y = @bird_y + @gravity
    @bird.move @bird_x, @bird_y

    if @gravity > 0
      @bird.rotate(-@rotation)
      @bird.rotate(-30)
      @rotation = -30
    end

    @pipe_x = @pipe_x - 0.02
    if @pipe_x < -0.2
      @pipe_x = 0.9
    end
    @pipe.move @pipe_x, @pipe_y

    if @bird_y > 1
      title "Game over!"
      @animate.stop
    end

    if @pipe_x < 0.6 && @pipe_x > 0.3 && @bird_y > @pipe_y
      title "Game over!"
      @animate.stop
    end
  end

  keypress do |key|
    @gravity = -0.02
    @bird.rotate(-@rotation)
    @bird.rotate(30)
    @rotation = 30
  end
end
