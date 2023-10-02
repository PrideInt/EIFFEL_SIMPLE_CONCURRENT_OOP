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
	randomized: LINKED_LIST[INTEGER]
	rand: RANDOM

	random: INTEGER

feature {NONE} -- Initialization
	make
		do
			-- Counters that will increment by 1 (NEVER go above 100)
			-- While choosing a random integer every iteration.
			-- Reveals itself when current iteration matches the chosen number.
			-- Very basic SCOOP.

			print ("Start presentation!%N")
			create counters.make
			create randomized.make
			create rand.make

			rand.forth

			counters.extend(create {COUNTER}.make("counter 1", 0, 150))
			counters.extend(create {COUNTER}.make("counter 2", 0, 200))
			counters.extend(create {COUNTER}.make("counter 3", 0, 75))

			across 1 |..| 29 as itr loop
				random := get_random(50)
				randomized.extend(random)

				across counters is counter loop
					separate counter as ct do
						ct.run

						across randomized is r loop
							if ct.val = r then
								across 1 |..| get_random(3) is i loop
									ct.run
								end
								ct.chosen(r)
							end
						end
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
