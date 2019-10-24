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

def apply_coupons(coupons, cart)
  coupons.map do |coupon|
    item = coupon[:item]
    if cart.has_key?(item)
      cart["#{item} W/COUPON"] = {:price => coupon[:cost]/coupon[:num], :clearance => cart[item][:clearance], :count => 0}
      while cart[item][:count] > 0 && coupon[:num] > 0 do
        cart[item][:count] -= 1
        cart["#{item} W/COUPON"][:count] += 1
        coupon[:num] -=1
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
