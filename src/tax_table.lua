local Utils = require "src.Utils"
local Constants = require "src.constants" --move everything to source




function Ask_state()
    print("Enter state")
    local selected_state = io.read();
    return selected_state
end





Utils.Print_array(Constants.State_list)
local state = Ask_state()

function Return_taxrate(the_array, str)
    for i = 1, #the_array, 1 do
        local x = (the_array[i])
        if ((string.lower(x[1]) == string.lower(str)) or (string.lower(x[2]) == string.lower(str))) then
            return x[2]
        end
    end
    print(state .. " is not a state")
end


State_info = Return_taxrate(Constants.State_taxrate, state)

function Ask_info()
    print("What would you like to know about " .. State_info .. ":", "\n1 - Sales Tax\n2 - State Tree\n3 - Most Famous For".. "\n (Enter Number)")
    -- print("What would you like to know about " .. State_info .. ":", "\n Sales Tax - State Tree - Most Famous For")
    local selected_info = io.read();
    return selected_info
end

-- function State_check(The_array)
--     for i = 1, #The_array, 1 do
--         local x = (The_array[i])
--         if State_info ~= (x[1]) or State_info ~= (x[2]) then
--             print(state .. " is not a state")
--             return
--         end
--     end
-- end

function Return_question(the_array, str)
    for i = 1, #the_array, 1 do
        local x = (the_array[i])
        if ((string.lower(x[1]) == string.lower(str))) then
            return 1
        elseif (string.lower(x[2]) == string.lower(str)) then
            return 2
        elseif (string.lower(x[3]) == string.lower(str)) then
            return 3
        elseif (string.lower(x[1])) or (string.lower(x[2])) or (string.lower(x[3])) ~= string.lower(str) then
            print("Try Again")
            Ask_info()
        end

        return
    end
end


function Compare_question(the_array, question)
    for i = 1, #the_array, 1 do
        local x = (the_array[i])
        if question == 1 and (string.lower(x[2]) == string.lower(state)) then

            print(x[3])
        elseif question == 2 and (string.lower(x[2]) == string.lower(state)) then
            print(x[4])
        elseif question == 3 and (string.lower(x[2]) == string.lower(state)) then
            print("Come Back Later")
        end
    end
end


if (State_info) then
    local questions = Ask_info()
    -- local check = State_check(Constants.State_taxrate)
    Question_info = Return_question(Constants.Question_List, questions)
    Compare_question(Constants.State_taxrate, Question_info)
end
