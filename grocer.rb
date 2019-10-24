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
  coupons.map do |coupon|
    item = coupon[:item]
    if cart.has_key?(item) && cart[item][:count] >= coupon[:num]
      if cart.has_key?("#{item} W/COUPON")
        cart["#{item} W/COUPON"][:count] += coupon[:num]
      else
        cart["#{item} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[item][:clearance], :count => coupon[:num]}
      end
      cart[item][:count] -= coupon[:num]
    end
  end
  return cart
end

def apply_clearance(cart)
  # code here
end

def checkout(cart, coupons)
  # code here
end
