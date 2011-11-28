require 'neuronio'

describe Neuronio do

  before(:each) do
      @um1=    [0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0]
      @um2=    [0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0]
      @um3=    [0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 0]

      @zero1=  [0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0]
      @zero2=  [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1]
      @zero3=  [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0]

      @cinco1= [0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0]
      @cinco2= [0, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, 1, 0]
      @cinco3= [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1]
      @entradas = [@um1,@um2,@um3,@zero1,@zero2,@zero3,@cinco1,@cinco2,@cinco3]

      @y_desejado_1 = [1,1,1,0,0,0,0,0,0]

      @y_desejado_0 = [0,0,0,1,1,1,0,0,0]

      @y_desejado_5 = [0,0,0,0,0,0,1,1,1]      
  end

it 'treina a rede para reconhecer o numero 0' do
    entradas = Neuronio.new(@entradas, @y_desejado_0)    
    for x in (0...@entradas.size)
      entradas.treinar(@entradas[x], x) #envio a entrada e o index da entrada enviada
    end
    entradas.pesos.should == [0,-1,-1,-1,-1,0,0,-1,0,0,1,0,0,-1,-1,-1,0,0,0,0,-1,-1,-1,0,0,1,0,0,-1,0,0,-1,-1,-1,-1,0,-1]
    entradas.testar_rede(@um1).should == 0    #deveria ser 1
    entradas.testar_rede(@um2).should == 0    #deveria ser 1
    entradas.testar_rede(@um3).should == 0    #deveria ser 1
    entradas.testar_rede(@zero1).should == 0  #deveria ser 1
    entradas.testar_rede(@zero2).should == 0  #deveria ser 1
    entradas.testar_rede(@zero3).should == 0  #deveria ser 1
    entradas.testar_rede(@cinco1).should == 0 
    entradas.testar_rede(@cinco2).should == 0
    entradas.testar_rede(@cinco3).should == 0
  end

  it 'treina a rede para reconhecer o numero 5' do
    entradas = Neuronio.new(@entradas, @y_desejado_5)    
    for x in (0...@entradas.size)
      entradas.treinar(@entradas[x], x) #envio a entrada e o index da entrada enviada
    end
    entradas.pesos.should == [0,1,1,1,1,0,0,1,0,0,0,0,0,1,1,1,1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,1,1,1,1,0,1]
    entradas.testar_rede(@um1).should == 1    #deveria ser 0
    entradas.testar_rede(@um2).should == 1    #deveria ser 0
    entradas.testar_rede(@um3).should == 1    #deveria ser 0
    entradas.testar_rede(@zero1).should == 1  #deveria ser 0
    entradas.testar_rede(@zero2).should == 1  #deveria ser 0
    entradas.testar_rede(@zero3).should == 1  #deveria ser 0
    entradas.testar_rede(@cinco1).should == 1
    entradas.testar_rede(@cinco2).should == 1
    entradas.testar_rede(@cinco3).should == 1
  end

  it 'treina a rede para reconhecer o numero 1' do
    entradas = Neuronio.new(@entradas, @y_desejado_1)    
    for x in (0...@entradas.size)
      entradas.treinar(@entradas[x], x) #envio a entrada e o index da entrada enviada
    end
    entradas.pesos.should == [0,-1,-1,0,-1,0,0,-1,0,1,-1,0,0,-1,0,1,-1,0,0,-1,0,1,-1,0,0,-1,0,1,-1,0,0,-1,-1,0,-1,0,0]
    entradas.testar_rede(@um1).should == 1
    entradas.testar_rede(@um2).should == 1
    entradas.testar_rede(@um3).should == 1
    entradas.testar_rede(@zero1).should == 0
    entradas.testar_rede(@zero2).should == 0
    entradas.testar_rede(@zero3).should == 0
    entradas.testar_rede(@cinco1).should == 0
    entradas.testar_rede(@cinco2).should == 0
    entradas.testar_rede(@cinco3).should == 0
  end

  


end


