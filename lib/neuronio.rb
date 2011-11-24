class Neuronio

  def initialize(entradas, saidas_desejadas, pesos, erro)
    @entradas = entradas
    @y_desejados = saidas_desejadas
    @pesos = pesos
    @limite = 0
    @erro = 0
    @limiar = 1

    for x in (0..@entradas.size + 1) #já acrescentando o bias
      @pesos << 0
    end

    for x in (0...@entradas.size) #já acrescentando o bias
      @entradas[x] << 1
    end
  end

  def treinar(entrada, index)
    net = 0
    for x in (0...entrada.size)
      net += entrada[x] * @pesos[x]
    end
    if net > 0
       @y_obtido = 1 
    else

      @y_obtido = 0
    end
   
    @erro = @y_desejados[index] - @y_obtido
    if @erro != @limite
      for y in (0...entrada.size)
        @pesos[y] = @pesos[y] + @limiar * @erro * entrada[y]
      end
    end
    return @erro
  end

  def testar_rede(entrada)
    net = 0
    for x in (0...entrada.size)
      net += entrada[x] * @pesos[x]
    end
    if net > 0
       @y_obtido = 1 
    else
      @y_obtido = 0
    end

  end


end 
