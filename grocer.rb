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

def apply_coupons(cart, coupons) ## assumes coupons can only be used if buying at least number indicated on coupon
  coupons.map do |coupon|
    item = coupon[:item]
    if cart.has_key?(item) && cart[item][:count] >= coupon[:num]
      cart["#{item} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[item][:clearance], :count => coupon[:num]}
      cart[item][:count] -= coupon[:num]
      # if cart[item][:count] == 0
      #   cart.delete(item)
      # end
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
