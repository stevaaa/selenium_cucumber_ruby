class ItemDetails < Page

def addToShoppingCart
	clickElementBy("name", "submit.add-to-cart")
end

end
