# Person Tag - Defines a tag for referencing people throughout the site.
# Usage:
#   {% person name %}               -> Insert's the person's display_name
#   {% person name 's %}            -> Append 's to the person's display name
#   {% person name Display Name %}  -> Use "Display Name" instead
#
# Examples
# Congrats to {% person doe %} for          -> Congrats to John Doe
# {% person doe 's %} code is neat          -> John Doe's code is neat
# Bob, Sam and {% person doe Johnny %}      -> Bob, Sam and Johnny
#
# Links to webpages
# If a 'webpage' has been defined for person, a hyperlink to that page will
# be inserted instead.

module Jekyll
    class PersonTag < Liquid::Tag

      def initialize(tag_name, text, tokens)
        super
        var = text.strip.split(" ", 2)
        @user = var[0]
        if var.length() == 2
            @name = var[1]
        else
            @name = nil
        end
      end

      def render(context)
        # Get user info from _data/people.yml
        people = context.registers[:site].data["people"]
        if not people.key?(@user)
            raise "Unknown user: #{@user}"
        end

        # Get User's display name
        user_info = context.registers[:site].data["people"][@user]
        if @name
            if @name == "'s"
                # Use possesive name
                name = user_info["display_name"]+"'s"
            else
                # Use provided name
                name = @name
            end
        else
            # Use display name
            name = user_info["display_name"]
        end

        # Check if user has a webpage
        if user_info.key?("webpage")
            webpage = user_info["webpage"]
            return "<a href=\"#{webpage}\">#{name}</a>"
        else
            return "#{name}"
        end
      end
    end
  end

  Liquid::Template.register_tag('person', Jekyll::PersonTag)
