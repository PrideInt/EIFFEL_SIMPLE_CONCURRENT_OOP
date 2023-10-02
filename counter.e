class
    COUNTER

create
    make

feature
    make(cid: STRING; cval: INTEGER; cspeed: INTEGER)
        require
            valid_id(cid)
            valid_val(cval)
        do
            id := cid
            val := cval
            speed := cspeed
        ensure
            id = cid
            val = cval
        end

feature
    valid_id(vid: like id): BOOLEAN
        do
            Result := vid /= ""
        end

    valid_val(vval: like val): BOOLEAN
        do
            Result := vval >= 0 and then vval < 20
        end

    valid_chosen(vchosen: INTEGER): BOOLEAN
        do
            Result := vchosen < 30
        end

feature
    id: STRING
    val: INTEGER
    speed: INTEGER

feature
    run
        do
            increment

            print(id + ": " + val.out)
            print("%N")
            (create {EXECUTION_ENVIRONMENT}).sleep(speed * 1_000_000)
        end

    chosen(get: INTEGER)
        do
            print("%N")
	    print("REVEALED! " + id + " has CHOSEN: " + get.out)
	    print("%N%N")
        end

    increment
        do
            val := val + 1
        end
end
