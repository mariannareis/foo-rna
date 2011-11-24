class Neuronio

  attr_accessor :pesos

  def initialize(entradas, saidas_desejadas)
    @entradas = entradas
    @y_desejados = saidas_desejadas
    @pesos = []
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

  def testar_rede(entrada)
    net = 0
    for x in (0...entrada.size)
      net += entrada[x] * @pesos[x]
    end
    net > 0 ? @y_obtido = 1 : @y_obtido = 0
  end

  def treinar(entrada, index)
    testar_rede(entrada)
    @erro = @y_desejados[index] - @y_obtido

    if @erro != @limite
      for y in (0...entrada.size)
        @pesos[y] = @pesos[y] + @limiar * @erro * entrada[y]
      end
    end
  end

end 
