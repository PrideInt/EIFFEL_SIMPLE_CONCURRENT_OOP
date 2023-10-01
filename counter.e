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
            if val < 50 then
                increment

                print(id + ": " + val.out)
                print("%N")
            end
            (create {EXECUTION_ENVIRONMENT}).sleep(speed * 1_000_000)
        end

    chosen(get: INTEGER)
        require
            valid_chosen(get)
        do
            if val = get then
                print("%N")
				print("REVEALED! " + id + " has CHOSEN: " + get.out)
				print("%N%N")
            end
        ensure
            get = 2
        end

    increment
        do
            val := val + 1
        end
end
