def consolidate_cart(items)
  cart = {}
  items.map do |item|
    item.each_pair do |(key,value)|
      if !cart.has_key?(key)
        cart[key] = value
        cart[key][:count] = 1
      else 
        cart[key][:count] +=1
      end
    end
  end
return cart
end

def apply_coupons(coupons, cart) ## assumes coupons can ONLY be used if buying at least number indicated on coupon
  coupons.map do |coupon|
    item = coupon[:item]
    if cart.has_key?(item) && cart[item][:count] >= coupon[:num]
      cart["#{item} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[item][:clearance], :count => coupon[:num]}
      cart[item][:count] -= coupon[:num]
      if cart[item][:count] == 0
        cart.delete(item)
      end
    end
  end
  return cart
end

def apply_clearance (cart)
  cart.each do |(key, value)|
    if value[:clearance]
      value[:price] = (value[:price]*0.8).round(2)
    end
  end
end

def checkout(cart, coupons)
  # code here
end
