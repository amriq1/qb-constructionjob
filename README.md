# qb-constructionjob
A pretty simple qb-constructionjob

## Dependency
cd_keymaster: https://github.com/dsheedes/cd_keymaster


## Installation
Step #1: Go to your qb-core folder > shared > jobs.lua and paste this

['construction'] = { -- this is the job name
		label = 'Construction Job',
		defaultDuty = true,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Engineer',
                payment = 50
            },
		},
	},
  
  Step #2: Drop the qb-constructionjob into your [qb] folder
  
  Step #3: Go to your server.cfg and ensure qb-constructionjob
  
  That's all.
  
