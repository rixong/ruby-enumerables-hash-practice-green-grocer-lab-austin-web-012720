def consolidate_cart(cart)
  new_cart = {}
  cart.map do |item|
    item.each_pair do |(key,value)|
      if !new_cart.has_key?(key)
        new_cart[key] = value
        new_cart[key][:count] = 1
      else 
        new_cart[key][:count] +=1
      end
    end
  end
return new_cart
end

def apply_coupons(cart, coupons)
  # code here
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
