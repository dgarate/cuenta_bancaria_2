class CuentaBancaria 
        attr_accessor :banco, :cuenta, :saldo
        def initialize(banco,cuenta, saldo=0)
            @banco = banco
            @cuenta = cuenta
            @saldo = saldo
        end

        def transferir(monto, otra_cuenta)
            @saldo = @saldo - monto
            otra_cuenta.saldo = otra_cuenta.saldo + monto
        end 
end

class Usuario
    attr_accessor :nombre
    def initialize(nombre, arr_ctas)
        @nombre = nombre
        @arr_cta = arr_ctas
    end

    def saldo_total()
        total = 0
        @arr_cta.each do |cuenta|
        total += cuenta.saldo
        end
        total
    end         
end


cuenta1= CuentaBancaria.new('itau','345666',5000)
cuenta2= CuentaBancaria.new('santander','5655666',5000)
cuenta3= CuentaBancaria.new('XDS','5655666',5000)
cuenta4= CuentaBancaria.new('XDS','5655666',50000)

usuario1= Usuario.new('pepe', [cuenta3, cuenta4])

cuenta1.transferir(5000, cuenta2)

print cuenta1.inspect
print cuenta2.inspect
print usuario1.saldo_total
