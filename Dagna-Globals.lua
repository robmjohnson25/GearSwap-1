-- *************************
-- *Global Gear Definitions*
-- *************************

-- Capes
gear.CPCape = {name="Mecisto. Mantle", augments={'Cap. Point+44%','INT+1','"Mag.Atk.Bns."+1','DEF+2',}}

-- Head
gear.HercHFC = {name="Herculean Helm", augments={'"Fast Cast"+4','Mag. Acc.+3',}}

-- Hands
gear.HercGMB = {name="Herculean Gloves", augments={'VIT+15','"Mag.Atk.Bns."+24','Accuracy+6 Attack+6','Mag. Acc.+17 "Mag.Atk.Bns."+17',}}

-- Body

-- Legs
gear.HercLTH = {name="Herculean Trousers", augments={'Weapon skill damage +2%','Chance of successful block +1','"Treasure Hunter"+1','Mag. Acc.+16 "Mag.Atk.Bns."+16',}}
gear.SamTTP = {name="Samnuha Tights", augments={'STR+5','DEX+5','"Triple Atk."+1',}}

-- Boots
gear.HercBTP = {name="Herculean Boots", augments={'DEX+9','"Triple Atk."+3','Accuracy+11 Attack+11',}}

-- JSE Capes

gear.BluCTP = {name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Damage taken-5%',}}
gear.RdmCTP = {name="Sucellos's Cape", augments={'DEX+13','Accuracy+20 Attack+20',}}

-- Override sets
sets.reive = {neck="Ygnas's Resolve +1"}

-- Global States
state.CapacityMode = M(false, 'Capacity Point Mantle')

-- Global binds
function global_on_load()
	
	send_command('bind != gs c toggle CapacityMode')

end

function global_on_unload()

	send_command('unbind !=')
	
end

-- Global intercept on midcast.
function user_post_precast(spell, action, spellMap, eventArgs)
    if buffactive['Reive Mark'] and spell.type == 'WeaponSkill' then
        equip(sets.reive)
    end
end

function user_customize_idle_set(idleSet)
    if buffactive['Reive Mark'] then
        idleSet = set_combine(idleSet, sets.reive)
    end
	if state.CapacityMode.value then
        idleSet = set_combine(idleSet, sets.CapacityMantle)
    end
    return idleSet
end

function user_customize_melee_set(meleeSet)
    if buffactive['Reive Mark'] then
        meleeSet = set_combine(meleeSet, sets.reive)
    end
	if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end
    return meleeSet
end
