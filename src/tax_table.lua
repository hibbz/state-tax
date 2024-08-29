local Utils = require "src/models.Utils"
local Constants = require "src/models.constants" --move everything to source


function Ask_state()
    print("Enter state")

    local selected_state = io.read();

    return selected_state
end

function Return_taxrate(the_array, str) --kinda looks like this
    for i = 1,#the_array,1
    do
        local x = (the_array[i])
        if ((string.lower(x[1]) == string.lower(str)) or (string.lower(x[2]) == string.lower(str))) then
            return {x[2]}
        end
    end
end

Utils.Print_array(Constants.State_list)
local state = Ask_state()
local state_info = Return_taxrate(Constants.State_taxrate, state) -- Experimental
if state_info then
    print("State "..state_info[1].." exists")
    print("What would you like to know...", "State Tax - State Tree" )
else
    print(state.." is not a state")
end

-- function Return_taxrate(the_array, str)
--     for i = 1,#the_array,1
--     do
--         local x = (the_array[i])
--         if ((string.lower(x[1]) == string.lower(str)) or (string.lower(x[2]) == string.lower(str))) then -- look below
--             return {x[2], x[3]}
--         end
--     end
-- end

-- Utils.Print_array(Constants.State_list)
-- local state = Ask_state()
-- local state_info = Return_taxrate(Constants.State_taxrate, state) -- Original ask for state  then give state and taxrate
-- if state_info then
--     print("State "..state_info[1].." exists")
--     print("Tax rate is "..state_info[2])
-- else
--     print(state.." is not a state")
-- end-- hello

