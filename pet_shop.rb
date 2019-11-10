# function purpose: "What is the shop name?"
# access the data(hash) and return the value attached to :name
def pet_shop_name(shop_name)
  return shop_name[:name]
end

# function purpose: "How much cash does the shop have?"
# access the data(hash) and return the value attached to :total_cash
def total_cash(shop_cash)
  return shop_cash[:admin][:total_cash]
end

# function purpose: ""
# the test is providing us with the arguments "10" for one test and "-10"
# for another. there's probably a better way to perform a subtraction that
# doesn't require input of a negative number, but for now we just need
# to add whatever the argument is to our total.
def add_or_remove_cash(shop_cash, cash)
  return shop_cash[:admin][:total_cash] += cash
end

# access the data(hash) and return the value attached to :pets_sold
def pets_sold(pets_total)
  return pets_total[:admin][:pets_sold]
end

def increase_pets_sold(current_sold, new_sold)
  return current_sold[:admin][:pets_sold] += new_sold
end

def stock_count(stock)
  return stock[:pets].length()
end

# function purpose: "How many of this breed do we have?"
# the test is going to perform the count method with the string argument
# "british shorthair" for whatever we produce, so we need to return an array
# with all instances of that argument to be counted.
# can only seem to return an empty string, unsure how to fix that
# function now returns a count of 3, when it should be 2 - i have no idea why
def pets_by_breed(all_pets, shorthair)
  search_results = []
  for pet in all_pets
    if all_pets[:pets][0][:breed] == shorthair
      search_results << shorthair
    end
  end
  return search_results
end

# look for a pet named "Arthur" and if found, return that name as a string
# likely need to use index method, as this returns nil if there is no match
# however, i think the test will return as a failure because it won't accept
# an index, it's looking for a string. maybe .to_s would work?
# error: undefined method '[]' for nil:NilClass
def find_pet_by_name(all_names, name_to_find)
  for name in all_names
    if all_names[:pets][0] == name_to_find
      return all_names[:pets][0].index
    else
      return nil
    end
  end
end

# this function should remove a given pet from the array and return
# a nil. a return shouldn't be required, as the test will check the hash
# value once run.
# the .delete method works based on index values, so i might need to
# run .index first to locate the pet, then delete it using that value
def remove_pet_by_name(all_pets, removed_pet)
  pet_location = all_pets[:pets][0].index(removed_pet)
  all_pets[:pets][0].delete(pet_location)
end

# push a new hash entry into our pets array of hashes
def add_pet_to_stock(current_stock, pet_to_add)
  current_stock[:pets] << pet_to_add
end

# i think the test is asking to check the cash of the first customer in
# the array, so at index 0. the below function does that, as the index
# value is being passed in as an argument from @customer[0]
def customer_cash(customer)
  return customer[:cash]
end

# we're subtracting cash from the first customer in the array
# i don't think a return is needed here, as the test is accessing the
# hash value to verify the result
def remove_customer_cash (customer, cash_for_removal)
  customer[:cash] -= cash_for_removal
end

# this test wants to know how many pets a customer owns and is expecting
# a return of "0". i think returning the array contents will result in a
# 'nil' value, so performing the .length method is likely the best way
# to proceed
# update: tested without .length method, function returns empty string
# not a nil, but test does not accept this. length returns 0 and passes
def customer_pet_count(customer)
  return customer[:pets].length
end

# we're adding a pet to the customer at index 0, and using our previous
# function to check, expecting an array length of 1. pushing the new pet
# onto the array should accomplish this
def add_pet_to_customer(customer, pet_to_add)
  customer[:pets] << pet_to_add
end

# this function will compare the value held for :cash in a given customer,
# to the :price of a given pet. In this case, we're comparing cash 1000
# to a price of 100, so we will expect a value of true.
# i'm going to try a "greater than or equal to" comparison in an if.
# the function should also work if the customer cannot afford the pet
def customer_can_afford_pet(customer, pet)
  return customer[:cash] >= pet[:price]
end

# here a customer is buying a pet, and the test is checking to see that their
# total number of pets, the number of pets the shop has sold, the customer's
# cash and the shop's cash are being appropriately altered to their new
# values
# the function should push arthur onto the customer's pets array,
# subtract his price from the customer's cash, and add that cash to the
# shop total cash.
def sell_pet_to_customer(all_pets, buy_pet, customer_buying)
  customer_buying[:pets] << buy_pet
  all_pets[:admin][:pets_sold] + 1
  customer_buying[:cash] = customer_buying[:cash] - buy_pet[:price]
  all_pets[:admin][:total_cash] = all_pets[:admin][:total_cash] + buy_pet[:price]
end
