; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  _   _   ___    _____  _   _  _____  _   _  ____   _____
; | \ | | / _ \  |  ___|| | | ||_   _|| | | ||  _ \ | ____|
; |  \| || | | | | |_   | | | |  | |  | | | || |_) ||  _|
; | |\  || |_| | |  _|  | |_| |  | |  | |_| ||  _ < | |___
; |_| \_| \___/  |_|     \___/   |_|   \___/ |_| \_\|_____|

; .______        ___      .__   __.  __  ___     ____
; |   _  \      /   \     |  \ |  | |  |/  /    |___ \
; |  |_)  |    /  ^  \    |   \|  | |  '  /       __) |
; |   _  <    /  /_\  \   |  . `  | |    <       |__ <
; |  |_)  |  /  _____  \  |  |\   | |  .  \      ___) |
; |______/  /__/     \__\ |__| \__| |__|\__\    |____/
;(C) 2024 By Steve Broad unless stated anywhere else in code
; ORG 58624
; 6 LINES BY 14 COLLUMNS
                        org $C000                       ; Build the code to run at $C000
                        disp $1C000-*                   ; But displace it so it goes in memory at $1C000 114688


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; __          ____      ________   _____       _______
; \ \        / /\ \    / /  ____| |  __ \   /\|__   __|/\
;  \ \  /\  / /  \ \  / /| |__    | |  | | /  \  | |  /  \
;   \ \/  \/ / /\ \ \/ / |  __|   | |  | |/ /\ \ | | / /\ \
;    \  /\  / ____ \  /  | |____  | |__| / ____ \| |/ ____ \
;     \/  \/_/    \_\/   |______| |_____/_/    \_\_/_/    \_\
;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Alien coordinates                  Portal    120,32
;                       56,52    88,52   120,52    152,52      184,52
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


; Wave data  Each block is 106 bytes
;Type 1
;10 come out 2 lines of 5 to form a block. Dropping bombs. Taking air.
WAVE_DATA1_3:           DEFB 10                         ; No of aliens
                        DEFB 220,180,160,140,120,100,80,60,40,20,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,54, 120,54, 152,54, 184,54;
                        DEFB 56,72, 88,72, 120,72, 152,72, 184,72 ; Alien goes to these coordinates
                        DEFB 56,96, 88,96, 120,96, 152,96, 184,96;

                        DEFB 71                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

;Type 2
;4 come out to 4 corners and hold and split into 3 more that start spinning and moving randomly across screen
; dropping bombs. Taking air.
WAVE_DATA2:             DEFB 15                         ; No of aliens
                        DEFB 240,180,180,180,240,180,180,180,240,180,180,180,240,180,180; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien drop timer to set the alien data
                        ;    Portal                       Portal                          Portal
                        DEFB 120,32, 56,56, 56,56, 56,56, 120,32, 184,56, 184,56, 184,56, 120,32, 56,96; Alien start coordinates (usually portal location)
                        DEFB 56,96, 56,96, 120,32, 184,96, 184,96;

                        DEFB 56,56, 40,60, 100,60, 56,72, 184,56, 170,60, 200,60, 184,72, 56,96, 40,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;Type 3
;15 come out 3 lines of 5 to form a block. Dropping bombs. Randomly fly down and take up water.
WAVE_DATA3:             DEFB 15                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,140,130,120,110,100; Alien appears counter, counts to 255 then enables alien
                        DEFB 0,1,0,0,100,0,0,150,0,0,200,0,0,30,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 68                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;










;Type 4
;Up to 10, 1 comes out of portal one by 1 as gets shot down. Goes left and right across screen fast
; dropping bombs. Then drops to get water while dropping bombs. Goes back up screen shoots back into portal to take water.
;
WAVE_DATA4:             DEFB 10                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,160,0,160,0,200,0,200,0,220,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 0,0,0,0,0,0,0,0,0,0        ;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 66                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


;Type 5
;15 come out 3 lines of 5 to form a block. Dropping bombs. Randomly fly down and take up water.
; Some may split into 4 spinning. Taking air and dropping bombs.
;
WAVE_DATA5:             DEFB 15                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,140,130,120,110,100; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,100,0,50,100,0,60,150,0,70,200,0,1300,30,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;
                        DEFB 67                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

;Type 6
;Up to 10, 1 comes out of portal one by 1 as gets shot down. Goes left and right across screen fast.
; It splits into 4 more that start spinning and moving randomly across screen dropping bombs. Taking air.
;
WAVE_DATA6:             DEFB 15                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,140,130,120,110,100; Alien appears counter, counts to 255 then enables alien
                        DEFB 200,100,0,50,100,0,60,150,0,70,200,0,1300,30,200; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 79                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 79                         ; O2_BONUS_COLOUR
                        DEFB 79                         ; H2O_BONUS_COLOUR
                        DEFB 75                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 77                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 77                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;Type 7
;15 come out 3 lines of 5 to form a block. Dropping bombs. Randomly fly down and take up water.
;Some may split into 4 spinning. Taking air and dropping bombs.
;
WAVE_DATA7:             DEFB 15                         ; No of aliens
                        DEFB 230,230,230,230,230,230,230,230,230,230,230,230,230,230,230; Alien appears counter, counts to 255 then enables alien
                        DEFB 200,200,200,200,200,200,130,160,220,160,130,200,200,200,200; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 184,54, 184,72, 184,96, 56,54, 56,72, 56,96, 88,54, 120,54, 152,54, 88,72 ; Alien goes to these coordinates
                        DEFB 120,72, 152,72, 88,96, 120,96, 152,96;
                        DEFB 78                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 79                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;Type 8
;Up to 15, 1 comes out of portal one by 1 as gets shot down. Goes left and right across screen fast.
; It splits into 4 more that start swimming motion down screen and dropping bombs.
; Taking water and swimming back up screen dropping bombs and into portal.

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

WAVE_DATA8:             DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 75                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA9:             DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 74                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 77                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA10:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 76                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA11:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 87                         ; Alien/background_COLOUR (91)
                        DEFB 85                         ; Alien collected O2_COLOUR
                        DEFB 85                         ; O2_BONUS_COLOUR
                        DEFB 81                         ; H2O_BONUS_COLOUR
                        DEFB 80                         ; SHIELD_BONUS_COLOUR
                        DEFB 87                         ; 1000_BONUS_COLOUR
                        DEFB 87                         ; LIFE_BONUS_COLOUR
                        DEFB 87                         ; POW_BONUS_COLOUR
                        DEFB 84                         ; Rocket bonus colour
                        DEFB 87                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA12:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA13:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32; ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA14:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


WAVE_DATA15:            DEFB 15                         ; No of aliens
                        DEFB 240,160,160,160,240,160,160,160,240,160,160,160,240,160,160; Alien appears counter, counts to 255 then enables alien

                        DEFB 140,150,140,150,140,150,140,150,140,150,140,150,140,150,140; Alien drop timer to set the alien data
                        ;    Portal                       Portal                          Portal
                        DEFB 120,32, 56,54, 56,54, 56,54, 120,32, 184,54, 184,54, 184,54, 120,32, 56,96; Alien start coordinates (usually portal location)
                        DEFB 56,96, 56,96, 120,32, 184,96, 184,96;

                        DEFB 56,54, 50,60, 70,60, 56,72, 184,54, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 120                        ; Alien/background_COLOUR (91)
                        DEFB 125                        ; Alien collected O2_COLOUR
                        DEFB 121                        ; O2_BONUS_COLOUR
                        DEFB 121                        ; H2O_BONUS_COLOUR
                        DEFB 121                        ; SHIELD_BONUS_COLOUR
                        DEFB 120                        ; 1000_BONUS_COLOUR
                        DEFB 123                        ; LIFE_BONUS_COLOUR
                        DEFB 122                        ; POW_BONUS_COLOUR
                        DEFB 124                        ; Rocket bonus colour
                        DEFB 121                        ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA16:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;




WAVE_DATA17:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA18:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA19:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA20:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

;;;;;;;;;;
; Alien coordinates                  Portal    120,32
;                       56,52    88,52   120,52    152,52      184,52
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


; Wave data  Each block is 106 bytes
;Type 1
;10 come out 2 lines of 5 to form a block. Dropping bombs. Taking air.
WAVE_DATA21_1:          DEFB 10                         ; No of aliens
                        DEFB 220,210,200,190,180,170,160,150,140,130,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien
                        DEFB 200,200,200,200,200,200,200,200,200,200,200,200,200,200,200; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,54, 120,54, 152,54, 184,54;
                        DEFB 56,72, 88,72, 120,72, 152,72, 184,72 ; Alien goes to these coordinates
                        DEFB 56,96, 88,96, 120,96, 152,96, 184,96;

                        DEFB 71                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;
                                    ;  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

;Type 2
;4 come out to 4 corners and hold and split into 3 more that start spinning and moving randomly across screen
; dropping bombs. Taking air.
WAVE_DATA22:             DEFB 15                         ; No of aliens
                        DEFB 240,235,230,225,220,215,210,205,200,195,190,185,180,175,170; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien drop timer to set the alien data
                        ;    Portal                       Portal                          Portal
                        DEFB 120,32, 56,56, 56,56, 56,56, 120,32, 184,56, 184,56, 184,56, 120,32, 56,96; Alien start coordinates (usually portal location)
                        DEFB 56,96, 56,96, 120,32, 184,96, 184,96;

                        DEFB 56,56, 40,60, 100,60, 56,72, 184,56, 170,60, 200,60, 184,72, 56,96, 40,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;Type 3
;15 come out 3 lines of 5 to form a block. Dropping bombs. Randomly fly down and take up water.
WAVE_DATA23:             DEFB 15                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,140,130,120,110,100; Alien appears counter, counts to 255 then enables alien
                        DEFB 0,1,0,0,100,0,0,150,0,0,200,0,0,30,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 68                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;










;Type 4
;Up to 10, 1 comes out of portal one by 1 as gets shot down. Goes left and right across screen fast
; dropping bombs. Then drops to get water while dropping bombs. Goes back up screen shoots back into portal to take water.
;
WAVE_DATA24:             DEFB 10                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,160,0,160,0,200,0,200,0,220,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 0,0,0,0,0,0,0,0,0,0        ;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 66                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


;Type 5
;15 come out 3 lines of 5 to form a block. Dropping bombs. Randomly fly down and take up water.
; Some may split into 4 spinning. Taking air and dropping bombs.
;
WAVE_DATA25:             DEFB 15                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,140,130,120,110,100; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,100,0,50,100,0,60,150,0,70,200,0,1300,30,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;
                        DEFB 67                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

;Type 6
;Up to 10, 1 comes out of portal one by 1 as gets shot down. Goes left and right across screen fast.
; It splits into 4 more that start spinning and moving randomly across screen dropping bombs. Taking air.
;
WAVE_DATA26:             DEFB 15                         ; No of aliens
                        DEFB 240,230,220,210,200,190,180,170,160,150,140,130,120,110,100; Alien appears counter, counts to 255 then enables alien
                        DEFB 200,100,0,50,100,0,60,150,0,70,200,0,1300,30,200; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,50, 50,60, 70,60, 56,72, 184,50, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 79                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 79                         ; O2_BONUS_COLOUR
                        DEFB 79                         ; H2O_BONUS_COLOUR
                        DEFB 75                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 77                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 77                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;Type 7
;15 come out 3 lines of 5 to form a block. Dropping bombs. Randomly fly down and take up water.
;Some may split into 4 spinning. Taking air and dropping bombs.
;
WAVE_DATA27:             DEFB 15                         ; No of aliens
                        DEFB 230,230,230,230,230,230,230,230,230,230,230,230,230,230,230; Alien appears counter, counts to 255 then enables alien
                        DEFB 200,200,200,200,200,200,130,160,220,160,130,200,200,200,200; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 184,54, 184,72, 184,96, 56,54, 56,72, 56,96, 88,54, 120,54, 152,54, 88,72 ; Alien goes to these coordinates
                        DEFB 120,72, 152,72, 88,96, 120,96, 152,96;
                        DEFB 78                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 79                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;Type 8
;Up to 15, 1 comes out of portal one by 1 as gets shot down. Goes left and right across screen fast.
; It splits into 4 more that start swimming motion down screen and dropping bombs.
; Taking water and swimming back up screen dropping bombs and into portal.

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

WAVE_DATA28:             DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 75                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA29:             DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 74                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 77                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA30:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 76                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA31:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 87                         ; Alien/background_COLOUR (91)
                        DEFB 85                         ; Alien collected O2_COLOUR
                        DEFB 85                         ; O2_BONUS_COLOUR
                        DEFB 81                         ; H2O_BONUS_COLOUR
                        DEFB 80                         ; SHIELD_BONUS_COLOUR
                        DEFB 87                         ; 1000_BONUS_COLOUR
                        DEFB 87                         ; LIFE_BONUS_COLOUR
                        DEFB 87                         ; POW_BONUS_COLOUR
                        DEFB 84                         ; Rocket bonus colour
                        DEFB 87                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA32:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA33:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32; ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA34:            DEFB 10                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


WAVE_DATA35:            DEFB 15                         ; No of aliens
                        DEFB 240,160,160,160,240,160,160,160,240,160,160,160,240,160,160; Alien appears counter, counts to 255 then enables alien

                        DEFB 140,150,140,150,140,150,140,150,140,150,140,150,140,150,140; Alien drop timer to set the alien data
                        ;    Portal                       Portal                          Portal
                        DEFB 120,32, 56,54, 56,54, 56,54, 120,32, 184,54, 184,54, 184,54, 120,32, 56,96; Alien start coordinates (usually portal location)
                        DEFB 56,96, 56,96, 120,32, 184,96, 184,96;

                        DEFB 56,54, 50,60, 70,60, 56,72, 184,54, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 120                        ; Alien/background_COLOUR (120)
                        DEFB 125                        ; Alien collected O2_COLOUR
                        DEFB 121                        ; O2_BONUS_COLOUR
                        DEFB 121                        ; H2O_BONUS_COLOUR
                        DEFB 121                        ; SHIELD_BONUS_COLOUR
                        DEFB 120                        ; 1000_BONUS_COLOUR
                        DEFB 123                        ; LIFE_BONUS_COLOUR
                        DEFB 122                        ; POW_BONUS_COLOUR
                        DEFB 124                        ; Rocket bonus colour
                        DEFB 121                        ; Player colour 121
                        DEFB 0,0,0,0,0                  ;

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

; Level=35
WAVE_DATA36:            DEFB 15                         ; No of aliens

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien appears counter, counts to 255 then enables alien

                        DEFB 190,190,190,190,190,190,190,190,190,190,190,190,190,190,190; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32 ;

                        DEFB 56,54, 88,54, 120,54, 152,54, 184,54, 56,72, 88,72, 120,72, 152,72, 184,72 ; Alien goes to these coordinates
                        DEFB 56,96, 88,96, 120,96, 152,96, 184,96;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;




WAVE_DATA37:            DEFB 10                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 100,105,110,125,200,205,210,215,220,225,230,50,40,35,25; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA38:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA39:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA40:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA41:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 76                         ; Alien/background_COLOUR (91)
                        DEFB 77                         ; Alien collected O2_COLOUR
                        DEFB 77                         ; O2_BONUS_COLOUR
                        DEFB 76                         ; H2O_BONUS_COLOUR
                        DEFB 74                         ; SHIELD_BONUS_COLOUR
                        DEFB 79                         ; 1000_BONUS_COLOUR
                        DEFB 75                         ; LIFE_BONUS_COLOUR
                        DEFB 75                         ; POW_BONUS_COLOUR
                        DEFB 76                         ; Rocket bonus colour
                        DEFB 79                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA42:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 87                         ; Alien/background_COLOUR (91)
                        DEFB 85                         ; Alien collected O2_COLOUR
                        DEFB 85                         ; O2_BONUS_COLOUR
                        DEFB 81                         ; H2O_BONUS_COLOUR
                        DEFB 80                         ; SHIELD_BONUS_COLOUR
                        DEFB 87                         ; 1000_BONUS_COLOUR
                        DEFB 87                         ; LIFE_BONUS_COLOUR
                        DEFB 87                         ; POW_BONUS_COLOUR
                        DEFB 84                         ; Rocket bonus colour
                        DEFB 87                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA43:            DEFB 1                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 50,100,50,100,50,100,50,100,50,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

WAVE_DATA44:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,250,250,250,250,250,250; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,200,200,200,200,200,200,200,200,0,0,0,0,0,0; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32; ;

                        DEFB 36,36, 88,36, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 170,36, 210,36;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA45:            DEFB 15                         ; No of aliens

                        DEFB 24,24,240,240,240,240,240,24,24,200,200,0,200,0,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 250,200,230,210,220,100,50,110,60,70,80,90,100,120,130; Alien drop timer to set the alien data

                        DEFB 120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32,120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32,120,32,120,32,120,32,120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96


WAVE_DATA46:            DEFB 15                         ; No of aliens
                        DEFB 240,160,160,160,240,160,160,160,240,160,160,160,240,160,160; Alien appears counter, counts to 255 then enables alien

                        DEFB 140,150,140,150,140,150,140,150,140,150,140,150,140,150,140; Alien drop timer to set the alien data
                        ;    Portal                       Portal                          Portal
                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32;

                        DEFB 56,54, 50,60, 70,60, 56,72, 184,54, 170,60, 190,60, 184,72, 56,96, 50,108 ; Alien goes to these coordinates
                        DEFB 65,108, 56,110, 184,96, 170,108, 194,108;

                        DEFB 120                        ; Alien/background_COLOUR (91)
                        DEFB 125                        ; Alien collected O2_COLOUR
                        DEFB 121                        ; O2_BONUS_COLOUR
                        DEFB 121                        ; H2O_BONUS_COLOUR
                        DEFB 121                        ; SHIELD_BONUS_COLOUR
                        DEFB 120                        ; 1000_BONUS_COLOUR
                        DEFB 123                        ; LIFE_BONUS_COLOUR
                        DEFB 122                        ; POW_BONUS_COLOUR
                        DEFB 124                        ; Rocket bonus colour
                        DEFB 121                        ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


WAVE_DATA47:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 0,0,0,0,0,20,30,215,0,0,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;




WAVE_DATA48:            DEFB 15                         ; No of aliens

                        DEFB 240,244,248,252,236,232,222,240,214,200,208,216,224,232,240; Alien appears counter, counts to 255 then enables alien

                        DEFB 10,30,50,70,90,220,210,230,240,250,230,100,120,130,140; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32; Alien start coordinates (usually portal location)
                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

WAVE_DATA49:            DEFB 15                         ; No of aliens

                        DEFB 240,240,240,240,240,240,240,240,240,200,200,200,200,200,200; Alien appears counter, counts to 255 then enables alien

                        DEFB 180,185,190,195,200,205,210,215,220,225,230,235,240,245,250; Alien drop timer to set the alien data

                        DEFB 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 120,32, 56,50; Alien start coordinates (usually portal location)
                        DEFB 56,50, 88,96, 88,96, 184,50, 184,96 ;

                        DEFB 56,54, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;

; Alien coordinates                  Portal    120,32
;                       56,54    88,54   120,54    152,54      184,54
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

WAVE_DATA50:            DEFB 15                         ; No of aliens

                        DEFB 250,230,230,210,180,180,210,210,210,210,210,210,210,210,210; Alien appears counter, counts to 255 then enables alien

                        DEFB 250,185,190,195,200,205,210,215,220,225,120,130,160,150,140; Alien drop timer to set the alien data

                        DEFB 120,32, 65,72, 65,72, 152,96, 152,96, 152,96, 152,96, 152,96, 152,96, 152,96; Alien start coordinates (usually portal location)
                        DEFB 152,96, 152,96, 152,96, 152,96, 152,96;

                        DEFB 120,72, 88,96, 152,96, 184,54, 56,96, 88,96, 120,96, 152,96, 184,96, 56,110 ; Alien goes to these coordinates
                        DEFB 56,120, 88,110, 88,120, 184,110, 184,120;

                        DEFB 70                         ; Alien/background_COLOUR (91)
                        DEFB 69                         ; Alien collected O2_COLOUR
                        DEFB 67                         ; O2_BONUS_COLOUR
                        DEFB 69                         ; H2O_BONUS_COLOUR
                        DEFB 66                         ; SHIELD_BONUS_COLOUR
                        DEFB 71                         ; 1000_BONUS_COLOUR
                        DEFB 67                         ; LIFE_BONUS_COLOUR
                        DEFB 69                         ; POW_BONUS_COLOUR
                        DEFB 68                         ; Rocket bonus colour
                        DEFB 69                         ; Player colour 69
                        DEFB 0,0,0,0,0                  ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Manipulate wave data
PROCESS_WAVE_DATA_3:
                        LD HL,WAVE_DATA1_3                ; Point to wave data
                        LD A,(WAVE_COUNT)               ; Get wave counter
                        OR A                            ; CP 0                            ; Wave 0?
                        JR Z,SKIP_WAVE_ADD              ; Skip adding wave blocks if so
                        LD DE,106                       ; Setup DE for addition

SELECT_WAVE_LOOP:
                        ADD HL,DE                       ; Move to correct block

                        DEC A                           ; Take 1 from wave select loop
                        JR NZ,SELECT_WAVE_LOOP          ; Jump back until wave data selected
SKIP_WAVE_ADD:
; HL=Wave table data pointer



;HL=wave table data pointer that we need to copy to live wave data area

                        LD DE,LIVE_WAVE_DATA_STORE      ; Point to Live wave data store
                        LD BC,106                       ; 136 wave data bytes to copy
                        LDIR                            ; Copy data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;LIVE_WAVE_DATA_STORE:
;NUMBER_OF_ALIENS_SETTINGS:     DEFB 15                       ; No of aliens
;ALIEN_APPEARS_SETTINGS:        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien
;ALIEN_DROPS_SETTINGS:          DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien drop timer to set the alien data
;ALIEN_START_COORDINATES_SETTINGS:DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien start coordinates (usually portal location)
;ALIEN_END_COORDINATES_SETTINGS:DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien goes to these coordinates
;ALIEN_SPLIT_COUNTER_SETTINGS:DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien split counter (Up to 15, 0-disabled, 1 to 254 count up, 255-enabled
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Current Wave data is now copied to the live wave data store
                        LD DE,NUMBER_OF_ALIENS_SETTINGS ; Point at number of aliens for this level
                        LD A,(DE)                       ; Get number of aliens to hit
                        LD (ALIEN_HIT_COUNTER),A        ; Set alien hit counter
                        INC DE                          ; Point at alien appears live wave data
                        ;  LD HL,NUMBER_OF_ALIENS_SETTINGS ; Point to live wave data store number of aliens
                        LD B,A                          ; Get number of aliens
                        PUSH BC                         ; Save number of aliens
;B=Number of aliens
                        LD HL,ALIEN_DATA1+1             ; Move to alien data pointers
                        ; INC HL                          ; Move in 1 byte to set alien appears counter
; Set Aliens appear data
; HL=Live wave data store alien location pointer for alien appears counter
; DE=Wave data for current level
NUMBER_OF_ALIENS_LOOP_3:
                        LD A,(DE)                       ; Get current alien appears settings

; HL=Current Alien data pointer

                        LD (HL),A                       ; Set alien data alien appears setting

                        PUSH DE                         ; Save alien appears setting pointer
                        LD DE,29                        ; Setup DE for addition of 29 bytes for next alien data block
                        ADD HL,DE                       ; Add 29 bytes for next alien data block
                        POP DE                          ; Restore alien appears setting pointer

                        INC DE                          ; Move to next alien appears setting pointer

                        DJNZ NUMBER_OF_ALIENS_LOOP_3      ; Loop back until all aliens are setup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set alien drop data
                        LD DE,ALIEN_DROPS_SETTINGS      ; Point at alien drop live wave data
                        LD HL,ALIEN_DATA1               ; Move to alien data pointers
                        POP BC                          ; Get number of aliens
                        PUSH BC                         ; Save number of aliens
;B=Number of aliens
                        INC HL                          ; move into alien data to set alien drop counter
                        INC HL                          ;
                        INC HL                          ;
; Set Aliens drop data
; DE=first Live wave data store alien drop settings pointer
NUMBER_OF_ALIENS_LOOP2_3:

                        LD A,(DE)                       ; Get current alien appears settings

; HL=Current Alien data pointer

                        LD (HL),A                       ; Set alien data alien appears setting

                        PUSH DE                         ; Save alien appears setting pointer
                        LD DE,29                        ; Setup DE for addition of 29 bytes for next alien data block
                        ADD HL,DE                       ; Add 29 bytes for next alien data block
                        POP DE                          ; Restore alien appears setting pointer

                        INC DE                          ; Move to next alien appears setting pointer
                        DJNZ NUMBER_OF_ALIENS_LOOP2_3     ; Loop back until all aliens are setup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set alien start coordinates data
                        LD DE,ALIEN_START_COORDINATES_SETTINGS ; Point at alien start coordinates live wave data
                        LD HL,ALIEN_DATA1               ; Move to alien data pointers data store number of aliens
                        POP BC                          ; Get number of aliens
                        PUSH BC                         ; Save number of aliens

                        PUSH DE                         ; Save alien appears setting pointer
                        LD DE,25                        ; Setup DE for addition of 25 bytes for start coordinate
                        ADD HL,DE                       ; Add 25 bytes for for start coordinate
                        POP DE                          ; Restore alien start coordinates setting pointer


;B=Number of aliens

; IX=first Live wave data store alien location pointer
NUMBER_OF_ALIENS_LOOP3_3:

                        LD A,(DE)                       ; Get current alien start coordinates settings

; HL=Current Alien data pointer

                        LD (HL),A                       ; Set alien data alien start coordinates setting
                        INC DE                          ;
                        INC HL                          ;
                        LD A,(DE)                       ; Get current alien start coordinates settings
                        LD (HL),A                       ; Set alien data alien start coordinates setting
                        INC DE                          ;
                        PUSH DE                         ; Save alien appears setting pointer
                        LD DE,28                        ; Setup DE for addition of 28 bytes for next alien data block
                        ADD HL,DE                       ; Add 28 bytes for next alien data block
                        POP DE                          ; Restore alien appears setting pointer


                        DJNZ NUMBER_OF_ALIENS_LOOP3_3     ; Loop back until all aliens are setup


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set alien end coordinates data
                        LD DE,ALIEN_END_COORDINATES_SETTINGS ; Point at alien end coordinates live wave data
                        LD HL,ALIEN_DATA1               ; Move to alien data
                        POP BC                          ; Get number of aliens
;B=Number of aliens
                        PUSH DE                         ; Save alien end coordinates setting pointer
                        LD DE,27                        ; Setup DE for addition of 27 bytes for end coordinates
                        ADD HL,DE                       ; Add 25 bytes for end coordinates
                        POP DE                          ; Restore alien end coordinates setting pointer


; IX=first Live wave data store alien location pointer
NUMBER_OF_ALIENS_LOOP4_3:

                        LD A,(DE)                       ; Get current alien end coordinates settings

; HL=Current Alien data pointer

                        LD (HL),A                       ; Set alien data alien end coordinates setting
                        INC DE                          ; Move to next alien end coordinates setting pointer
                        INC HL                          ;
                        LD A,(DE)                       ; Get current alien end coordinates settings
                        LD (HL),A                       ; Set alien data alien end coordinates setting
                        INC DE                          ;
                        PUSH DE                         ; Save alien end coordinates setting pointer
                        LD DE,28                        ; Setup DE for addition of 28 bytes for next alien data block
                        ADD HL,DE                       ; Add 28 bytes for next alien data block
                        POP DE                          ; Restore alien appears setting pointer


                        DJNZ NUMBER_OF_ALIENS_LOOP4_3     ; Loop back until all aliens are setup
                        RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
        if *> 54869                                     ;
                        zeuserror "out of room"         ;
        endif                                           ;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



