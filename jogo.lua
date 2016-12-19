		local composer = require( "composer" )
		local scene = composer.newScene()
		local audio = require("audio")
			
			


		r=0	
		
	
		
		largura= display.contentWidth
		altura = display.contentHeight
		
		groupo = display.newGroup()
		grupoJogador = display.newGroup() 
		
		te =audio.loadStream( "laser.mp3" )
			
	
		function atirar(event)
		
		bala.y = 370
		bala.x = largura/2
			if ( event.phase == "began" ) then
				audio.play( te )
				timerMovimentaTiro = timer.performWithDelay( 20,  movimentaTiro, 50)
			
				
			
				
				
			end
					
			

		end	
		
		 function movimentaNaveEsquerda(event)
	
	
			if(grupoJogador.x == 20) then
		
			else
			if ( event.phase == "began" ) then
			
				grupoJogador.x = grupoJogador.x - 10
				
		
			end
			end
		print("posição x do grupoJogador".. grupoJogador.x)

		end
		function movimentaNaveDireita(event)
	
			if(grupoJogador.x == 290) then
		
			else
			if ( event.phase == "began" ) then
			
				grupoJogador.x = grupoJogador.x + 10
				
		 
			end
			end
		print("posição x do grupoJogador".. grupoJogador.x)

		end
		

		
		nave1 = display.newImage( "nave0.png",40, 30 )
		--nave1:translate( 40, 30)
		
		nave2 = display.newImage( "nave0.png",90,30 )
		--nave2:translate( 90, 30)
		
		nave3 = display.newImage( "nave0.png",140,30 )
		--nave3:translate( 140, 30)

		nave4 = display.newImage( "nave0.png",190,30 )
		--nave4:translate( 190, 30)
		
		nave5 = display.newImage( "nave01.png",40, 70 )
		--nave5:translate( 40, 70)
	
		nave6 = display.newImage( "nave01.png",90,70 )
		--nave6:translate( 90, 70)
		
		nave7 = display.newImage( "nave01.png",140,70 )
		--nave7:translate( 140, 70)
		
		nave8 = display.newImage( "nave01.png",190,70 )
		--nave8:translate( 190, 70)
		
		jogador = display.newImage( "nave.png" )
		jogador:translate( largura/2, 400)

		bala =display.newImage("tiro.bmp")
		bala:translate( largura/2, 370)
		bv= bala.contentBounds
	
		tiroJogador = display.newCircle( largura - 40, altura, 20, 20)
		tiroJogador:addEventListener("touch", atirar)

		
		direita =  display.newImage( "direitavermelha.png" )
		direita:translate( largura-130, altura)
		direita:addEventListener("touch", movimentaNaveDireita)
		
		esquerda =  display.newImage( "esquerda.png" )
		esquerda:translate( largura-260, altura)
		esquerda:addEventListener("touch", movimentaNaveEsquerda)

		balaAliens =display.newImage("tiro.bmp", 200, groupo.y/2)
		ba = balaAliens.contentBounds
		
		
		tiroTexto = display.newText("tiro",largura-40, altura, native.systemFont, 20 )
		tiroTexto:setFillColor(0.3)
		
		groupo:insert( nave1 )
		groupo:insert( nave2 )
		groupo:insert( nave3 )
		groupo:insert( nave4 )
		groupo:insert( nave5 )
		groupo:insert( nave6 )
		groupo:insert( nave7 )
		groupo:insert( nave8 )
	
		grupoJogador:insert(jogador)
		grupoJogador:insert(bala)
		boundsGrupoJogador = grupoJogador.contentBounds
		
		
		
		-- "scene:create()"
	
	
		function scene:create( event )
		
	

		local sceneGroup = self.view
		
		end
			-- "scene:show()"
		function scene:show( event )
		
			local sceneGroup = self.view
			local phase = event.phase


			if ( phase == "will" ) then
	
				pararGrupo =timer.performWithDelay( 500, movimentaGrupo, 0)
				
				pararBala=timer.performWithDelay(20, movimentaBalaAliens, 380)
				timer.performWithDelay(30, verificaBala, 0)
				pararTiro=timer.performWithDelay(200, tiroAliens, 0)
				timer.performWithDelay(100, verificaColisao, 0)
				timer.performWithDelay(100, verificaColisaoJogador, 0)

			elseif ( phase == "did" ) then
	
			end
		end

		-- "scene:hide()"
		function scene:hide( event )

			local sceneGroup = self.view
			local phase = event.phase

			if ( phase == "will" ) then

			elseif ( phase == "did" ) then
	
			end
		end

		-- "scene:destroy()"
		function scene:destroy( event )

		local sceneGroup = self.view

		end

		---------------------------------------------------------------------------------
		
		-- Listener setup
		scene:addEventListener( "create", scene )
		scene:addEventListener( "show", scene )
		scene:addEventListener( "hide", scene )
		scene:addEventListener( "destroy", scene )
		
	
	function movimentaGrupo()
	
	
		lar = 10
		alt = 20
	
		if (groupo.x== 100) then
	
	
			groupo.y = groupo.y + alt
			pararTeste =timer.performWithDelay( 500, teste, 0)
				
	
	else
		groupo.x = groupo.x + lar
	end
	end
		
	
		function teste()
		
			groupo.x = groupo.x - 10
		
	
			if(groupo.x <= 0) then
				groupo.x = groupo.x+10
				groupo.y = groupo.y + 20
				timer.performWithDelay( 500, movimentaGrupo, 0)
			end
		end
		
		

		function movimentaTiro()
	
	
			bala.y = bala.y -10
			bv= bala.contentBounds
	
		end
		
		
			

	
		
		
		function verificaColisao()
		
		
			for i=1, groupo.numChildren do
			atualX, atualY= groupo[i]:localToContent( 0,0 )
			
			local bounds = groupo[i].contentBounds
			 
			
				
				if(bv.xMin == bounds.xMax and bv.yMin == bounds.yMax) then
			
				groupo[i]:removeSelf()
			
				
				break
			
			end
			end
		
		
		end
		
		function tiroAliens()
		quantidade=0
		for i=1, groupo.numChildren do
			atualX, atualY= groupo[i]:localToContent( 0,0 )
			if(balaAliens.y > 400) then
				r = math.random(1,8)
				
				if(r == 1) then
					balaAliens.x=atualX
					balaAliens.y=atualY
				
				end
				if(r == 2) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
					if(r == 3) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
				
					if(r == 4) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
					if(r == 5) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
					if(r == 6) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
				
					if(r == 7) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
					if(r == 8) then
					balaAliens.x=atualX
					balaAliens.y=atualY
			
				end
			else
			
			
		
			
				
			balaAliens.y = balaAliens.y +10
			ba= balaAliens.contentBounds
			
			print("Bala Aliens X".. balaAliens.x )
			end
		
		end
		
	
		end
		function movimentaBalaAliens()
		
		
			
		end
		
	
		
		
		function verificaColisaoJogador()
		
		 
		
		
			if(ba.xMax == boundsGrupoJogador.xMin and ba.yMax <= boundsGrupoJogador.yMin) then
			jogador:removeSelf()
			bala:removeSelf()
			
			
			 timer.cancel(pararGrupo)
			 timer.cancel(pararBala)
			 timer.cancel(pararTiro)
			
			bala = display.newImage("")
			jogador = display.newImage( "" )
			balaAliens:removeSelf()
			balaAliens = display.newImage("")
			
			 gameOver = display.newText( "Game Over", 160,250, native.systemFont, 50 )
			
			end
		end
		
		

		return scene
		

		
