note
	description: "eiffel-presentation application root class"
	date: "$Date$"
	revision: "$Revision$"

class
	APPLICATION

inherit
	ARGUMENTS_32

create
	make

feature
	counters: LINKED_LIST[separate COUNTER]
	rand: RANDOM

feature {NONE} -- Initialization
	make
		do
			-- Counters that will increment by 1 (NEVER go above 50)
			-- While choosing a random integer every iteration.
			-- Reveals itself when current iteration matches the chosen number.
			-- Very basic SCOOP.

			print ("Start presentation!%N")
			create counters.make
			create rand.make
			rand.forth

			counters.extend(create {COUNTER}.make("counter 1", 1, 150))
			counters.extend(create {COUNTER}.make("counter 2", 1, 200))
			counters.extend(create {COUNTER}.make("counter 3", 1, 75))

			across 1 |..| 29 as itr loop
				across counters is counter loop
					separate counter as ct do
						ct.run
						ct.chosen(get_random(30))
					end
				end
			end
		end

	randomize: INTEGER
		do
        	rand.forth
    		Result := rand.item
		end

	get_random(bound: INTEGER): INTEGER
		do
			Result := randomize \\ bound + 1
		end
end
