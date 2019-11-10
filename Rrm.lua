-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.Buff.Saboteur = buffactive.saboteur or false
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.HybridMode:options('Normal')
    state.CastingMode:options('Normal', 'ConserveMP')
    state.IdleMode:options('Normal', 'PDT', 'MDT')
	
	state.MagicBurst = M(false, 'Magic Burst')
	--[[
	send_command('bind ^q gs c cycle CastingMode')
	send_command('bind !q gs c toggle MagicBurst')
	send_command('bind ^g input /recast Stratagems <me>')
	send_command('bind ^h input /ma "Haste II" <me>')
	send_command('bind ^, input /ma Blink <me>')
	send_command('bind ^. input /ma Stoneskin <me>')
	send_command('bind ^/ input /ma Phalanx <me>')
	send_command('bind ^c input /ma "Cure IV" <me>')
	send_command('bind ^d input /ma Diaga <t>')
	send_command('bind ^b input /ma Bind <t>')
	send_command('bind ^s input /ma "Sleep II" <t>')
	send_command('bind ^n input /ma "Thunder II" <t>')
	send_command('bind ^- input /ma Stun <t>')
	send_command('bind !a input /ma Aquaveil <me>')
	send_command('bind !t input /ma "Temper II" <me>')
	send_command('bind !y input /ma "Refresh III" <me>')
	send_command('bind !l input /ma "Utsusemi: Ichi" <me>')
	send_command('bind !; input /ma "Utsusemi: Ni" <me>')
	send_command('bind !n input /ma "Blizzard II" <t>')
	send_command('bind !f input /ma "Fire II" <t>')
	send_command('bind !, input /item "Echo Drops" <me>')
	send_command('bind !. input /item Remedy <me>')
	send_command('bind !/ input /item "Holy Water" <me>')
	]]
    --gear.default.obi_waist = "Refoccilation Stone"
    
    --select_default_macro_book(1, 4)
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	--[[
	gear.NukingHead = {name="Merlinic Hood", augments={'Mag. Acc.+24 "Mag.Atk.Bns."+24','Magic burst dmg.+3%','INT+8','Mag. Acc.+15','"Mag.Atk.Bns."+10',}}
	gear.MBLegs = {name="Merlinic Shalwar", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','Magic burst mdg.+11%','MND+6','Mag. Acc.+13','"Mag.Atk.Bns."+2',}}
	gear.RegenBody = {name="Telchine Chasuble", augments={'Pet: "Mag.Atk.Bns."+18','"Conserve MP"+3','"Regen" potency+3',}}
	gear.RegenLegs = {name="Telchine Braconi", augments={'Rng.Atk.+7','"Fast Cast"+4','"Regen" potency+3',}}
	gear.RegenFeet = {name="Telchine Pigaches", augments={'Evasion+14','"Conserve MP"+4','"Regen" potency+3',}}
	gear.PetRegenBody = {name="Telchine Chasuble", augments={'Pet: DEF+7','Pet: "Regen"+3','Enh. Mag. eff. dur. +10',}}
	gear.CuringHat = {name="Gende. Caubeen +1", augments={'Phys. dmg. taken -3%','"Cure" potency +6%',}}
	gear.CuringHands = {name="Telchine Gloves", augments={'Evasion+20','"Cure" potency +7%','Enh. Mag. eff. dur. +10',}}
	gear.CMPHead = {name="Telchine Cap", augments={'Accuracy+12 Attack+12','Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}}
	gear.CMPHands = {name="Telchine Gloves", augments={'Evasion+17','Potency of "Cure" effect received+6%',}}
	gear.CMPLegs = {name="Telchine Braconi", augments={'Evasion+18','Potency of "Cure" effect received+7%','Enh. Mag. eff. dur. +10',}}
	gear.CMPFeet = {name="Telchine Pigaches", augments={'DEF+7','Potency of "Cure" effect received+6%','Enh. Mag. eff. dur. +10',}}
	gear.DrainBody = {name="Merlinic Jubbah", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','"Drain" and "Aspir" potency +10','Mag. Acc.+14','"Mag.Atk.Bns."+5',}}
	gear.DrainHands = {name="Merlinic Dastanas", augments={'Mag. Acc.+25','"Drain" and "Aspir" potency +10','INT+6',}}
	gear.DrainLegs = {name="Merlinic Shalwar", augments={'Mag. Acc.+30','"Drain" and "Aspir" potency +9','CHR+14',}}
	gear.DrainFeet = {name="Merlinic Crackows", augments={'Mag. Acc.+28','"Drain" and "Aspir" potency +10','MND+1',}}
	gear.ENFHands = {name="Chironic Gloves", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Cure" potency +1%','CHR+6','Mag. Acc.+13','"Mag.Atk.Bns."+5',}}
	gear.ENFLegs = {name="Chironic Hose", augments={'Mag. Acc.+22 "Mag.Atk.Bns."+22','"Fast Cast"+2','Mag. Acc.+14','"Mag.Atk.Bns."+3',}}
	gear.FCHead = {name="Merlinic Hood", augments={'Mag. Acc.+2','"Fast Cast"+6','"Mag.Atk.Bns."+30',}}
	gear.FCBody = {name="Merlinic Crackows", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','"Fast Cast"+5','CHR+2','Mag. Acc.+11','"Mag.Atk.Bns."+10',}}
	gear.FCFeet = {name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+18','"Fast Cast"+7','DEX+2','Mag. Acc.+1',}}
	gear.DTHead = {name="Merlinic Hood", augments={'Pet: Attack+17 Pet: Rng.Atk.+17','CHR+5','Damage taken-5%','Accuracy+6 Attack+6',}}
	gear.DTBody = {name="Merlinic Jubbah", augments={'"Mag.Atk.Bns."+16','Damage taken-3%','CHR+2'}}
	gear.PhalanxHead = { name="Merlinic Hood", augments={'"Dbl.Atk."+5','INT+6','Phalanx +3','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	gear.PhalanxFeet = {name="Merlinic Crackows", augments={'Pet: STR+10','Pet: "Dbl.Atk."+3 Pet: Crit.hit rate +3','Phalanx +4','Mag. Acc.+1 "Mag.Atk.Bns."+1',}}
	gear.PhalanxLegs = {name="Merlinic Shalwar", augments={'System: 1 ID: 1793 Val: 8','STR+1','Phalanx +3','Accuracy+10 Attack+10',}}
	gear.PhalanxHands = {name="Merlinic Dastanas", augments={'INT+9','Pet: DEX+14','Phalanx +4',}}
	gear.WSHead = {name="Merlinic Hood", augments={'Attack+15','"Cure" potency +3%','Weapon skill damage +6%','Mag. Acc.+13 "Mag.Atk.Bns."+13',}}
	gear.THHead = {name="Merlinic Hood", augments={'Pet: VIT+2','INT+5','"Treasure Hunter"+1','Accuracy+11 Attack+11','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
	gear.THHands = {name="Merlinic Dastanas", augments={'"Cure" potency +9%','Phys. dmg. taken -1%','"Treasure Hunter"+2','Accuracy+18 Attack+18','Mag. Acc.+12 "Mag.Atk.Bns."+12',}}
	gear.WSCape = {name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
	gear.NukeCape = {name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10',}}
	gear.TPHands = {name="Merlinic Dastanas", augments={'"Triple Atk."+4','MND+3','Magic Damage +6','Accuracy+13 Attack+13','Mag. Acc.+4 "Mag.Atk.Bns."+4',}}
	gear.RefreshHands = {name="Merlinic Dastanas", augments={'Attack+21','Rng.Acc.+26','"Refresh"+1','Mag. Acc.+7 "Mag.Atk.Bns."+7',}}	
	gear.ENFStaff = {name="Grioavolr", augments={'Enfb.mag. skill +13','Mag. Acc.+28','Magic Damage +4',}}
	gear.NukeStaff = {name="Grioavolr", augments={'"Occult Acumen"+7','INT+7','Mag. Acc.+2','"Mag.Atk.Bns."+29','Magic Damage +6',}}
	gear.MBStaff = {name="Grioavolr", augments={'Magic burst dmg.+7%','MP+58','Mag. Acc.+25','"Mag.Atk.Bns."+20',}}	
	]]
    -- Precast Sets
    
    -- Precast sets to enhance JAs
    --sets.precast.JA['Chainspell'] = {body="Vitivation Tabard +1"}
	
	-- Spells Fastcast 
	
    sets.precast.FC = {
	head="Nahtirah Hat",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +1",
    legs="Aya. Cosciales +1",
    feet="Jhakri Pigaches +1",
    right_ring="Jhakri Ring",}

    sets.precast.FC.Impact = set_combine(sets.precast.FC, {})

    -- Weaponskill sets
    
    sets.precast.WS = {
    ammo="Ginsen",
    head="Jhakri Coronal +1",
    body="Ayanmo Corazza +2",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Battlecast Gaiters",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear={ name="Moonshade Earring", augments={'"Mag.Atk.Bns."+4','TP Bonus +250',}},
    left_ring="Ayanmo Ring",
    right_ring="Rajas Ring",
    back="Vassal's Mantle",
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS, {
	neck="Soil Gorget",
	waist="Soil Belt",
	})

    sets.precast.WS['Sanguine Blade'] = {
	ammo="Ginsen",
    head="Jhakri Coronal +1",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Hecate's Earring",
    right_ear="Novio Earring",
    left_ring="Ayanmo Ring",
    right_ring="Jhakri Ring",
    back="Vassal's Mantle",
	}

	sets.precast.WS['Chant du Cygne'] = set_combine(sets.precast.WS, {
	neck="Light Gorget",
	waist="Light Belt",
	})

	sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS, {
	neck="Thunder Gorget",
	waist="Thunder Belt",
	})

    -- Midcast Sets
    
    sets.midcast.FastRecast = {}

    sets.midcast.Cure = {}

    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {}

    sets.midcast['Enhancing Magic'] = {}

    sets.midcast.Phalanx = {}

	sets.midcast['Temper II']= sets.midcast['Enhancing Magic']	
	
	sets.midcast.Blink = sets.midcast.FastRecast
	
	sets.midcast.Aquaveil = {}
	
	sets.midcast.Refresh = {}
	
    sets.midcast.Stoneskin = set_combine(sets.midcast.FastCast, {})

    sets.midcast.Haste = set_combine(sets.midcast.FastCast, {})	
	
	sets.midcast.Flurry = sets.midcast.Haste	
	sets.midcast.Firestorm = sets.midcast.Haste
	sets.midcast.Hailstorm = sets.midcast.Haste
	sets.midcast.Windstorm = sets.midcast.Haste
	sets.midcast.Sandstorm = sets.midcast.Haste
	sets.midcast.Thunderstorm = sets.midcast.Haste
	sets.midcast.Rainstorm = sets.midcast.Haste
	sets.midcast.Aurorastorm = sets.midcast.Haste
	sets.midcast.Voidstorm = sets.midcast.Haste
	sets.midcast["Haste II"] = sets.midcast.Haste
	sets.midcast["Flurry II"] = sets.midcast.Haste
	sets.midcast['Shock Spikes'] = sets.midcast.Haste
	sets.midcast['Ice Spikes'] = sets.midcast.Haste
	sets.midcast['Blaze Spikes'] = sets.midcast.Haste
	sets.midcast['Refresh II'] = sets.midcast.Refresh
	sets.midcast['Refresh III'] = sets.midcast.Refresh
	sets.midcast['Regen II'] = sets.midcast.Refresh
	
	sets.midcast.Protect = {}
	sets.midcast.Protectra = sets.midcast.Protect
	sets.midcast.Shell = sets.midcast.Protect
	sets.midcast.Shellra = sets.midcast.Protect
	
	sets.midcast['Barfire'] = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Barblizzard = sets.midcast.Barfire
	sets.midcast.Baraero = sets.midcast.Barfire
	sets.midcast.Barstone = sets.midcast.Barfire
	sets.midcast.Barthunder = sets.midcast.Barfire
	sets.midcast.Barwater = sets.midcast.Barfire
	sets.midcast.Barsleep = sets.midcast.Barfire
	sets.midcast.Barpoison = sets.midcast.Barfire
	sets.midcast.Barparalyze = sets.midcast.Barfire
	sets.midcast.Barblind = sets.midcast.Barfire
	sets.midcast.Barsilence = sets.midcast.Barfire
	sets.midcast.Baramnesia = sets.midcast.Barfire
	sets.midcast.Phalanx = sets.midcast.Barfire
	sets.midcast['Gain-STR'] = sets.midcast.Haste
	sets.midcast['Gain-DEX'] = sets.midcast.Haste
	sets.midcast['Gain-VIT'] = sets.midcast.Haste
	sets.midcast['Gain-AGI'] = sets.midcast.Haste
	sets.midcast['Gain-MND'] = sets.midcast.Haste
	sets.midcast['Gain-CHR'] = sets.midcast.Haste
	sets.midcast['Gain-INT'] = sets.midcast.Haste
		
    sets.midcast['Enfeebling Magic'] = {
	head="Jhakri Coronal +1",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    left_ear="Novio Earring",
    right_ear="Hecate's Earring",
    left_ring="Ayanmo Ring",
    right_ring="Jhakri Ring",
	}
		
    sets.midcast['Dia III'] = {}
		
	sets.midcast['Slow II'] = sets.midcast['Dia III']	
	sets.midcast['Paralyze II'] = sets.midcast['Dia III']
	sets.midcast['Distract III'] = sets.midcast['Dia III']
	sets.midcast['Frazzle III'] = sets.midcast['Dia III']
		
    sets.midcast['Elemental Magic'] = {
	head="Jhakri Coronal +1",
    body="Jhakri Robe +2",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    left_ear="Novio Earring",
    right_ear="Hecate's Earring",
    left_ring="Ayanmo Ring",
    right_ring="Jhakri Ring",
	}
		
	sets.midcast['Elemental Magic'].ConserveMP = {}
		
	sets.magic_burst ={}
		
    sets.magic_burst.ConserveMP ={} 
		
    sets.midcast.Impact = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast['Dark Magic'] = {}

    --sets.midcast.Stun = set_combine(sets.midcast['Dark Magic'], {})

    sets.midcast.Drain = {}

    sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Klimaform = sets.midcast.FastRecast
	
	sets.midcast.Stone = {}
	
	--sets.midcast['Apururu (UC)'] = {body="Apururu Unity Shirt"}


    -- Sets for special buff conditions on spells.

    --[[
	sets.buff.ComposureOther = {
	head="Lethargy Chappel +1",
    body="Lethargy Sayon +1",hands="Lethargy Gantherots +1",
	legs="Lethargy Fuseau +1",feet="Lethargy Houseaux +1"}

    sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
    ]]

    -- Sets to return to when not performing an action.
    
    -- Resting sets
    
    -- Idle sets
    sets.idle = {
	ammo="Ginsen",
    head="Aya. Zucchetto +1",
    body="Jhakri Robe +2",
    hands="Aya. Manopolas +1",
    legs="Carmine Cuisses +1",
    feet="Aya. Gambieras +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Ayanmo Ring",
    right_ring="Vocane Ring",
    back="Estoqueur's Cape",
	}
    
    -- Defense sets
    sets.defense.PDT = {
	ammo="Ginsen",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Aya. Cosciales +1",
    feet="Aya. Gambieras +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Ayanmo Ring",
    right_ring="Vocane Ring",
    back="Solemnity Cape",
	}

    sets.defense.MDT = set_combine(sets.defense.PDT, {})

    sets.Kiting = {legs="Carmine Cuisses +1"}

    sets.latent_refresh = {}

    --  sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
    ammo="Ginsen",
    head="Aya. Zucchetto +1",
    body="Ayanmo Corazza +2",
    hands="Aya. Manopolas +1",
    legs="Jhakri Slops +1",
    feet="Battlecast Gaiters",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Ayanmo Ring",
    right_ring="Rajas Ring",
    back="Vassal's Mantle",
	}

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the default midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Enfeebling Magic' and state.Buff.Saboteur then
        equip(sets.buff.Saboteur)
    elseif spell.skill == 'Enhancing Magic' then
        equip(sets.midcast.EnhancingDuration)
        if buffactive.composure and spell.target.type == 'PLAYER' then
            equip(sets.buff.ComposureOther)
        end
    elseif spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
	if spell.action_type == 'Magic' then
	if spell.element == "Earth" and spell.skill == 'Elemental Magic' and (state.CastingMode.value == "Normal" or state.CastingMode.value == "ConserveMP")  then
		equip({ neck="Quanpur Necklace" })
	end
	    if spellMap == 'Cure' and spell.target.type == 'SELF' then
        equip(sets.midcast.CureSelf)
    end
		if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
		if state.CastingMode.value == "ConserveMP" then
            equip(sets.magic_burst.ConserveMP)		
		elseif state.CastingMode.value == "MACC" then
        equip(sets.magic_burst.MACC)        
		else
        equip(sets.magic_burst)
        end	
end
end
end
function job_aftercast(spell, action, spellMap, eventArgs)
	if not spell.interrupted then
		if spell.english == 'Break' or spell.english == 'Breakga' then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 30 down spells/00220.png')
		elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
		elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
			send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
		end
		classes.CustomIdleGroups:clear()
	end
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Handle notifications of general user state change.
function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'None' then
            enable('main','sub','range')
        else
            disable('main','sub','range')
        end
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 5)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 5)
    else
        set_macro_page(1, 5)
    end
end
