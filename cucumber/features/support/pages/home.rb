class Home < Page
	def openSite(site)
			@driver.get site
		end
end
