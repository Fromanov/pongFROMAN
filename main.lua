player1 = {}
player2 = {}
ball = {} --Hey

function love.load()

   width, height = love.graphics.getDimensions( )

   player1.x = 10
   player1.y = height/2
   player1.speed = 5
   player1.score = 0
   
   player2.x = width - 20
   player2.y = height/2
   player2.speed = 5
   player2.score = 0 
   
   ball.x = width/2
   ball.y = height/2
   ball.speedX = 3
   ball.speedY = 0
   
   size = 10
   rabota = false
   
end

function love.update(dt)
   
   movement(player1, 'w', 's')
   movement(player2, 'up', 'down')
   
   ballMovement()
   ballBounce()
   scoreCount()
   
end

function movement(playerN, buttonUP, buttonDOWN)
   if love.keyboard.isDown(buttonUP) then
      if playerN.y >= 0 then  
        playerN.y = (playerN.y - playerN.speed)
      end	  
   elseif love.keyboard.isDown(buttonDOWN) then
      if playerN.y <= height - 30 then
		playerN.y = (playerN.y + playerN.speed)
	  end
   end
   
   if player1.y + 60 >= height then
	  player1.y = height - 60
   elseif player1.y <= 0 then
      player1.y = 0
   end 
   
   if player2.y + 60 >= height then
	  player2.y = height - 60
   elseif player2.y <= 0 then
      player2.y = 0
   end
   
end

function ballMovement()
	ball.x = ball.x + ball.speedX
	ball.y = ball.y + ball.speedY
end

function ballBounce()
	if ball.x + 5 >= player2.x and ball.x + 5 >= player2.x  and ball.y >= player2.y and ball.y <= player2.y + 60 then --правая ракетка--
		if ball.y >= player2.y and ball.y <= player2.y + 14 then --0-14
			ball.speedX = ball.speedX * -1
			ball.speedY = -4
		elseif ball.y >= player2.y + 15 and ball.y <= player2.y + 29 then  --15 29
			ball.speedX = ball.speedX * -1
			ball.speedY = -2	
		elseif ball.y >= player2.y + 30 and ball.y <= player2.y + 44 then  --30 -44
			ball.speedX = ball.speedX * -1
			ball.speedY = 2
		elseif ball.y >= player2.y + 45 and ball.y <= player2.y + 60 then  --45 60
			ball.speedX = ball.speedX * -1
			ball.speedY = 4	
		end
	end
	
	if ball.x <= player1.x + 5 and ball.x - 5 <= player1.x and ball.y >= player1.y and ball.y <= player1.y + 60 then --левая ракетка--
		if ball.y >= player1.y and ball.y <= player1.y + 14 then --0-14
			ball.speedX = ball.speedX * -1
			ball.speedY = -4
		elseif ball.y >= player1.y + 15 and ball.y <= player1.y + 29 then  --15 29
			ball.speedX = ball.speedX * -1
			ball.speedY = -2	
		elseif ball.y >= player1.y + 30 and ball.y <= player1.y + 44 then  --30 -44
			ball.speedX = ball.speedX * -1
			ball.speedY = 2
		elseif ball.y >= player1.y + 45 and ball.y <= player1.y + 60 then  --45 60
			ball.speedX = ball.speedX * -1
			ball.speedY = 4	
		end
	end
	
	if ball.y + 10 <= 0 then
		ball.speedY = ball.speedY * -1
	end
	
	if ball.y + 10 >= 750 then
		ball.speedY = ball.speedY * -1
	end
end

function scoreCount()
	if ball.x  <= 0 then		
		player2.score = player2.score + 1
		ball.x = width/2
		ball.y = height/2
		ball.speedX = 3
		ball.speedY = 0
	end
	
	if ball.x >= 750 then
		player1.score = player1.score + 1
		ball.x = width/2
		ball.y = height/2
		ball.speedX = -3
		ball.speedY = 0
	end
end

function love.draw()
   love.graphics.setColor(255, 255, 255)
   love.graphics.rectangle("fill", player1.x, player1.y, 10, 60)
   
   love.graphics.rectangle("fill", player2.x, player2.y, 10, 60)
   
   love.graphics.rectangle("fill", ball.x, ball.y, 10, 10)
   
   love.graphics.print (ball.x, 10,10)
   love.graphics.print (ball.y, 10,20)
   love.graphics.print (ball.speedX, 10,30)
   love.graphics.print (ball.speedY, 10,40)
   love.graphics.print (player1.score, 320, 50)
   love.graphics.print (player2.score, 340, 50)
   
end