class String
    
    def flash
        1.times do
        print "\r#{ self }"
        sleep 0.5
        print "\r#{ ' ' * self.size }" # Send return and however many spaces are needed.
        sleep 0.5
        end
        self
    end

    def long_flash
        1.times do
            print "\r#{ self }"
            sleep 1
            print "\r#{ ' ' * self.size }" # Send return and however many spaces are needed.
            sleep 1
        end
        self
    end
    
end