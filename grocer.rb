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

def apply_clearance (cart)
  cart.each do |(key, value)|
    if value[:clearance]
      value[:price] = (value[:price]*0.8).round(2)
    end
  end
end

def checkout (cart_items, coupons)
  consolidated_cart = consolidate_cart(cart_items)
  cart_after_coupons = apply_coupons(consolidated_cart, coupons)
  final_cart = apply_clearance(cart_after_coupons)
  ### totals cart
  puts final_cart
  total = final_cart.reduce(nil) do |memo, (key,value)|
    memo = 0 if !memo
    memo = memo += value[:count]*value[:price]
    memo
  end
  ### checks to apply addditional 10% discount 
  return total >100 ? total*0.9 : total
end
