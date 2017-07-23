function WD_Helpers_Extend(Base, Callback)
    local NewClass = {}
    
    local NewClassMetatable = {}
    NewClassMetatable.__call = function(BaseClass, Params)
        local NewClassInstance = nil
        if (Base ~= nil) then
            NewClassInstance = Base(Params)
        else
            NewClassInstance = {}
        end
        
        for key, value in pairs(NewClass) do
            NewClassInstance[key] = value
        end
        
        NewClassInstance:Constructor(Params)
        
        return NewClassInstance
    end
    
    setmetatable(NewClass, NewClassMetatable)-- so we can use __call, __call = NewClass()
    return NewClass
end
function WD_HasAura(unitId, aura)
    local foundAura = false
    
    for a = 1, 40 do
        local name, rank, icon, count, dispelType, duration, expires, caster, isStealable, nameplateShowPersonal, spellID = UnitAura(unitId, a)
        if spellID ~= nil and spellID == aura then
            foundAura = true
        end
    end
    
    return foundAura
end
