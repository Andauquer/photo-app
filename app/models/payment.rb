class Payment < ActiveRecord::Base
  # Aunque no guardaremos estos atributos en nuestra BD, la clase necesita trabajar con ellos
  # para enviarlos a Stripe a traves de JSs
  attr_accessor :card_number, :card_cvv, :card_expires_month, :card_expires_year
  belongs_to :user
  
  # Proceso para mostrar los meses de un objeto pago
  def self.month_options
    Date::MONTHNAMES.compact.each_with_index.map { |name, i| ["#{i+1} - #{name}", i+1]}
  end
  
  # Proceso para mostrar los años de un objeto pago
  def self.year_options
    (Date.today.year..(Date.today.year+10)).to_a
  end
  
  # Proceso para crear el pago
  def process_payment
    customer = Stripe::Customer.create email: email, card: token
    
    Stripe::Charge.create customer: customer.id,
    # Esta cantidad es en centavos.
                          amount: 1000,
                          description: 'Premium',
                          currency: 'usd'
  end
end
