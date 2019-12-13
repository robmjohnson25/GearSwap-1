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
    state.OffenseMode:options('None', 'Leveling')
    state.HybridMode:options('Normal')
    state.CastingMode:options('Normal', 'ConserveMP')
    state.IdleMode:options('Normal', 'Leveling')
	
	lockstyleset()
	state.MagicBurst = M(false, 'Magic Burst')
	
	-- send_command('bind != gs c toggle CapacityMode')
	
	send_command('bind ^q gs c cycle CastingMode')
	send_command('bind !q gs c toggle MagicBurst')
	--[[
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
    sets.CapacityMantle = {back=gear.CPCape}
	
	-- Precast Sets
    
    -- Precast sets to enhance JAs
    sets.precast.JA['Chainspell'] = {body="Vitiation Tabard"}
	
	-- Spells Fastcast 
	
    sets.precast.FC = {
    ammo="Impatiens",
	head="Nahtirah Hat",
    body="Vitiation Tabard",
    hands="Gende. Gages +1",
    legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
    feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+18','DEX+2','Accuracy+15 Attack+15','Mag. Acc.+15 "Mag.Atk.Bns."+15',}},
    right_ring="Jhakri Ring",
    back="Solemnity Cape",
	}

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
    back=gear.RdmCTP,
	}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Requiescat'] = set_combine(sets.precast.WS['Sanguine Blade'], {
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
    back=gear.RdmCTP,
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

    sets.midcast.Cure = {
    ammo="Ginsen",
    head="Vitiation Chapeau",
    body="Vitiation Tabard",
    hands="Jhakri Cuffs +1",
    legs="Atrophy Tights +1",
    feet="Leth. Houseaux +1",
    neck="Sanctity Necklace",
    waist="Dynamic Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Zodiac Ring",
    right_ring="Vocane Ring",
    back="Solemnity Cape",
	}

    sets.midcast.Curaga = sets.midcast.Cure
    sets.midcast.CureSelf = {}

    sets.midcast['Enhancing Magic'] = {
	head="Jhakri Coronal +1",
    body="Vitiation Tabard",
    hands="Atrophy Gloves +1",
    legs="Carmine Cuisses +1",
    feet="Leth. Houseaux +1",
    neck="Sanctity Necklace",
    waist="Dynamic Belt",
    left_ear="Hecate's Earring",
    right_ear="Novio Earring",
    left_ring="Jhakri Ring",
	back=gear.RdmCTP,
	}

    sets.midcast.Phalanx = set_combine(sets.midcast['Enhancing Magic'], {})

	sets.midcast['Temper II']= sets.midcast['Enhancing Magic']	
	
	sets.midcast.Blink = sets.midcast.FastRecast
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {legs="Shedir Seraweels",})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {body="Atrophy Tabard +2",})
	
    sets.midcast.Stoneskin =set_combine(sets.midcast['Enhancing Magic'], {legs="Shedir Seraweels",})

    sets.midcast.Haste = set_combine(sets.midcast['Enhancing Magic'], {})
	
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
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {})
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
    body="Atrophy Tabard +2",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    left_ear="Novio Earring",
    right_ear="Hecate's Earring",
    left_ring="Ayanmo Ring",
    right_ring="Jhakri Ring",
	}
		
    sets.midcast['Dia III'] = {
	head="Jhakri Coronal +1",
    body="Atrophy Tabard +2",
    hands="Jhakri Cuffs +1",
    legs="Jhakri Slops +1",
    feet="Jhakri Pigaches +1",
    neck="Sanctity Necklace",
    left_ear="Novio Earring",
    right_ear="Hecate's Earring",
    left_ring="Ayanmo Ring",
    right_ring="Jhakri Ring",
	}
		
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
	back="Toro Cape",
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

    
	sets.buff.ComposureOther = {
	--head="Lethargy Chappel +1",
    --body="Lethargy Sayon +1",hands="Lethargy Gantherots +1",
	legs="Lethargy Fuseau",feet="Lethargy Houseaux +1"}

    -- sets.buff.Saboteur = {hands="Lethargy Gantherots +1"}
    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    
    -- Idle sets
    sets.idle = {
	ammo="Ginsen",
    head="Vitiation Chapeau",
    body="Jhakri Robe +2",
    hands="Aya. Manopolas +1",
    legs="Carmine Cuisses +1",
    feet="Aya. Gambieras +1",
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Defending Ring",
    right_ring="Vocane Ring",
    back=gear.RdmCTP,
	}
    
	sets.idle.Town = set_combine(sets.idle, {body="Councilor's Garb",})
	
	sets.idle.Leveling = set_combine(sets.idle, {
	legs={ name="Lengo Pants", augments={'INT+7','Mag. Acc.+7','"Mag.Atk.Bns."+3','"Refresh"+1',}},
	back=gear.CPCape,
	})
	
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
    left_ring="Defending Ring",
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
    neck="Clotharius Torque",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="K'ayres Ring",
    right_ring="Rajas Ring",
	back=gear.RdmCTP,
	}

	sets.engaged.Leveling = set_combine(sets.engaged, {back=gear.CPCape})
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
	--[[if state.CapacityMode.value then
        idleSet = set_combine(idleSet, sets.CapacityMantle)
    end]]   
    return idleSet
end

-- Set eventArgs.handled to true if we don't want the automatic display to be run.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

function customize_melee_set(meleeSet)
	if state.TreasureMode.value == 'Fulltime' then
		meleeSet = set_combine(meleeSet, sets.TreasureHunter)
	end
    --[[if state.CapacityMode.value then
        meleeSet = set_combine(meleeSet, sets.CapacityMantle)
    end]]
	return meleeSet
end

--------------------------------------------------------------------------------------------
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

function lockstyleset()
	send_command('wait 2;input /lockstyleset 17')
end
