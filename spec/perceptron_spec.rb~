require 'neuronio'

describe Neuronio do

  before(:each) do
      x1 = [1,1,0]
      x2 = [1,0,0]
      @entradas = [x1, x2]
      @y_desejados = [1,0]
  end

  it 'treina a rede para reconhecer o numero 1' do
    @entradas.should == [[1, 1, 0], [1, 0, 0]]
    entradas = Neuronio.new(@entradas, @y_desejados)    
    for x in (0...@entradas.size)
      entradas.treinar(@entradas[x], x) #envio a entrada e o index da entrada enviada
    end
    entradas.pesos.should == [0,1,0,0]
    entradas.testar_rede([1,1,0]).should == 1
    entradas.testar_rede([1,0,0]).should == 0
  end

end


