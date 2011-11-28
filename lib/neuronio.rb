class Neuronio

  attr_accessor :pesos

  def initialize(entradas, saidas_desejadas)
    @entradas = entradas
    @y_desejados = saidas_desejadas
    @pesos = []
    @limite = 0
    @erro = 0
    @limiar = 1

    @entradas.each { |entrada| entrada << 1 }

    @pesos = [0] * entradas.first.size
  end

  def testar_rede(entrada)
    net_teste = 0
    (0...entrada.size).each do |y|
      net_teste += entrada[y] * @pesos[y]
    end

    net_teste > 0
  end

    def treinar(index = 0)
    net = 0
    (0...@entradas[index].size).each do |y|
      net += @entradas[index][y] * @pesos[y]
    end
    @y_obtido = (net > 0 ? 1 : 0)
    @erro = @y_desejados[index] - @y_obtido

    if @erro != @limite
      (0...@entradas[index].size).each do |y|
        @pesos[y] = @pesos[y] + @limiar * @erro * @entradas[index][y]
      end
      index = 0
    else
      index += 1
    end
    treinar(index) unless index >= @entradas.size
  end
end

