module UsersHelper

	def age(user, currdate=Date.today)
		if user.birthdate
			birthdate = user.birthdate
			#TODO: needs workaround for [2001-01-03 - 2004-02-29] case
			age = (currdate.year - birthdate.year) + ((currdate.month - birthdate.month) + ((currdate.day - birthdate.day) < 0 ? -1 : 0) < 0 ? -1 : 0)
			"#{age} years"
		end
	end

	def location(user)
		string = [user.city, user.region, user.country].map {|i| i if !i.nil? && !i.empty?}.compact.join(', ')
		"<span class=\"gray1\">from</span> #{string}" if !string.empty?
	end

	def full_name(user)
		if user.first_name == nil && user.second_name == nil
			"user id #{user.id}"
		else fullname = [user.first_name, user.second_name].join(' ')
		end
	end

	def show_avatar(user)
		if user.avatar
      picture = "/images/avatars/#{user.avatar}"
    else
      picture="/images/avatar_default.jpg"
    end
		image_tag(picture, :class => 'avatar')
	end

  def taglist(tags)
    tags.map do |t|
		  %{<a href="#">#{t.string}</a>}
		end.join(', ')
  end

end