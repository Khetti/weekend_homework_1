def pet_shop_name(name)
  return name[:name]
end

def total_cash(cash)
  return cash[:admin][:total_cash]
end

def add_or_remove_cash(total_cash, cash)
  return total_cash[:admin][:total_cash] += cash
end
