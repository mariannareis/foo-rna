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
    entradas.treinar() #envio a entrada e o index da entrada enviada
    entradas.testar_rede(@um1).should be_false
    entradas.testar_rede(@um2).should be_false
    entradas.testar_rede(@um3).should be_false
    entradas.testar_rede(@zero1).should be_true
    entradas.testar_rede(@zero2).should be_true
    entradas.testar_rede(@zero3).should be_true
    entradas.testar_rede(@cinco1).should be_false
    entradas.testar_rede(@cinco2).should be_false
    entradas.testar_rede(@cinco3).should be_false

    puts "Pesos do neuronio 0 \n" + entradas.pesos.inspect
  end

  it 'treina a rede para reconhecer o numero 5' do
    entradas = Neuronio.new(@entradas, @y_desejado_5)
    entradas.treinar() #envio a entrada e o index da entrada enviada
    entradas.testar_rede(@um1).should be_false
    entradas.testar_rede(@um2).should be_false
    entradas.testar_rede(@um3).should be_false
    entradas.testar_rede(@zero1).should be_false
    entradas.testar_rede(@zero2).should be_false
    entradas.testar_rede(@zero3).should be_false
    entradas.testar_rede(@cinco1).should be_true
    entradas.testar_rede(@cinco2).should be_true
    entradas.testar_rede(@cinco3).should be_true

    puts "Pesos do neuronio 5 \n" + entradas.pesos.inspect
  end

  it 'treina a rede para reconhecer o numero 1' do
    entradas = Neuronio.new(@entradas, @y_desejado_1)
    entradas.treinar() #envio a entrada e o index da entrada enviada
    entradas.testar_rede(@um1).should be_true
    entradas.testar_rede(@um2).should be_true
    entradas.testar_rede(@um3).should be_true
    entradas.testar_rede(@zero1).should be_false
    entradas.testar_rede(@zero2).should be_false
    entradas.testar_rede(@zero3).should be_false
    entradas.testar_rede(@cinco1).should be_false
    entradas.testar_rede(@cinco2).should be_false
    entradas.testar_rede(@cinco3).should be_false

    puts "Pesos do neuronio 1 \n" + entradas.pesos.inspect
  end

  it "testa com exmplos novos" do
    novo_um1 = [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0]
    novo_um2 = [0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]

    entradas = Neuronio.new(@entradas, @y_desejado_1)
    entradas.treinar() #envio a entrada e o index da entrada enviada
    entradas.testar_rede(novo_um1).should be_true
    entradas.testar_rede(novo_um2).should be_true
  end
end

