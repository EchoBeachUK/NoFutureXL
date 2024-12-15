;                         \ |          __|      |                    \ \  /  |
;                        .  |   _ \    _| |  |   _|  |  |   _| -_)    >  <   |
;                       _|\_| \___/   _| \_,_| \__| \_,_| _| \___|    _/\_\ ____|
;                      (C) 2024 By Steve Broad unless stated anywhere else in code



AppFilename:            equ "NoFuture128"               ; What we're called (for file generation)

AppFirst:               equ 23808                       ; First byte of code (uncontended memory) 32768

                        zeusemulate "128K"              ; Set the model and enable ULA+


                        ORG 23808                       ;                                      ;

; 23808
;ATTR1_EMPTY:            DEFS 768                        ; EQU 23808                   ;Screen ATTR Buffer for empty level
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Alien data 29 bytes each
ALIEN_DATA1:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA2:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA3:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA4:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA5:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA6:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA7:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA8:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA9:            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA10:           DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA11:           DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA12:           DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA13:           DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA14:           DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

ALIEN_DATA15:           DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
                        DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
                        DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
                        DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
                        DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
                        DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
                        DEFB 0,0                        ; Alien start coordinate
                        DEFB 0,0                        ; Alien end coordinate

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;                       56,48    88,48   120,48    152,48      184,48
;                       56,72    88,72   120,72    152,72      184,72
;                       56,96    88,96   120,96    152,96      184,96

; Wave data      106 bytes
;            DEFB 15                         ; No of aliens
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien drop timer to set the alien data
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien start coordinates (usually portal location)
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien goes to these coordinates
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien split counter (Up to 15, 0-disabled, 1 to 254 count up, 255-enabled
;
;ALIEN_DATA1:   29 bytes
;            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
;            DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
;            DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
;            DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
;            DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
;            DEFB 0,0                        ; Alien start coordinate (25 in)
;            DEFB 0,0                        ; Alien end coordinate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        DEFB 1,2,3,4,5,6,7,8,9,10       ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Copies wave data here for manipulation


LIVE_WAVE_DATA_STORE:   ; 106 bytes                     ;
NUMBER_OF_ALIENS_SETTINGS:DEFB 0                        ; No of aliens
ALIEN_APPEARS_SETTINGS: DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien appears counter, counts to 255 then enables alien
ALIEN_DROPS_SETTINGS:   DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien drop timer to set the alien data
ALIEN_START_COORDINATES_SETTINGS:DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien start coordinates (usually portal location)
ALIEN_END_COORDINATES_SETTINGS:DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien goes to these coordinates
ALIEN_BACKGROUND_COLOUR:DEFB 0                          ; Bright yellow on black 70
ALIEN_COLLECTED_O2_COLOUR:DEFB 0                        ; Bright cyan on black 69
O2_BONUS_COLOUR:        DEFB 0                          ; Bright magenta on black 67
H2O_BONUS_COLOUR:       DEFB 0                          ; Bright cyan on black 69
SHIELD_BONUS_COLOUR:    DEFB 0                          ; Bright red on black 66
THOUSAND_BONUS_COLOUR:  DEFB 0                          ; Bright white on black 71
LIFE_BONUS_COLOUR:      DEFB 0                          ; Bright magenta on black 67
POW_BONUS_COLOUR:       DEFB 0                          ; Bright cyan on black 69
ROCKET_BONUS_COLOUR     DEFB 0                          ; Bright green on black 68
PLAYER_COLOUR:          DEFB 0                          ; Player colour cyan on black 69
                        DEFB 0,0,0,0,0                  ;
                        DEFB 1,2,3,4,5,6,7,8,9,10       ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
START_KEY_ENABLED:      DEFB 1                          ; Start key enable (1)/disable (0)
TEXT_COORDINATES:       DEFB 0,0                        ; Text coordinates store
TEXT_STRING_POINTER     DEFB 0,0                        ; Text string pointer
CONTROL:                DEFB 0                          ; 0=keyboard, 1=Kempston joystick, 2=Fuller
SCORE:                  DEFM "1234567"                  ; 10,1000 digit score
                        DEFM "0000000"                  ; Overflow digits (these may be updated, but are never printed)
SP1X_SHIP               DEFB 0                          ; Player X coordinate (left/Right)
SP1Y_SHIP               DEFB 0                          ; Player Y coordinate (up/down, 0 top)
KEY_STORE_MASTER:       DEFB 0                          ; Stores selected keys
PLAYER_MISSILE_GRAPHIC: DEFB 0,0                        ; Player missile graphic pointer
FIRE_ON                 DEFB 0                          ; Fire 0 for off, 1 for on
PORTAL_APPEAR_COUNTER:  DEFB 0                          ; Counts up for portal appear animation
PORTAL_OPEN_CLOSE:      DEFB 0                          ; Portal =255 to open, =0 to close
H2O:                    DEFB 0                          ; Amount of H2O left TEXT LINE
O2:                     DEFB 0                          ; Amount of O2 left TEXT LINE
PORTAL_OPEN_COUNTER:    DEFB 0                          ; Counts up to 255, when 255, portal opens then it counts down again to 0 and portal closes
PORTAL_OPEN_COUNTER_ENABLE:DEFB 0                       ; If enabled, allows portal open counter to count up
LIVES:                  DEFM "0"                        ; Store lives
                        DEFM "00"                       ;
WAVE_COUNT:             DEFB 0                          ; Wave counter
ALIEN_GRAPHIC:          DEFB 0,0                        ; Alien graphic store
ALIEN_GRAPHIC_COUNT:    DEFB 0                          ; Alien graphic counter 0 to 3
PLAYER_DIRECTION_LEFT_RIGHT:DEFB 0                      ; Stores player movement flag
FIRE:                   DEFB 0                          ; Fire pressed store
ALIEN_HIT_COUNTER:      DEFB 0                          ; Count aliens hit for next level
ALIEN_OFFSET_ADJUST     DEFB 0                          ; Move all alliens to offset
ALIEN_OFFSET_ADJUST_COUNTER:DEFB 0                      ; When 255, adjust alien offset
ALIEN_OFFSET_LEFT_RIGHT:DEFB 0                          ; Alien offset 1=left, 2=right
BUFFER_RETURN:          DEFB 0                          ; Buffer return status 1=on
BONUS_UP_DOWN:          DEFB 0                          ; Bonus up/down coordinate
BONUS_LEFT_RIGHT        DEFB 0                          ; Bonus left/right coordinate
BONUS_ENABLE:           DEFB 0                          ; Bonus enabled
BONUS_GRAPHIC_POINTER:  DEFB 0,0                        ; Bonus graphic pointer
SHIELD_BONUS_COUNTDOWN: DEFB 0                          ; Shield bonus countdown to 0 and then disabled
;SHIELD_CHANGER_COUNTER: DEFB 0                          ; Shield changer counter
;PLAYER_SHIP_GRAPHIC_POINTER:DEFB 0,0                    ; Store player ship graphic pointer
ALIEN_HEAD_ENABLED:     DEFB 0                          ; Alien Head =0 for disabled, 1 for coming out, 2 for going away, 3 for displaying
ALIEN_HEAD_MOVEMENT_COUNTER:DEFB 0                      ; Counts for alien head movement so we know its fully out or in
ALIEN_HEAD_MOVE_COUNTER:DEFB 0                          ; Counts to 39 to add alien head move in a circle data
ALIEN_HEAD_CIRCLE_LOCATOR:DEFB 0,0                      ; Pointer for alien head circle data
GENERAL_COUNTER:        DEFB 0                          ; Counts 0 to 255 and loops
BONUS_SELECT_COUNTER    DEFB 0                          ; counts 1 to 20 for bonus select
ALIENHEAD_HIT_COUNTER:  DEFB 0                          ; Used to count how many times we hit alienhead
PLAYER_MISSILE_SPREAD:  DEFB 0                          ; Set to 1 for player missile spread
ROTATE_BONUS            DEFB 0                          ; Set bonus rotation status
SHOW_ALIEN_IMAGE:       DEFB 0                          ; Set to 1 to jump alien image
PLAYER_HIT:             DEFB 0                          ; Set to 1 when player is hit then counts up
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Spinning top alien frames 32 bytes per anim frame
CURRENT_ALIEN_GRAPHIC:
                        defb 0, 0, 0, 0, 1, 128, 1, 128, 3, 192, 31, 248, 127, 158, 255, 199;
                        defb 159, 255, 255, 255, 127, 254, 31, 248, 3, 192, 1, 128, 1, 128, 0, 0;

                        defb 0, 0, 0, 0, 1, 128, 1, 128, 3, 192, 31, 248, 127, 158, 255, 199;
                        defb 243, 255, 255, 255, 127, 254, 31, 248, 3, 192, 1, 128, 1, 128, 0, 0;

                        defb 0, 0, 0, 0, 1, 128, 1, 128, 3, 192, 31, 248, 127, 158, 255, 199;
                        defb 255, 159, 255, 255, 127, 254, 31, 248, 3, 192, 1, 128, 1, 128, 0, 0;

                        defb 0, 0, 0, 0, 1, 128, 1, 128, 3, 192, 31, 248, 127, 158, 255, 199;
                        defb 255, 243, 255, 255, 127, 254, 31, 248, 3, 192, 1, 128, 1, 128, 0, 0;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

        if *> 24570                                     ;
                        zeuserror "out of room"         ;
        endif                                           ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        ORG 24576                       ;

; 24576 (96)
SCREEN1:                DEFS 6143                       ; EQU 24576                   ;Screen buffer
; 30720 (120)
ATTR1:                  DEFS 768                        ; EQU 30720                 ;Screen ATTR Buffer
; 31488 (123)
;SCREEN1_EMPTY:          DEFS 6143                       ; EQU 30719                    ;Screen buffer for empty 3


SCREEN:                 EQU 16384                       ; Screen
ATTR:                   EQU 22528                       ; ATTR

; Start planting code here. (When generating a tape file we start saving from here)
                        org 31488                       ; Start of application
EXEC:
AppEntry:               JP START                        ;






START:                  ; call DISPLAY_COCKPIT          ;
                        ;      LD A,7
                        ;  call COLOUR_ATTR1
                        ;  jp GAMEPLAYSTART

                        ; JP HI_SCORE_LOOP               ;
                        ;  JP HI_SCORE_ENTRY               ;
                        ; jp DISPLAY_HI_SCORE_TABLE2

                        ; CALL DISPLAY_COCKPIT
                        DI                              ;
                        LD SP,Zeus_SP                   ;

                        XOR A                           ;
                        OUT (254),A                     ;

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0

                        LD IX,PRESS_ANY_KEY_0           ;
                        CALL DISPLAY_STRING             ;

                        CALL MUSIC_0                    ;
                        CALL FADE_CLEAR_PLAY_AREA       ; Clear play area
                        CALL RESET_ALL_SOUNDS           ; Reset Sound
                        CALL RESET_STATUS               ;
DISPLAY_NEWS:
                        LD BC,65022                     ; Reads the half row A to G
                        IN A,(C)                        ; Get keys
                        BIT 0,A                         ; Key A pressed to go back to News?
                        JP Z,DISPLAY_NEWS               ; Display news screen

                        CALL CLEAR_SCREEN               ;
                        LD A,71                         ;
                        LD (ALIEN_BACKGROUND_COLOUR),A  ;
                        CALL COLOUR_FULL_PLAY_AREA      ;

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0
                        CALL DISPLAY_COCKPIT_0          ;

                        CALL DISPLAY_SCORE_FIGURES      ; Display score figures
                        CALL DISPLAY_HI_SCORE_FIGURES   ; Display Hi score figures

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0
                        LD IX,START_MESSAGEA_0          ;
                        CALL DISPLAY_STRING             ;

                        CALL DISPLAY_TELETEXT_TITLE_TEMPLATE_0;
                        LD IX,SBCFAX_NEWS_TITLE_0       ;
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data

                        LD IX,START_MESSAGE_0           ;
                        CALL DISPLAY_STRING             ;

                        LD IX,START_MESSAGEB_0          ;
                        CALL DISPLAY_STRING             ;

                        LD IX,TITLE_0                   ;
                        CALL DISPLAY_STRING             ;

                        LD IX,SELECT_CONTROLS_TEXT_0    ;
                        CALL DISPLAY_STRING             ;

                        LD IX,START_MESSAGE2_0          ;
                        CALL DISPLAY_STRING             ;

                        LD IX,START_MESSAGE2A_0         ;
                        CALL DISPLAY_STRING             ;

                        LD IX,START_MESSAGE2B_0         ;
                        CALL DISPLAY_STRING             ;

                        LD HL,DISPLAY_COUNTING_NUMBER+4 ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;

                        CALL SELECT_JK                  ; Wait for keyboard or joystick keys

                        LD A,71                         ;
                        LD (ALIEN_BACKGROUND_COLOUR),A  ;
                        CALL COLOUR_FULL_PLAY_AREA      ;
                        CALL FADE_CLEAR_PLAY_AREA       ;
                        JP HI_SCORE_LOOP2               ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Hi score loop
HI_SCORE_LOOP:
                        CALL MEMORY_SWITCH_0            ; Switch to memory 0
                        CALL DISPLAY_COCKPIT_0          ; Display cockpit
                        CALL UPDATE_METERS              ; Update meters
                        CALL RESET_STATUS               ;

                        CALL FADE_CLEAR_PLAY_AREA       ; Clear play area
                        LD A,9                          ; A=9 to set meters
                        LD (H2O),A                      ; Set H2O meter
                        LD (O2),A                       ; Set O2 meter
                        CALL UPDATE_METERS              ; Update meters




HI_SCORE_LOOP2:

                        LD A,70                         ; 70=Bright yellow on black
                        LD (ALIEN_BACKGROUND_COLOUR),A  ; Set background colour at background colour routine
                        CALL COLOUR_FULL_PLAY_AREA      ;
                        CALL MEMORY_SWITCH_0            ; Switch to memory 0

                        CALL DISPLAY_INSTRUCTIONS_0     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Check for start or news key and delay screen
                        DI                              ;
                        LD HL,DISPLAY_COUNTING_NUMBER+4 ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;
CHECK_KEY1_LOOP:

                        LD IX,DISPLAY_COUNTING_NUMBER   ;
                        CALL DISPLAY_STRING             ;

                        LD HL,DISPLAY_COUNTING_NUMBER+6 ;
                        LD A,(HL)                       ;
                        CP "6"                          ;
                        JR NZ,INC_NUMBER_1              ;
                        DEC HL                          ;
                        LD A,(HL)                       ;
                        CP "9"                          ;
                        JR NZ,INC_NUMBER_1              ;
                        DEC HL                          ;
                        LD A,(HL)                       ;
                        CP "1"                          ;
                        JR NZ,INC_NUMBER_1              ;
                        JP NEXT_TELETEXT_1              ;
INC_NUMBER_1:
                        LD HL,DISPLAY_COUNTING_NUMBER+6 ;
                        CALL RND                        ;
                        CP 10                           ;
                        CALL C,INCREMENT_SCOREB         ;
SKIP_INC_NUMBER_1:
                        LD BC,65022                     ; Reads the half row A to G
                        IN A,(C)                        ; Get keys
                        BIT 0,A                         ; Key A pressed to go back to News?
                        JP Z,DISPLAY_NEWS               ; Display news screen
                        BIT 1,A                         ; Key S pressed to start game?
                        JR NZ,NO_KEY_PRESSED1           ; Return if not

KEY_PRESSED_0:
; A key is pressed to start game
                        LD A,71                         ;
                        LD (ALIEN_BACKGROUND_COLOUR),A  ;
                        CALL COLOUR_FULL_PLAY_AREA      ;

                        JP GAMEPLAYSTART                ; Jump to Main level game start address


NO_KEY_PRESSED1:
;0 key pressed to start game?
                        LD BC,61438                     ; Reads the half row 0 to 6
                        IN A,(C)                        ; Get keys
                        BIT 0,A                         ; Key A pressed to start game?
                        JP Z,KEY_PRESSED_0              ; Display news screen

                        JP CHECK_KEY1_LOOP              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NEXT_TELETEXT_1:
                        CALL COLOUR_FULL_PLAY_AREA      ;
                        CALL FADE_CLEAR_PLAY_AREA       ;

                        CALL DISPLAY_HI_SCORE_TABLE     ;

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0

                        LD IX,DISPLAY_INSTRUCTIONS_DATA1D_0;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1E_0;
                        CALL DISPLAY_STRING             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Check for start or news key and delay screen
                        DI                              ;
                        LD HL,DISPLAY_COUNTING_NUMBER+4 ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;
                        INC HL                          ;


CHECK_KEY2_LOOP:

                        LD IX,DISPLAY_COUNTING_NUMBER   ;
                        CALL DISPLAY_STRING             ;

                        LD HL,DISPLAY_COUNTING_NUMBER+6 ;
                        LD A,(HL)                       ;
                        CP "7"                          ;
                        JR NZ,INC_NUMBER_2              ;
                        DEC HL                          ;
                        LD A,(HL)                       ;
                        CP "9"                          ;
                        JR NZ,INC_NUMBER_2              ;
                        DEC HL                          ;
                        LD A,(HL)                       ;
                        CP "1"                          ;
                        JR NZ,INC_NUMBER_2              ;
                        JP NEXT_TELETEXT_2              ;
INC_NUMBER_2:
                        LD HL,DISPLAY_COUNTING_NUMBER+6 ;
                        CALL RND                        ;
                        CP 10                           ;
                        CALL C,INCREMENT_SCOREB         ;
SKIP_INC_NUMBER_2:
                        LD BC,65022                     ; Reads the half row A to G
                        IN A,(C)                        ; Get keys
                        BIT 0,A                         ; Key A pressed to go back to News?
                        JP Z,DISPLAY_NEWS               ; Display news screen
                        BIT 1,A                         ; Key S pressed to start game?
                        JR NZ,NO_KEY_PRESSED2           ; Return if not

                        JP KEY_PRESSED_0                ;

                        JP GAMEPLAYSTART                ; Jump to Main level game start address


NO_KEY_PRESSED2:
;0 key pressed to start game?
                        LD BC,61438                     ; Reads the half row 0 to 6
                        IN A,(C)                        ; Get keys
                        BIT 0,A                         ; Key A pressed to start game?
                        JP Z,KEY_PRESSED_0              ; Display news screen

                        JP CHECK_KEY2_LOOP              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
NEXT_TELETEXT_2:

                        CALL COLOUR_FULL_PLAY_AREA      ;
                        CALL FADE_CLEAR_PLAY_AREA       ;

                        JP HI_SCORE_LOOP2               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
INCREMENT_NUMBER:

SC37098B:               LD (HL),48                      ; Roll the digit over from '9' to '0'
                        DEC HL                          ; Point HL at the next digit to the left


;The entry point to this routine is here. HL pointing at the digit of the score to be incremented
INCREMENT_SCOREB:
SC37118B:


INC_SCORE_LOOPB:
                        LD A,(HL)                       ; Pick up a digit of the score
                        CP 57                           ; Is it '9'?
                        JR Z,SC37098B                   ; Jump if so
                        INC (HL)                        ; Increment the digit

                        RET                             ;



                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;   _____          __  __ ______    _____ _______       _____ _______
;  / ____|   /\   |  \/  |  ____|  / ____|__   __|/\   |  __ \__   __|
; | |  __   /  \  | \  / | |__    | (___    | |  /  \  | |__) | | |
; | | |_ | / /\ \ | |\/| |  __|    \___ \   | | / /\ \ |  _  /  | |
; | |__| |/ ____ \| |  | | |____   ____) |  | |/ ____ \| | \ \  | |
;  \_____/_/    \_\_|  |_|______| |_____/   |_/_/    \_\_|  \_\ |_|
;
; Initialise game varables that dont reset until game over
GAMEPLAYSTART:

                        XOR A                           ; A=0
                        LD (PLAYER_MISSILE_SPREAD),A    ; Reset player missile spread
                        LD (BONUS_SELECT_COUNTER),A     ; Reset bonus select counter
                        LD (WAVE_COUNT),A               ; Reset wave counter
                        LD (BUFFER_RETURN),A            ; Reset buffer return status
                        LD (ALIEN_GRAPHIC_COUNT),A      ; Reset alien graphic anim counter
                        LD A,0                          ;
; Set alien head initial status
                        LD (ALIEN_HEAD_ENABLED),A       ; Initial alien head status ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                       ; LD A,0;49
                        LD (WAVE_COUNT),A               ; Reset wave counter

                        LD A,9                          ; A=9 to set meters
                        LD (H2O),A                      ; Set H2O meter
                        LD (O2),A                       ; Set O2 meter
                        CALL UPDATE_METERS              ; Update meters

                        CALL SETUP_TESTTUBE_BUBBLES     ; Reset test tube bubbles

                        LD A,3                          ;
                        LD (SET_NUMBER_OF_PLAYER_ROCKETS+1),A ; Set player number of missiles to 3

                        CALL RESET_STATUS               ;
                        LD HL,PLAYER_MISSILE_GRAPHIC1   ; Point to Player basic missile graphic
                        LD (PLAYER_MISSILE_GRAPHIC),HL  ; Set plaher missile graphic pointer to basic missile graphic
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Level starts here
; Setup varables for level
NEXT_WAVE:
                        CALL RESET_ALIEN_MISSILES       ; Reset all alien fire
                        CALL RESET_PLAYER_FIRE          ; Reset all player fire data
                        CALL SETUP_SNOWFLAKES           ; Setup stars
                        CALL RESET_ALIEN_HEAD_DATA      ; Reset alien head data
                        CALL RESET_ALIEN_HEAD_MISSILES  ; Reset alien head missiles
                        XOR A                           ; A=0
                        LD (PLAYER_HIT),A               ; Reset player hit counter
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        LD (ALIENHEAD_HIT_COUNTER),A    ; Reset alien head hit counter
                        LD (GENERAL_COUNTER),A          ; Reset General counter
                        LD (PORTAL_OPEN_CLOSE),A        ; Initialise Portal open/close
                        LD (BONUS_ENABLE),A             ; Reset bonus
                        LD (SHOW_ALIEN_IMAGE),A         ; Reset show alien image
                        LD (ALIEN_OFFSET_ADJUST_COUNTER),A; When 255, adjust alien offset
                        LD (ALIEN_OFFSET_LEFT_RIGHT),A  ; Alien offset 0=OFF, 1=left, 2=right
                        LD (PORTAL_APPEAR_COUNTER),A    ; Initialise Portal appear counter

                        LD (ALIEN_HEAD_MOVEMENT_COUNTER),A; Reset alien head counter
                        LD (ALIEN_HEAD_MOVE_COUNTER),A  ; Reset alienhead move counter
                        LD A,254                        ;
                        LD (PORTAL_OPEN_COUNTER),A      ; Reset portal open counter

                        LD A,1                          ; Make A=1
                        LD (ALIEN_OFFSET_ADJUST),A      ; Move all alliens to offset
                        LD (PORTAL_OPEN_COUNTER_ENABLE),A ; Update portal open counter enabler to 1
; Set alien head initial status
                        ; LD A,0                          ;
                        ; LD (ALIEN_HEAD_ENABLED),A       ; Initial alien head status ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        ;    LD A,255
                        ;   LD (PORTAL_OPEN_COUNTER),A



                        LD A,120                        ; Middle left/right
                        LD (SP1X_SHIP),A                ; Set Middle left/right

                        LD A,168                        ; Player ship starts at line 21 and goes up to line 19 at 152
                        LD (SP1Y_SHIP),A                ; Set bottom up/down
                        CALL FADE_CLEAR_PLAY_AREA       ;
                        LD A,7                          ; To fill ATTR 1 with white on black
                        CALL COLOUR_ATTR1               ; Fill ATTR buffer with white on black

                        CALL CLEAR_ALIEN_DATA           ; Reset all alien data

                        CALL MEMORY_SWITCH_3            ; Switch to memory 0
                        LD A,(WAVE_COUNT)               ; Get wave number
                        CP 50                           ; Are we on wave 50 or above?
                        CALL C,PROCESS_WAVE_DATA_3      ; If not then Copies wave data to live and updates alien settings

                        LD A,50                         ; Set player shield countdown
                        LD (SHIELD_BONUS_COUNTDOWN),A   ; Reset shield bonus countdown

                        LD HL,CIRCLE_MOVE_DATA          ; Point HL at alien head circle data
                        LD (ALIEN_HEAD_CIRCLE_LOCATOR),HL ; Store alien head circle data pointer

                        LD A,9                          ; A=9 to set meters
                        LD (H2O),A                      ; Set H2O meter
                        LD (O2),A                       ; Set O2 meter
                        CALL UPDATE_METERS              ; Update meters

                        LD A,(ALIEN_BACKGROUND_COLOUR)  ;
                        LD (ALIEN_BACKGROUND_COLOURA+1),A;
                        LD (ALIEN_BACKGROUND_COLOURB+1),A;

                        LD (GAME_OVER_TEXT+2),A         ; Set background colour for text

                        LD A,(PLAYER_COLOUR)            ; Get player colour
                        LD (SET_PLAYER_COLOUR+1),A      ; Set player colour at sprite routine for player

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  __  __          _____ _   _    _____          __  __ ______   _      ____   ____  _____
; |  \/  |   /\   |_   _| \ | |  / ____|   /\   |  \/  |  ____| | |    / __ \ / __ \|  __ \
; | \  / |  /  \    | | |  \| | | |  __   /  \  | \  / | |__    | |   | |  | | |  | | |__) |
; | |\/| | / /\ \   | | | . ` | | | |_ | / /\ \ | |\/| |  __|   | |   | |  | | |  | |  ___/
; | |  | |/ ____ \ _| |_| |\  | | |__| |/ ____ \| |  | | |____  | |___| |__| | |__| | |
; |_|  |_/_/    \_\_____|_| \_|  \_____/_/    \_\_|  |_|______| |______\____/ \____/|_|

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MAIN_GAME_LOOP:
; Clear buffers
                        ;
; Fast clear-screen routine
; Uses the stack to block clear memory
; Clear screen buffer


                        DI                              ;
                        LD (STACKPOINTER+1),SP          ; Save the stack
                        LD SP,SCREEN1+6143              ; Set stack pointer to end of screen buffer
                        LD HL,0                         ; Set HL to 0 to clear the buffer
                        LD B,189                        ; Set loop counter
; Fill the memory
PUSHLOOP:
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2

                        DJNZ PUSHLOOP                   ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Fast clear-screen routine
; Uses the stack to block clear memory

; Save the stack pointer
                        LD SP,ATTR1+768-64              ; e.g. to fill from &C000 to &FFFF (&4000 bytes), set SP to &FFFF+1 = &0000

; Define the region of RAM to be filled
ALIEN_BACKGROUND_COLOURA:LD H,0                         ;
ALIEN_BACKGROUND_COLOURB:LD L,0                         ; Use HL or whichever 16-bit register you prefer
                        ; LD HL,17990                     ;

                        LD B,19                         ; 19 lines to fill for visible ATTR
; Fill the memory
PUSHLOOP2:
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2
                        PUSH HL                         ; Writes HL to (SP-2) and DECs SP by 2


                        DJNZ PUSHLOOP2                  ;
STACKPOINTER:           LD SP,0                         ; Restore the stack

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  _____  _____       __          __   _____          __  __ ______
; |  __ \|  __ \     /\ \        / /  / ____|   /\   |  \/  |  ____|
; | |  | | |__) |   /  \ \  /\  / /  | |  __   /  \  | \  / | |__
; | |  | |  _  /   / /\ \ \/  \/ /   | | |_ | / /\ \ | |\/| |  __|
; | |__| | | \ \  / ____ \  /\  /    | |__| |/ ____ \| |  | | |____
; |_____/|_|  \_\/_/    \_\/  \/      \_____/_/    \_\_|  |_|______|
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        LD HL,GENERAL_COUNTER           ; Get general counter
                        INC (HL)                        ; Add 1 to general counter


                        LD A,(PORTAL_OPEN_COUNTER_ENABLE) ; Get status of portal open counter enabler
                        OR A                            ; CP 0                            ; Is it ON to enable the portal open counter to increment?
                        JR Z,SKIP_PORTAL_ENABLER_COUNTER ; Skip if so

                        LD HL,PORTAL_OPEN_COUNTER       ; Get portal open counter
                        INC (HL)                        ; Add 1 to Portal open counter
                        LD A,(HL)                       ; Place portal open counter into A
                        CP 255                          ; Is it at 255?
                        JR NZ,SKIP_PORTAL_ENABLER_COUNTER2 ; If not enabled then skip setting portal open_close
                        LD (PORTAL_OPEN_CLOSE),A        ; Update portal open close status
                        INC A                           ;  Make A =0
                        LD (PORTAL_OPEN_COUNTER_ENABLE),A ; Update portal open counter enabler to disabled as the portal is open

SKIP_PORTAL_ENABLER_COUNTER2:


SKIP_PORTAL_ENABLER_COUNTER:

                        LD A,(PORTAL_APPEAR_COUNTER)    ; Get Portal appear counter
                        OR A                            ; Is it 0?
                        JR Z,CONTINUE_AFTER_OPEN_CLOSE_PORTAL_CHECK ; If so then skip open/close portal

                        LD HL,PORTAL_GRAPHIC_LOOKUP_TABLE-2; Point to Portal graphic lookup address table
                        ;  LD B,A                          ; B=Portal appear counter to choose graphic
;SELECT_PORTAL_GRAPHIC_LOOP:
                        ; INC HL                          ; Add 2 to HL to move to next 16 bit address in table
                        ; INC HL                          ;
                        ; DJNZ SELECT_PORTAL_GRAPHIC_LOOP ; Jump back until at the correct part of the table
                        ADD A,A                         ;
                        LD E,A                          ;
                        LD D,0                          ;
                        ADD HL,DE                       ;

                        LD A,(HL)                       ; Get data first byte into A
                        INC HL                          ; Move to next address in table
                        LD B,(HL)                       ; Get data of second byte into B

                        LD L,A                          ; Move first byte data to L
                        LD H,B                          ; Move second byte data to H
                        PUSH HL                         ; Place address onto stack
                        POP IX                          ; Restore from stack into IX

                        CALL DISPLAY_LARGE_GRAPHIC      ; Display large graphic


CONTINUE_AFTER_OPEN_CLOSE_PORTAL_CHECK:


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Opens/closes/animates portal
SELECT_PORTAL:
                        LD HL,PORTAL_APPEAR_COUNTER     ;
                        LD A,(PORTAL_OPEN_CLOSE)        ; Get portal Open/Close status
                        CP 255                          ; Portal status open?
                        JR NZ,SKIP_OPEN_PORTAL          ; If not then skip opening portal

; Check to open portal

                        LD A,(HL)                       ; Get portal appear counter
                        CP 12                           ; Is it at 12?
                        JR Z,SKIP_ADD_TO_PORTAL         ; If so then jump adding more to portal appear counter

                        INC (HL)                        ; Add 1 to update portal appear counter
                        JP SKIP_PORTAL_APPEAR           ; Jump to end to update portal appear counter
SKIP_ADD_TO_PORTAL:
                        LD (HL),9                       ; Set for updating portal appear counter
                        JP SKIP_PORTAL_APPEAR           ; Jump to update portal appear counter

SKIP_OPEN_PORTAL:
; Check to close portal
                        OR A                            ; CP 0 Portal status closed?
                        JR NZ,SKIP_PORTAL_APPEAR        ; If status is not set to close then skip

                        LD A,(HL)                       ; Get portal appear counter
                        OR A                            ; CP 0 Is it 0?
                        JR Z,SKIP_PORTAL_APPEAR         ; Skip making any changes if set to zero

                        DEC (HL)                        ; Take 1 from A to update portal appear counter

SKIP_PORTAL_APPEAR:



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Check to see if Alien head is required
; ALIEN_HEAD_ENABLED =0 for disabled, 1 for coming out, 2 for going away, 3 for displaying, 4 for exploding
                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        OR A                            ; CP 0                            ; If disabled then skip alien head
                        JP Z,SKIP_DISPLAY_ALIEN_HEAD    ; Skip alien head if so

; Is alien head exploding?
                        CP 4                            ; Is alien head out and exploding?
                        JR Z,EXPLODE_ALIENHEAD          ; If so then explode alien head

; Is alien head out and in display mode?
                        CP 3                            ; Is alien head out and in display mode?
                        JR NZ,SKIP_3                    ; If not then skip display mode

                        LD HL,413                       ; HL=413 to set amount of points to draw full alien head
                        LD (LARGE_ALIEN_LENGTH+1),HL    ; Set loop for alien head draw to HL
                        LD HL,SKIP_ADDING_A_ROW         ; HL=address of code to jump to skip adding a row to alien head to speed up drawing
                        LD (ROW_JUMP+1),HL              ; Set the jump at ROW_JUMP to the address to jump to


                        LD HL,ALIEN_HEAD_CIRCLE_LOCATOR ; Point at alien head circle data pointer
                        INC (HL)                        ; Move pointer forward 1 address
                        INC (HL)                        ; Move pointer forward 1 address
                        LD HL,ALIEN_HEAD_MOVE_COUNTER   ; Point at alien head move counter
                        INC (HL)                        ; Add 1 to alienhead move counter
                        LD A,(HL)                       ; Get alienhead move counter into A for testing
                        CP 39                           ; Is it at 39?
                        JR C,SKIP_RESETTING_ALIENHEAD_MOVE_COUNTER;
                        LD (HL),0                       ; Reset alien move counter
                        LD HL,CIRCLE_MOVE_DATA          ; Point HL at alien head circle data
                        LD (ALIEN_HEAD_CIRCLE_LOCATOR),HL ; Store alien head circle data pointer

SKIP_RESETTING_ALIENHEAD_MOVE_COUNTER:
                        JP DISPLAY_ALIEN_HEAD           ; Jump to displaying alien head
SKIP_3:
; Is alien head going away?
                        CP 2                            ; Is alien head going away?
                        JR NZ,SKIP_2                    ; If not then skip going away
                        LD HL,200                       ; HL=200 to set amount of points to draw alien head going away
                        LD (LARGE_ALIEN_LENGTH+1),HL    ; Set loop for alien head draw to HL
                        LD HL,ADD_ANOTHER_ROW           ; HL=address of code to jump to add a row to alien head to speed up drawing
                        LD (ROW_JUMP+1),HL              ; Set the jump at ROW_JUMP to the address to jump to
                        JP SKIP_BRINGING_OUT_ALIEN_HEAD ; Jump to displaying alien head

SKIP_2:
; Is alien head coming out?
                        CP 1                            ; Is alien head coming out?
                        JR NZ,SKIP_1                    ; If not then skip coming out
                        LD HL,200                       ; HL=200 to set amount of points to draw alien head going away
                        LD (LARGE_ALIEN_LENGTH+1),HL    ; Set loop for alien head draw to HL
                        JP BRING_OUT_ALIEN_HEAD         ; If not then skip alien head coming out
                        LD HL,ADD_ANOTHER_ROW           ; HL=address of code to jump to add a row to alien head to speed up drawing
                        LD (ROW_JUMP+1),HL              ; Set the jump at ROW_JUMP to the address to jump to
SKIP_1:
                        JP SKIP_DISPLAY_ALIEN_HEAD      ; Skip alien head
BRING_OUT_ALIEN_HEAD:
; Alien head is coming out
                        LD HL,ALIEN_HEAD_MOVEMENT_COUNTER; Get alien head movement counter
                        INC (HL)                        ; Add 1 to alien head counter
                        LD A,(HL)                       ; Get alien head counter
                        CP 50                           ; Is alien head fully out?
                        JR NZ,DISPLAY_ALIEN_HEAD        ; Skip setting alien head to display
                        LD (HL),0                       ; Reset alien head movement counter
                        LD A,3                          ; A=3 for display
                        LD (ALIEN_HEAD_ENABLED),A       ; Set alien head enabled status to display
                        JP DISPLAY_ALIEN_HEAD           ; Alien head is out so jump other alien head modes

SKIP_BRINGING_OUT_ALIEN_HEAD:
;Alien head is going away?
                        LD HL,ALIEN_HEAD_MOVEMENT_COUNTER; Get alien head movement counter
                        INC (HL)                        ; Add 1 to alien head counter
                        LD A,(HL)                       ; Get alien head counter
                        CP 45                           ; Is alien head fully away?
                        JR NZ,SKIP_PUTTING_AWAY_ALIEN_HEAD; Skip setting alien head to disabled

                        XOR A                           ; A=0 to disable alien head
                        LD (HL),A                       ; Reset alien head movement counter
                        LD (ALIEN_HEAD_ENABLED),A       ; Set alien head enabled status to disabled
                        JP MOVE_TO_NEXT_LEVEL           ; Go to next level

EXPLODE_ALIENHEAD:
; Explode alien head
                        LD HL,200                       ; HL=200 to set amount of points to draw alien head going away
                        LD (LARGE_ALIEN_LENGTH+1),HL    ; Set loop for alien head draw to HL
                        LD HL,ADD_ANOTHER_ROW           ; HL=address of code to jump to add a row to alien head to speed up drawing
                        LD (ROW_JUMP+1),HL              ; Set the jump at ROW_JUMP to the address to jump to


                        LD HL,ALIEN_HEAD_MOVEMENT_COUNTER; Point to alien head movement counter
                        INC (HL)                        ; Add 1 to alien head counter
                        LD A,(HL)                       ; Get alien head counter
                        CP 50                           ; Is alien head fully out?
                        JR NZ,DISPLAY_ALIEN_HEAD        ; Skip resetting alien head
                        LD A,0                          ; A=0 for off
                        LD (HL),A                       ; Reset alien head movement counter
                        LD (ALIEN_HEAD_ENABLED),A       ; Set alien head enabled status to off
                        JP MOVE_TO_NEXT_LEVEL           ; Go to next level

SKIP_PUTTING_AWAY_ALIEN_HEAD:


DISPLAY_ALIEN_HEAD:
; Alien head in display mode
;                             Live data
;                            X Y
;                            | | X Y Default data
;                       DEFB 0,0,5,138
                        DI                              ;
                        LD IX,ALIEN_HEAD_DATA           ; Point at Alien head data
LARGE_ALIEN_LENGTH:     LD BC,413                       ; 413                      ; 998 blocks of data for eack point
DISPLAY_ALIEN_HEAD_LOOP:
                        PUSH BC                         ; Save alien head draw loop



SKIP_RESET_ALIEN_HEAD_FINISHB:
; Process point

                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status

                        CP 3                            ; Is Alien Head status 3?
                        JR Z,DISPLAY_FULL_ALIEN         ; If so then Alien Head is fully displayed so no need to move it


; Display coming out and going in alien head
                        LD A,175                        ;
                        SUB (IX+1)                      ; Get second byte of current point up/down coordinate
                        LD D,A                          ;
                        LD E,(IX+0)                     ; Get third byte  of current point left/right coordinate
                        JP SKIP_DISPLAY_FULL_ALIEN      ;

DISPLAY_FULL_ALIEN:



; Display the full alien mode 3
                        LD HL,(ALIEN_HEAD_CIRCLE_LOCATOR); Point to current alien head circle coordinate table
                        LD A,(HL)                       ; Get left/right coordinate from circle table
                        ADD (IX+2)                      ; E; Add to left/right dot coordinate
                        SUB 108                         ; Place central to screen
                        LD E,A                          ; Update E with left/right coordinate
                        LD (ALIENHEAD_CHECK_HIT_Y+1),A  ; Set alien head coordinate for hit by player missiles
                        SUB 8                           ; Move missile 8 pixels left to line it up with screen centre
                        LD (ALIENHEAD_MISSILE_X+3),A    ; Set alienhead missile X coordinate
                        LD (ALIENHEAD_BONUS_X+1),A      ; Set alienhead bonus X coordinate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        INC HL                          ; Move to next alien head circle coordinate table

                        LD A,175                        ; Top of screen
; Get second byte of current point up/down coordinate
                        ADD (IX+3)                      ; Subtract from top of screen
                        LD D,A                          ; D=up/down pixel coordinate
                        LD A,(HL)                       ; Get up/down coordinate from circle table
                        SUB D                           ; Take from current dot up/down coordinate
                        LD D,A                          ; Update D with up/down coordinate
                        LD (ALIENHEAD_CHECK_HIT_X+1),A  ; Set alien head coordinate for hit by player missiles
                        LD (ALIENHEAD_MISSILE_Y+3),A    ; Set alienhead missile Y coordinate
                        LD (ALIENHEAD_BONUS_Y+1),A      ; Set alienhead bonus Y coordinate

SKIP_DISPLAY_FULL_ALIEN:

                        PUSH DE                         ; Save point coordinates
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Get screen address for pixel
                        LD A,D                          ; 175    ;Test that the y co-ordinate (in SUB B B) is not greater than 116.
                        ; SUB D
                        AND A                           ; A holds b7b6b5b4b3b2b1b0,
                        RRA                             ; The bite of B. And now 0b7b6b5b4b3b2b1.
                        SCF                             ;
                        RRA                             ; Now 10b7b6b5b4b3b2.
                        AND A                           ;
                        RRA                             ; Now 010b7b6b5b4b3.
                        XOR D                           ;
                        AND 248                         ; Finally 010b7b6b2b1b0, so that
                        XOR D                           ; H becomes 64 + 8*INT (B/64) +
                        OR 96                           ; Move to screen buffer
                        LD H,A                          ; B (mod 8), the high byte of the
                        LD A,E                          ; pixel address. C contains X.
                        RLCA                            ; A starts as c7c6c5c4c3c2c1c0.
                        RLCA                            ;
                        RLCA                            ; And is now c2c1c0c7c6c5c4c3.
                        XOR D                           ;
                        AND 199                         ;
                        XOR D                           ; Now c2c1b5b4b3c5c4c3.
                        RLCA                            ;
                        RLCA                            ; Finally b5b4b3c7c6c5c4c3, so
                        LD L,A                          ; that L becomes 32*INT (B(mod

                        LD A,E                          ; 64)/8) + INT(x/8), the low byte.
                        AND 7                           ; A holds x(mod 8): so the pixel

                        ; is bit (A - 7) within the byte.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Plot dot
                        LD B,A                          ; B will count A+1 loops to get a
                        INC B                           ; Zero to the correct place in A.
                        LD A,254                        ; The zero is entered.
PLOTLOOPD:
                        RRCA                            ; Then lined up with the pixel
                        DJNZ PLOTLOOPD                  ; Bit position in the byte.
                        LD B,A                          ; Then copied to B.
                        LD A,(HL)                       ; The pixel-byte is obtained in A.
                        XOR B                           ; Over 1
                        CPL                             ;

                        LD (HL),A                       ; The byte is entered. Its other bits are unchanged in every case.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        POP DE                          ; Restore point coordinates
                        LD (SET_DE_A+1),DE              ;
; Bringing out alien head?
;                       ALIEN_HEAD_ENABLED =0 for disabled, 1 for coming out, 2 for going away, 3 for displaying, 4 for explode

                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        CP 4                            ; Is alien head exploding?
                        JR Z,EXPLODE_ALIENHEAD_DOTS     ; Jump to exploding alien head

                        CP 2                            ; Is alien head going away?
                        JP Z,ALIENHEAD_GOING_HOME       ; Jump to moving alien head back

                        CP 3                            ; Is Alien head status 3?
                        JP Z,NEXT_ALIEN_HEAD            ; If so then Alien Head is fully displayed so no need to move it


                        CP 1                            ; Is alien head mode coming out?
                        JP NZ,SKIP_MOVING_ALIEN_HEAD_POINTS_INTO_DISPLAY_POSITION ; If not then skip moving dots into display position
                        JP ALIENHEAD_COMING_OUT         ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Make alien head dots explode
EXPLODE_ALIENHEAD_DOTS:
; Move alien head point left?
                        CALL RND                        ; Get random number into A
                        CP 50                           ; Reference 50
                        JR NC,SKIP_MOVING_POINT_LEFT2   ; If final coordinate is not less than current X coordinate then skip moving point left
                        DEC (IX+0)                      ; Move point left
                        DEC (IX+0)                      ; Move point left
                        CALL RND                        ; Get random number into A
                        CP 100                          ;
                        JR NC,SKIP_MOVING_POINT_RIGHT2  ;
                        DEC (IX+0)                      ; Move point left
                        DEC (IX+0)                      ; Move point left
                        JP SKIP_MOVING_POINT_RIGHT2     ;

SKIP_MOVING_POINT_LEFT2:
; Move alien head point right?
                        CALL RND                        ; Get random number into A
                        CP 50                           ; Reference 50
                        JR NC,SKIP_MOVING_POINT_RIGHT2  ; If final coordinate is not less than current X coordinate then skip moving point right
                        INC (IX+0)                      ; Move point right
                        INC (IX+0)                      ; Move point right
                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,SKIP_MOVING_POINT_RIGHT2  ;
                        INC (IX+0)                      ; Move point left
                        INC (IX+0)                      ; Move point left



SKIP_MOVING_POINT_RIGHT2:
; Move alien head point up?
                        CALL RND                        ; Get random number into A
                        CP 30                           ; Reference 100
                        JR NC,SKIP_MOVING_POINT_UP2     ; If final coordinate is not less than current Y coordinate then skip moving point up
                        INC (IX+1)                      ; Move point up
                        INC (IX+1)                      ; Move point up
                        CALL RND                        ;
                        CP 20                           ;
                        JP NC,NEXT_ALIEN_HEAD           ;
                        INC (IX+1)                      ; Move point down
                        INC (IX+1)                      ; Move point down
                        JP NEXT_ALIEN_HEAD              ;
SKIP_MOVING_POINT_UP2:
; Move alien head point down?
                        CALL RND                        ; Get random number into A
                        CP 20                           ; Reference 100
                        JP C,NEXT_ALIEN_HEAD            ; If final coordinate is not less than current Y coordinate then skip moving point down
                        DEC (IX+1)                      ; Move point down
                        DEC (IX+1)                      ; Move point down
                        CALL RND                        ;
                        CP 50                           ;
                        JP NC,NEXT_ALIEN_HEAD           ;
                        DEC (IX+1)                      ; Move point down
                        DEC (IX+1)                      ; Move point down
                        JP NEXT_ALIEN_HEAD              ; Jump to get next alien head dot


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ALIENHEAD_COMING_OUT:

                        LD A,(SHOW_ALIEN_IMAGE)         ;
                        OR A                            ;
                        JR NZ,SKIP_DISPLAYING_ALIEN_PICTURE1;

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0

                        LD A,1                          ;
                        LD (BUFFER_RETURN),A            ;

                        LD HL,ALIEN_IMAGE1_0            ; Point to alien piture data
                        LD DE,SCREEN1                   ; Point to Screen buffer
                        LD BC,6143+768                  ; Amount of data to copy to buffer
                        LDIR                            ; Copy data

                        LD B,30                         ;
SHOW_ALIEN_IMAGE_LOOP1:
                        PUSH BC                         ;

                        LD HL,ALIEN_IMAGE1_0+6143       ; Point to alien piture data
                        LD DE,ATTR1                     ; Point to Screen buffer
                        LD BC,768                       ; Amount of data to copy to buffer
                        LDIR                            ; Copy data

                        HALT                            ;
                        CALL SHOW_BUFFER                ;

                        LD HL,ATTR1                     ; Point to Screen buffer
                        LD DE,ATTR1+1                   ; Point to Screen buffer
                        LD BC,768                       ; Amount of data to copy to buffer
                        LD (HL),0                       ;
                        LDIR                            ;

                        HALT                            ;
                        CALL SHOW_BUFFER                ;

                        POP BC                          ;
                        DJNZ SHOW_ALIEN_IMAGE_LOOP1     ;




                        XOR A                           ;
                        LD (BUFFER_RETURN),A            ;
                        LD A,1                          ;
                        LD (SHOW_ALIEN_IMAGE),A         ;

                        LD HL,SCREEN1                   ; Point to alien piture data
                        LD DE,SCREEN1+1                 ; Point to Screen buffer
                        LD BC,6143+768                  ; Amount of data to copy to buffer
                        LDIR                            ; Copy data

                        CALL MEMORY_SWITCH_1            ; Switch to memory 1

SKIP_DISPLAYING_ALIEN_PICTURE1:
; Move alien head point left?

SET_DE_A:               LD DE,00                        ; Set above
                        LD A,E                          ; Get point coordinate
                        LD B,(IX+2)                     ; Get point final left/right coordinate
                        CP B                            ; Compare left/right coordinates
                        JR C,SKIP_MOVING_POINT_LEFT     ; If final coordinate is not less than current X coordinate then skip moving point left
                        DEC (IX+0)                      ; Move point left
                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,SKIP_MOVING_POINT_RIGHT   ;
                        DEC (IX+0)                      ; Move point left
                        JP SKIP_MOVING_POINT_RIGHT      ;

SKIP_MOVING_POINT_LEFT:
; Move alien head point right?
                        ;   A=E                          ; Get point coordinate
                        ;   LD B,(IX+2)                     ; Get point final left/right coordinate
                        ; CP B                            ; Compare left/right coordinates
                        ; JR NC,SKIP_MOVING_POINT_RIGHT   ; If final coordinate is not less than current X coordinate then skip moving point right
                        INC (IX+0)                      ; Move point right
                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,SKIP_MOVING_POINT_RIGHT   ;
                        INC (IX+0)                      ; Move point left

SKIP_MOVING_POINT_RIGHT:
; Move alien head point up?
                        LD A,D                          ; Get point coordinate
                        ADD A,80                        ;
                        NEG                             ;
                        LD B,(IX+3)                     ; Get point final up/down coordinate
                        CP B                            ; Compare up/down coordinates
                        JR NC,SKIP_MOVING_POINT_UP      ; If final coordinate is not less than current Y coordinate then skip moving point up
                        INC (IX+1)                      ; Move point down
                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,NEXT_ALIEN_HEAD           ;
                        INC (IX+1)                      ; Move point down
                        JP NEXT_ALIEN_HEAD              ;
SKIP_MOVING_POINT_UP:
; Move alien head point down?
                        ; A=D
                        ;  LD B,(IX+3)                     ; Get point final up/down coordinate
                        ; CP B                            ; Compare up/down coordinates
                        ;  JR C,NEXT_ALIEN_HEAD     ; If final coordinate is not less than current Y coordinate then skip moving point down
                        DEC (IX+1)                      ; Move point up
                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,NEXT_ALIEN_HEAD           ;
                        DEC (IX+1)                      ; Move point up
                        JP NEXT_ALIEN_HEAD              ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ALIENHEAD_GOING_HOME:
; Alien head going home        Portal    120,32
; Move alien head point left?

                        LD A,E                          ; Get point coordinate
                        ;  LD B,128                        ; Get point final left/right coordinate
                        CP 128                          ; B                            ; Compare left/right coordinates
                        JR C,SKIP_MOVING_POINT_LEFTB    ; If final coordinate is not less than current X coordinate then skip moving point left
                        DEC (IX+0)                      ; Move point left
                        CALL RND                        ;
                        CP 200                          ;
                        JR NC,SKIP_MOVING_POINT_RIGHTB  ;
                        DEC (IX+0)                      ; Move point left
                        JP SKIP_MOVING_POINT_RIGHTB     ;

SKIP_MOVING_POINT_LEFTB:
; Move alien head point right?
                        ; LD A,E                          ; Get point coordinate
                        ; LD B,128                        ; Get point final left/right coordinate
                        ; CP 128                          ; B                            ; Compare left/right coordinates
                        ;  JR NC,SKIP_MOVING_POINT_RIGHTB  ; If final coordinate is not less than current X coordinate then skip moving point right
                        INC (IX+0)                      ; Move point right
                        CALL RND                        ;
                        CP 200                          ;
                        JP NC,SKIP_MOVING_POINT_RIGHTB  ;
                        INC (IX+0)                      ; Move point right

SKIP_MOVING_POINT_RIGHTB:
; Move alien head point up?
                        LD A,D                          ; Get point coordinate

                        ;  LD B,35                         ; Get point final up/down coordinate
                        CP 35                           ; B                            ; Compare up/down coordinates
                        JR C,SKIP_MOVING_POINT_UPB      ; If final coordinate is not less than current Y coordinate then skip moving point up
                        INC (IX+1)                      ; Move point up
                        CALL RND                        ;
                        CP 200                          ;
                        JR NC,SKIP_MOVING_POINT_DOWNB   ;
                        INC (IX+1)                      ; Move point up
                        JP SKIP_MOVING_POINT_DOWNB      ;

SKIP_MOVING_POINT_UPB:
; Move alien head point down?
                        ;  LD A,D                          ; Get point coordinate

                        ;  LD B,35                         ; Get point final up/down coordinate
                        ;  CP 35                           ; B                            ; Compare up/down coordinates
                        ;  JR NC,SKIP_MOVING_POINT_DOWNB   ; If final coordinate is not less than current Y coordinate then skip moving point down
                        DEC (IX+1)                      ; Move point down
                        CALL RND                        ;
                        CP 200                          ;
                        JR NC,SKIP_MOVING_POINT_DOWNB   ;
                        DEC (IX+1)                      ; Move point down


SKIP_MOVING_POINT_DOWNB:



SKIP_MOVING_ALIEN_HEAD_POINTS_INTO_DISPLAY_POSITION:;

NEXT_ALIEN_HEAD:

                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        CP 1                            ; If disabled then skip alien head
                        JR Z,ADD_ANOTHER_ROW            ; Skip alien head if so

                        CP 2                            ;
                        JR NZ,SKIP_ADDING_A_ROW         ; Skip alien head if so



ROW_JUMP:               JP SKIP_ADDING_A_ROW            ;

ADD_ANOTHER_ROW:

                        LD DE,4                         ;
                        ADD IX,DE                       ;


SKIP_ADDING_A_ROW:


                        LD DE,4                         ;
                        ADD IX,DE                       ;

                        POP BC                          ;
                        DEC BC                          ;
                        LD A,B                          ;
                        OR C                            ;
                        JP NZ,DISPLAY_ALIEN_HEAD_LOOP   ; Jump back until all points are done


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; If full Alien head is displaying, we need to countdown the time it is on the screen
                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        CP 3                            ; Fully displayed
                        JR NZ,SKIP_SETTING_ALIEN_HEAD_HOME ; Skip counting up movement counter if not full display

                        LD HL,ALIEN_HEAD_MOVEMENT_COUNTER; Get alien head movement counter
                        INC (HL)                        ; Add 1 to alien head counter
                        LD A,(HL)                       ; Get alien head counter
                        CP 250                          ; Has alien head been on the screen for 30 seconds?
                        JR NZ,SKIP_SETTING_ALIEN_HEAD_HOME ; Skip setting alien head to go home if not
                        LD (HL),0                       ; Reset alien head movement counter
                        LD A,2                          ; A=2 to put Alien head away
                        LD (ALIEN_HEAD_ENABLED),A       ; Set alien head enabled status to go away
                        JP ALIEN_HEAD_NOT_ENABLED       ; Jump to skip the alien head missile code

SKIP_SETTING_ALIEN_HEAD_HOME:
; Alien head fire

;HEAD_FIRE_MISSILE_COUNT:

                        ; DEFB 0,0,0 ;Fire missile 1. Enabled 0,1, Up/Down, Left/right
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Check to see if alien head is fully displaying before utilising alien head missiles
                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        CP 3                            ; Is Alien Head status 3 for full display?
                        JP NZ,ALIEN_HEAD_NOT_ENABLED    ; If not then skip alien head missiles

;Alien head is fully displaying so utilise missiles
                        LD IY,HEAD_FIRE_MISSILE_COUNT   ;
                        LD B,10                         ; 10 missiles to fire

ALIEN_HEAD_MISSILE_LOOP:

                        LD A,(IY+0)                     ; Get current alien head drop bombs status 1 to 10
                        OR A                            ; (CP 0) Alien head dropping bombs?
                        JR Z,SKIP_HEAD_ALIEN_DROPPING_BOMBS_A ; If not then skip alien head dropping bombs

DISPLAY_ALIEN_HEAD_FIRE_LOOP:
; Display current alien head rocket
                        LD HL,ALIEN_MISSILE_GRAPHIC     ; Point to alien rocket graphic data
                        LD A,(IY+2)                     ; Get alien head rocket collumn
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(IY+1)                     ; Get alien head rocket line
                        LD (dispx+1),A                  ; Set sprite line

                        LD A,6                          ; A=2 for YELLOW
                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        PUSH BC                         ;
                        CALL sprite                     ; Display sprite
                        POP BC                          ;
                        LD A,8                          ; 8 hires lines to move up screen at a time

;Move current alien head rocket down 8 pixels
                        ADD A,(IY+1)                    ; Get current rocket line
; Move current alien head rocket down screen 8 pixels
                        LD (IY+1),A                     ; Update current rocket line

; Is current alien head rocket at bottom of screen?
                        CP 176                          ; At bottom
                        JR C,SKIP_HEAD_ALIEN_DROPPING_BOMBS_A ; If not then skip reseting missile
                        LD (IY+0),0                     ; Reset current missile

; Jumps here if no alien head bombs are dropping
SKIP_HEAD_ALIEN_DROPPING_BOMBS_A:
                        LD DE,3                         ; Setup DE for addition to move to next alien head data block
                        ADD IY,DE                       ; Move to next alien head data block
                        DJNZ ALIEN_HEAD_MISSILE_LOOP    ; Loop back until a alien head rocket is set to on
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Check Alien head status and set a missile on
                        LD IY,HEAD_FIRE_MISSILE_COUNT   ;
                        LD B,10                         ; 10 missiles to fire

ALIEN_HEAD_MISSILE_LOOP_B:

                        LD A,(IY+0)                     ; Get current alien head drop bombs status 1 to 10
                        OR A                            ; (CP 0) Alien head dropping bombs?
                        JR NZ,SKIP_SETTING_ALIEN_HEAD_FIRE_ON2 ; If so then skip setting alien head dropping bombs to on

;We need to set current alien head missile to on?

                        CALL RND                        ; Get random number
                        CP 100                          ; Test for 2
                        JR C,SKIP_SETTING_ALIEN_HEAD_FIRE_ON2 ; Jump alienhead shooting missiles if greater than 2
                        LD A,(ALIEN_HEAD_MOVEMENT_COUNTER);  Get Alien head movement counter
                        BIT 1,A                         ; Is Bit 1 of movement counter a 1?
                        JR Z,SKIP_SETTING_ALIEN_HEAD_FIRE_ON2; If so then skip alien head missile
                        CP 40                           ; Set test at 40

                        JR C,SKIP_SETTING_ALIEN_HEAD_FIRE_ON2; If alienhead counter is less than 40 then no missiles
;Set current alien head missile to on
                        LD (IY+0),1                     ; Set current alien head missile on
ALIENHEAD_MISSILE_X:    LD (IY+2),0                     ; Set missile coordinate
ALIENHEAD_MISSILE_Y:    LD (IY+1),0                     ; Set missile coordinate
                        JP ALIEN_HEAD_MISSILE_SET       ; Jump to make sure no more alien head missiles are enabled this time round

SKIP_SETTING_ALIEN_HEAD_FIRE_ON2:
                        LD DE,3                         ; Setup DE for addition to move to next alien head data block
                        ADD IY,DE                       ; Move to next alien head data block
                        DJNZ ALIEN_HEAD_MISSILE_LOOP_B  ; Loop back until a alien head rocket is set to on
ALIEN_HEAD_MISSILE_SET:
; Jumps here once a single missile is enabled

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;SKIP_SETTING_ALIEN_HEAD_FIRE_ON:
; Check to see if alien head rocket has hit player
                        ; jp ALIEN_HEAD_NOT_ENABLED       ;
;HEAD_FIRE_MISSILE_COUNT:

                        ; DEFB 0,0,0 ;Fire missile 1. Enabled 0,1, Up/Down, Left/right
                        LD A,(SHIELD_BONUS_COUNTDOWN)   ; Get bonus counter
                        OR A                            ; CP 0                            ; Is bonus off?
                        JR NZ,ALIEN_HEAD_NOT_ENABLED    ; Bonus is on so alien bombs or alien cannot kill player

                        LD IY,HEAD_FIRE_MISSILE_COUNT   ; Point to alien head missile data
                        LD B,10                         ; 10 missiles to test
ALIEN_HEAD_MISSILE_LOOP_C:
                        LD A,(IY+0)                     ; Get current alien head rocket status
                        OR A                            ; (CP 0) Is it disabled?
                        JR Z,ALIEN_HEAD_ROCKET_NOT_HIT_PLAYER; Skip checking current alien ROCKET hitting player if so

                        LD A,(SP1X_SHIP)                ; Get ship LEFT/RIGHT coordinate
                        SUB (IY+2)                      ; subtract alien head missile line

                        JP P,CHCA1B                     ; No, skip negation
                        NEG                             ; Make it positive
CHCA1B:
                        CP 12                           ; within x range?
                        JR NC,ALIEN_HEAD_ROCKET_NOT_HIT_PLAYER ; no - they've missed
CHCA2B:
                        LD A,(IY+1)                     ;

                        CP 160                          ; within y range?
                        JR C,ALIEN_HEAD_ROCKET_NOT_HIT_PLAYER ; carry flag set if there's a collision
                        ; XOR A                           ; A=0
                        LD (IY+0),0                     ; A                     ; Disable alien head missile
; Loose a life

                        LD A,1                          ; Set A to 1 to set player hit
                        LD (PLAYER_HIT),A               ; Set player hit to on
                        JP ALIEN_HEAD_NOT_ENABLED       ;
                        ; JP TAKE_1_FROM_LIVES            ; Take 1 from lives         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ALIEN_HEAD_ROCKET_NOT_HIT_PLAYER:

                        LD DE,3                         ; Setup DE for addition to move to next alien head data block
                        ADD IY,DE                       ; Move to next alien head data block

                        DJNZ ALIEN_HEAD_MISSILE_LOOP_C  ; Loop back until a alien head rocket is set to on
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

ALIEN_HEAD_NOT_ENABLED:




SKIP_DISPLAY_ALIEN_HEAD:
; Alien head is not displaying

                        ;   LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        ;   CP 0                            ;
                        ;   JP NZ,SKIP_SETTING_PLAYER_WITH_SHIELD;SKIP_RESETING_ALIEN_GRAPHIC;

                        ; LD (ALIEN_OFFSET_ADJUST),A        ; Move all alliens to offset
                        ; LD (ALIEN_OFFSET_ADJUST_COUNTER),A; When 255, adjust alien offset
                        ; LD (ALIEN_OFFSET_LEFT_RIGHT),A   ; Alien offset 0=OFF, 1=left, 2=right



; Do we need to setup shield around player?
                        LD HL,PLAYER_SHIP_GRAPHIC       ; Point to basic player ship graphic
                        LD (SET_PLAYER_GRAPHIC+1),HL    ; Set basic player ship graphic
                        LD HL,SHIELD_BONUS_COUNTDOWN    ; Get player shield countdown
                        LD A,(HL)                       ; Get player shield countdown into A for testing
                        OR A                            ; (CP 0)Is shield countdown above 0?
                        JR Z,SKIP_SETTING_PLAYER_WITH_SHIELD ; Jump decreasing shield countdown and displaying shield if 0 as no shield is needed
                        DEC (HL)                        ; Take 1 from player shield countdown

SKIP_PLAYER_SHIELD_COUNTDOWN:
                        LD A,(HL)                       ; Get player shield countdown into A for testing
                        ;  LD A,(SHIELD_CHANGER_COUNTER)   ; Get shield change counter
                        AND %00000001                   ; Flip flop shield changer between 1 and 0
                        ;  LD (SHIELD_CHANGER_COUNTER),A   ; Update shield change counter
                        CP 1                            ; Is shield counter at 1?
                        JR NZ,SKIP_SETTING_PLAYER_WITH_SHIELD; If not then skip placing shield around player

; Place shield around player
                        LD HL,PLAYER_SHIP_SHIELD_GRAPHIC; Point at player with shield graphic
                        LD (SET_PLAYER_GRAPHIC+1),HL    ; Set player ship graphic with shield

SKIP_SETTING_PLAYER_WITH_SHIELD:

                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        OR A                            ; CP 0                            ;
                        JP NZ,SKIP_ALIEN_OFFSET_RIGHT   ; SKIP_RESETING_ALIEN_GRAPHIC;


                        LD HL,ALIEN_OFFSET_ADJUST_COUNTER ; Point to alien offset counter
                        INC (HL)                        ; Add 1 to offset
                        LD A,(HL)                       ; Get alien offset counter
                        CP 20                           ; Is it 20 or greater than?
                        JR C,SKIP_CHANGING_ALIEN_OFFSET_TO_RIGHT ; If not then skip reseting alien offset counter
                        LD (HL),0                       ; Reset alien offset counter

; Do we need to move alien offset left or right?
                        LD A,(ALIEN_OFFSET_LEFT_RIGHT)  ; Get alien offset direction
                        CP 2                            ; Is alien offset left?
                        JR Z,SKIP_CHANGING_ALIEN_OFFSET_TO_LEFT;
                        LD A,2                          ; Set offset to right
                        LD (ALIEN_OFFSET_LEFT_RIGHT),A  ;
                        JP SKIP_CHANGING_ALIEN_OFFSET_TO_RIGHT;

SKIP_CHANGING_ALIEN_OFFSET_TO_LEFT:
                        CP 1                            ; Is alien offset right?
                        JR Z,SKIP_CHANGING_ALIEN_OFFSET_TO_RIGHT;
                        LD A,1                          ; Set offset to right
                        LD (ALIEN_OFFSET_LEFT_RIGHT),A  ;

SKIP_CHANGING_ALIEN_OFFSET_TO_RIGHT:
                        LD HL,ALIEN_OFFSET_ADJUST       ; Get alien offset adjust
                        LD A,(ALIEN_OFFSET_LEFT_RIGHT)  ; Get alien offset direction
                        CP 1                            ; Is it 1 for left?
                        JR NZ,SKIP_ALIEN_OFFSET_LEFT    ; If not then skip moving offset left
                        LD A,(HL)                       ; Get alien offset adjust setting
                        CP 1                            ; OR A;CP 0                            ; Is it 0
                        JR C,SKIP_ALIEN_OFFSET_LEFT     ; If above 0 then skip alien offset left
                        DEC (HL)                        ; Move alien offset left
                        JP SKIP_ALIEN_OFFSET_RIGHT      ;
SKIP_ALIEN_OFFSET_LEFT:
                        LD A,(ALIEN_OFFSET_LEFT_RIGHT)  ; Get alien offset direction
                        CP 2                            ; Is it 2 for right?
                        JR NZ,SKIP_ALIEN_OFFSET_RIGHT   ; If so then skip moving alien offset right
                        LD A,(HL)                       ; Get alien offset adjust setting
                        CP 10                           ; Is it 0
                        JR NC,SKIP_ALIEN_OFFSET_RIGHT   ;
                        INC (HL)                        ; Move alien offset right

SKIP_ALIEN_OFFSET_RIGHT:


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        LD HL,SP1Y_SHIP                 ; Get player line store address
                        LD A,(HL)                       ; Get player line into A
                        CP 153                          ; Compare with player line 152 for line 19 check
                        JR C,SKIP_INITIAL_MOVING_SHIP_UP; The ship is in the correct place ready to go

                        DEC (HL)                        ; Move ship up 1 pixel
                        JP SKIP_PLAYER_MOVEMENT         ; We dont want the player to be able to be moved until our ship appears fully.

SKIP_INITIAL_MOVING_SHIP_UP:
                        ; CALL READ_GAME_KEYS             ; Read game keys or joystick

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;************************READ KEYBOARD and JOYSTICKS**********************************
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
READ_GAME_KEYS:

                        LD A,(CONTROL)                  ; Collect the keyboard/joystick indicator
                        CP 1                            ; Is the Kempston joystick selected =1?
                        JP Z,CHECK_KEMPSTON             ; Jump if so

                        CP 2                            ; Is the Fuller joystick selected =2?
                        JP Z,CHECK_FULLER               ; Jump if so

                        LD E,255                        ; Initialise #REGe to 255 (all bits set); it will be used
                        ; to hold keyboard and joystick readings

                        LD BC,57342                     ; {Read keys P-O-I-U-Y (right, left, right, left, right)
                        IN A,(C)                        ; into bits 0-4 of #REGa}
                        AND 31                          ; {Set bit 5 and reset bits 6 and 7
                        OR 32                           ; }

                        LD E,A                          ; Save the result in #REGe

                        LD BC,64510                     ; {Read keys Q-W-E-R-T (left, right, left, right, left)
                        IN A,(C)                        ; into bits 0-4 of #REGa}
                        AND 31                          ; {Keep only bits 0-4, shift them into bits 1-5, and set
                        RLC A                           ; bit 0
                        OR 1                            ; }
                        AND E                           ; {Merge this keyboard reading into bits 1-5 of #REGe
                        LD E,A                          ; }

                        LD B,231                        ; {Read keys 1-2-3-4-5 ('5' is left) and 0-9-8-7-6 (jump,
                        IN A,(C)                        ; nothing, right, right, left) into bits 0-4 of #REGa}
                        RRCA                            ; {Rotate the result right and set bits 0-2 and 4-7; this
                        OR 247                          ; ignores every key except '5' and '6' (left)}
                        AND E                           ; {Merge this reading of the '5' and '6' keys into bit 3
                        LD E,A                          ; of #REGe}

                        LD B,239                        ; {Read keys 0-9-8-7-6 (jump, nothing, right, right, left)
                        IN A,(C)                        ; into bits 0-4 of #REGa}
                        OR 251                          ; Set bits 0, 1 and 3-7; this ignores every key except '8'
                        ; (right)
                        AND E                           ; {Merge this reading of the '8' key into bit 2 of #REGe
                        LD E,A                          ; }
                        IN A,(C)                        ; Read keys 0-9-8-7-6 (jump, nothing, right, right, left)
                        ; into bits 0-4 of #REGa
                        RRCA                            ; {Rotate the result right and set bits 0, 1 and 3-7; this
                        OR 251                          ; ignores every key except '7' (right)}
                        AND E                           ; {Merge this reading of the '7' key into bit 2 of #REGe
                        LD E,A                          ; }



MN36674:                ; LD C,0                        ; Initialise #REGc to 0 (no movement)
                        LD A,E                          ; Copy the movement bits into #REGa
                        AND 42                          ; Keep only bits 1, 3 and 5 (the 'left' bits)
                        CP 42                           ; Are any of these bits reset?
                        JR Z,MN36689                    ; Jump if not

                        LD HL,PLAYER_DIRECTION_LEFT_RIGHT;
                        LD (HL),50                      ; Left


                        JP MN36717                      ;


MN36689:                LD A,E                          ; Copy the movement bits into #REGa
                        AND 21                          ; Keep only bits 0, 2 and 4 (the 'right' bits)
                        CP 21                           ; Are any of these bits reset?
                        JR Z,MN36717                    ; Jump if not

                        LD HL,PLAYER_DIRECTION_LEFT_RIGHT;
                        LD (HL),60                      ; Right

                        JP SKIP_CHECK_JOYSTICK          ;

; A fire button is being pressed.
MN36717:
;Get key Default=191 Shift=L 190 10111110 Z=R 189 10111101 X=L 187 10111011 C=R 183 10110111 V=L 175 10101111
                        LD BC,65278                     ; Reads the half row CAPS SHIFT to V
                        IN A,(C)                        ; Get key Default=191 Shift=190 Z=189 X=187 C=183 V=175
                        AND 21                          ;
                        CP 21                           ;

                        CALL NZ,KEY46794                ; Set "Left" movement to on

                        LD BC,65278                     ; Reads the half row CAPS SHIFT to V
                        IN A,(C)                        ; Get key Default=191 Shift=190 Z=189 X=187 C=183 V=175
                        AND 10                          ;
                        CP 10                           ;
                        CALL NZ,KEY46802                ; Set "Right" movement to on
;Get key Default=191 B=175 N=183 M=187 SYMBSHIFT=189 SPACE=190
                        LD BC,32766                     ; Reads the half row SPACE to B
                        IN A,(C)                        ; Get key Default=191 B=175 N=183 M=187 SYMBSHIFT=189 SPACE=190
                        AND 21                          ;
                        CP 21                           ;

                        CALL NZ,KEY46794                ; Set "Left" movement to on
                        LD BC,32766                     ; Reads the half row SPACE to B
                        IN A,(C)                        ; Get key Default=191 B=175 N=183 M=187 SYMBSHIFT=189 SPACE=190
                        AND 10                          ;
                        CP 10                           ;
                        CALL NZ,KEY46802                ; Set "Right" movement to on



                        JP SKIP_CHECK_JOYSTICK          ;
CHECK_KEMPSTON:
; Check if Kempston is moved left or right
                        LD BC,31                        ; Collect input from the joystick
                        IN A,(C)                        ;
                        BIT 0,A                         ; Is right button being pressed?
                        CALL NZ,KEY46802                ; Set "Right" movement to on
                        BIT 1,A                         ; Is left button being pressed?
                        CALL NZ,KEY46794                ; Set "Left" movement to on
                        JP SKIP_CHECK_JOYSTICK          ; Jump to test for fire control


CHECK_FULLER:
; Check if Fuller is moved left or right
                        LD BC,127                       ; Collect input from the joystick
                        IN A,(C)                        ;
                        BIT 3,A                         ; Is right button being pressed?
                        CALL Z,KEY46802                 ; Set "Right" movement to on
                        BIT 2,A                         ; Is left button being pressed?
                        CALL Z,KEY46794                 ; Set "Left" movement to on

SKIP_CHECK_JOYSTICK:
; If player_hit enabled then skip checking player fire

                        LD A,(PLAYER_HIT)               ; Get player hit into A
                        CP 0                            ; Has player been hit?
                        JR NZ,SKIP_KEYS                 ; Skip checking player fire if so



;Fire keys being pressed?
                        LD BC,49150                     ; Reads the half row ENTER to H
                        IN A,(C)                        ; Get key Default=191 H=175 J=183 K=187 L=189 ENTER=190
                        AND 31                          ; Keep only bits 0 to 4
                        CP 31                           ; Are any of these bits reset?
                        JP NZ,MM36751                   ; Jump if so

                        LD BC,65022                     ;
                        IN A,(C)                        ; Get key Default=191 H=175 J=183 K=187 L=189 ENTER=190
                        AND 31                          ; Keep only bits 0 to 4
                        CP 31                           ; Are any of these bits reset?
                        JP NZ,MM36751                   ; Jump if so

                        LD BC,61438                     ;
                        IN A,(C)                        ; }
                        BIT 0,A                         ; Is '0' being pressed?
                        JR Z,MM36751                    ; Jump if so



                        LD A,(CONTROL)                  ; Collect the Kempston joystick indicator
                        OR A                            ; Is keyboard selected?
                        JR Z,SKIP_KEYS                  ; Jump out of control reading

                        CP 1                            ; Is the Kempston joystick selected?
                        JR NZ,SKIP_KEMPSTON_FIRE        ; Jump out of control reading

                        LD BC,31                        ; Collect input from the joystick
                        IN A,(C)                        ;
                        BIT 4,A                         ; Is the fire button being pressed?
                        JR Z,MM36751                    ; Jump if so
                        JP SKIP_KEYS                    ; Jump out of control reading

SKIP_KEMPSTON_FIRE:

                        CP 2                            ; Is the Fuller joystick selected?
                        JR NZ,SKIP_FULLER_FIRE          ; Jump out of control reading

                        LD BC,127                       ; Collect input from the joystick
                        IN A,(C)                        ;
                        BIT 7,A                         ; Is the fire button being pressed?
                        JR Z,MM36751                    ; Jump if so

SKIP_FULLER_FIRE:

                        JP SKIP_KEYS                    ; Jump out of control reading

MM36751:
; Fire pressed
                        LD A,1                          ; Set A to 1 to set fire on
                        LD (FIRE),A                     ; Set fire on


                        JP SKIP_KEYS                    ; Jump out of control reading



                        ; Set "Left" movement to on
KEY46794:
                        LD HL,PLAYER_DIRECTION_LEFT_RIGHT ;
                        LD (HL),50                      ;

                        JP SKIP_KEYS                    ; Jump out of control reading

; Set "Right" movement to on
KEY46802:               LD HL,PLAYER_DIRECTION_LEFT_RIGHT ;
                        LD (HL),60                      ;


SKIP_KEYS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        LD A,(SP1X_SHIP)                ; Get player collumn
                        LD E,A                          ; DE=player coordinates

                        LD A,(FIRE)                     ; Get fire joystick/key
                        CP 1                            ; Fire pressed =1?
                        JR NZ,SKIP_FIRE_PRESSED         ; Skip initialising fire if not
                        ; LD A,1                         ; A=1 to set fire on  (A already set if key pressed, not needed)
                        LD (FIRE_ON),A                  ; Set fire on
                        XOR A                           ; A=0 to reset fire
                        LD (FIRE),A                     ; Fire off
SKIP_FIRE_PRESSED:
                        LD A,(PLAYER_DIRECTION_LEFT_RIGHT) ; Get joystick/key
                        OR A                            ; CP 0                            ; Nothing pressed or selected?
                        JR Z,SKIP_PLAYER_MOVEMENT       ; If nothing selected then jump movement checks


                        LD A,(PLAYER_DIRECTION_LEFT_RIGHT) ; Get player movement direction
                        CP 50                           ; Moving left
                        JR NZ,SKIP_MOVE_PLAYER_LEFT     ; If not then skip moving player left
                        LD A,E                          ; A=4 for addition
                        CP 18                           ;
                        JR C,SKIP_MOVE_PLAYER_LEFT      ;
                        SUB 8                           ; Add E to A
                        ; LD E,A                          ; Move player left
                        LD (SP1X_SHIP),A                ; Update player collumn
                        XOR A                           ; Reset movement
                        LD (PLAYER_DIRECTION_LEFT_RIGHT),A;
                        JP SKIP_MOVE_PLAYER_RIGHT       ; We are moving left so no need to check for moving right
SKIP_MOVE_PLAYER_LEFT:
                        CP 60                           ; Player moving right?
                        JR NZ,SKIP_MOVE_PLAYER_RIGHT    ; If not then skip moving player right
                        LD A,E                          ; Get player left/right
                        CP 223                          ; Reference hires collumn 223
                        JR NC,SKIP_MOVE_PLAYER_RIGHT    ; If greater than 223 then skip moving right
                        LD A,8                          ; A=4 for addition
                        ADD A,E                         ; Add E to A
                        ; LD E,A                          ; Move player right
                        LD (SP1X_SHIP),A                ; Update player collumn
                        XOR A                           ; Reset movement
                        LD (PLAYER_DIRECTION_LEFT_RIGHT),A;

SKIP_MOVE_PLAYER_RIGHT:
                        ;   LD A,E                          ; Get player coordinate into A
                        ;  LD (SP1X_SHIP),A                ; Update player collumn

SKIP_PLAYER_MOVEMENT:
                        XOR A                           ; A=0 to reset player movement
                        LD (PLAYER_DIRECTION_LEFT_RIGHT),A ; Reset player movement

; Jumps here if no movement keys are pressed
                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        OR A                            ; CP 0                            ;
                        JP NZ,SKIP_ALIENS               ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        ; jp SKIP_DISPLAYING_STARS
                        LD A,(ALIEN_BACKGROUND_COLOUR)  ; Get background colour
                        CP 80                           ; Reference first colour for black on red
                        JR NC,SKIP_DISPLAYING_STARS     ; We dont need stars on day time
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display stars
;DELAY         x up/down,  y left/right,  DOWN speed,
;  0              1             2                 3
;DRAW_SNOWFLAKES_DATA1:
                        LD HL,SNOW_FLAKE_DATA1          ; Point at star data

                        LD B,20                         ; 9 stars
SNOWLOOP2_1:
                        LD A,(HL)                       ; Get delay for current star
                        OR A                            ; OR A;CP 0                         ; 0?
                        JR Z,JUMP_DECREMENTING_DELAY    ; If delat is zero then skip decrementing it
                        DEC (HL)                        ; Take one from delay
                        JP SNOWLOOPNEXT                 ; Jump to next star
JUMP_DECREMENTING_DELAY:

                        INC HL                          ; Move to Up/down coordinate for current star
                        LD D,(HL)                       ; Load into D
                        INC HL                          ; Move pointer to left/right coordinate for current star
                        LD E,(HL)                       ; Load into E
                        INC HL                          ; Move pointer to next star
                        INC HL                          ; forward 2 bytes
;PLOT:
;PLOT Y co-ordinate to D, x to E.
                        ;  JP SNOWLOOPNEXT
                        PUSH HL                         ; Save data pointer



;;;;;;;;;;;;;;;;;
;Get screen address for pixel
;PIXEL:
                        LD A,175                        ; Test that the y co-ordinate (in SUB B B) is not greater than 175.
                        SUB D                           ;
                        JR C,SNOWLOOPNEXT2              ; Return if over 175
                        LD D,A                          ; B now contains 175 minus y.
                        AND A                           ; A holds b7b6b5b4b3b2b1b0,
                        RRA                             ; The bite of B. And now 0b7b6b5b4b3b2b1.
                        SCF                             ;
                        RRA                             ; Now 10b7b6b5b4b3b2.
                        AND A                           ;
                        RRA                             ; Now 010b7b6b5b4b3.
                        XOR D                           ;
                        AND 248                         ; Finally 010b7b6b2b1b0, so that
                        XOR D                           ; H becomes 64 + 8*INT (B/64) +
                        OR 96                           ; Move to screen buffer
                        LD H,A                          ; B (mod 8), the high byte of the
                        LD A,E                          ; pixel address. C contains X.
                        RLCA                            ; A starts as c7c6c5c4c3c2c1c0.
                        RLCA                            ;
                        RLCA                            ; And is now c2c1c0c7c6c5c4c3.
                        XOR D                           ;
                        AND 199                         ;
                        XOR D                           ; Now c2c1b5b4b3c5c4c3.
                        RLCA                            ;
                        RLCA                            ; Finally b5b4b3c7c6c5c4c3, so
                        LD L,A                          ; that L becomes 32*INT (B(mod

                        LD A,8                          ; 1 dot in the middle of 8 bits for star
                        LD (HL),A                       ; The byte is entered. Its other bits are unchanged in every case.
SNOWLOOPNEXT2:
                        POP HL                          ; Restore data pointer
                        JP SKIP_ADD_STAR_POINTER        ; Jump to not add any more bytes to pointer as we already added them

; Jumps here for next star
SNOWLOOPNEXT:
                        LD DE,4                         ; Setup DE for addition of 4 bytes
                        ADD HL,DE                       ; Move pointer forward 4 bytes for next star

SKIP_ADD_STAR_POINTER:
                        DJNZ SNOWLOOP2_1                ; Jump back for next star


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



                        ;
;DELAY         x up/down,  y left/right,  DOWN speed,
;  0              1             2                 3
;Update star data
;UPDATE_DATA_1:
                        LD HL,SNOW_FLAKE_DATA1          ; Point to star data
                        LD B,20                         ; 9 stars to update
SNOWLOOP3_2:
                        LD A,(HL)                       ; Get delay data of current star
                        OR A                            ; OR A;CP 0                         ; Is delay now 0?
                        JR NZ,MOVESNOWNEXT              ; If delay is 0, we can draw the star

                        INC HL                          ; Move to up/down data of current star

                        LD C,(HL)                       ; Get Up/down coordinate into C
                        INC HL                          ; Move pointer to current star speed
                        INC HL                          ;
                        LD D,(HL)                       ; Get Down speed
                        LD A,C                          ; Get up/down coordinate into A
                        SUB D                           ; Add speed to down movement
                        DEC HL                          ; Move pointer back to up/down data for current star
                        DEC HL                          ;

                        LD (HL),A                       ; Update up/down position

                        OR A                            ; CP 2                         ; If at the bottom then move back to top
                        JP NC,MOVESNOWNEXTB             ; If not at bottom then skip resetting to the top

; Star is at the bottom so reset to the top
                        LD (HL),175                     ; Setup top start coordinate Update up/down coordinate
                        DEC HL                          ; Move to the beginning of the star data
                        JP MOVESNOWNEXT                 ; Jump for next star
MOVESNOWNEXTB:
                        DEC HL                          ; Move to beginning of current star block
MOVESNOWNEXT:
                        LD DE,4                         ; Setup DE for addition of 4 bytes to move On to next snow flake
                        ADD HL,DE                       ; Add 4 bytes to pointer for next star

                        DJNZ SNOWLOOP3_2                ; Jump back until all stars are updated













SKIP_DISPLAYING_STARS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;  _____ _____  _____ _____  _           __     __           _      _____ ______ _   _  _____
; |  __ \_   _|/ ____|  __ \| |        /\\ \   / /     /\   | |    |_   _|  ____| \ | |/ ____|
; | |  | || | | (___ | |__) | |       /  \\ \_/ /     /  \  | |      | | | |__  |  \| | (___
; | |  | || |  \___ \|  ___/| |      / /\ \\   /     / /\ \ | |      | | |  __| | . ` |\___ \
; | |__| || |_ ____) | |    | |____ / ____ \| |     / ____ \| |____ _| |_| |____| |\  |____) |
; |_____/_____|_____/|_|    |______/_/    \_\_|    /_/    \_\______|_____|______|_| \_|_____/
;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display aliens

                        LD A,(PORTAL_OPEN_CLOSE)        ; Get portal open status
                        OR A                            ; CP 0 Is it closed?
                        JP Z,SKIP_ALIENS                ; If so tnen we dont have any aliens to deal with


; Process aliens

;ALIEN_DATA1:   30 bytes
;            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
;            DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
;            DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
;            DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
;            DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
;            DEFB 0,0                        ; Alien start coordinate (25 in)
;            DEFB 0,0                        ; Alien end coordinate

                        DI                              ; Disable interupts
                        LD IX,ALIEN_DATA1               ; Point to Alien data
                        LD HL,NUMBER_OF_ALIENS_SETTINGS ; Get number of aliens for this wave
                        LD B,(HL)                       ; Place number of aliens to process into B for loop
PROCESS_ALIENS_LOOP1:
                        LD (NEXT_ALIEN+1),BC            ; Save loop
; Check if alien is enabled or not. Add 1 to alien appear counter if not enabled
                        LD A,(IX+0)                     ; Get alien enabled status
                        CP 255                          ; Alien already enabled on 255?
                        JR Z,DISPLAY_ALIEN              ; Alien already enabled so no need to count up to 255 to enable

                        OR A                            ; Compare alien status with 0
                        JR Z,ADD_TO_ALIEN_APPEAR_COUNTER; If disabled then jump to add to alien appears counter

; If we get here, Alien is enabled or exploding
                        CP 243                          ; Is alien counting down from 254 to 243(exploding)?
                        JP NC,ALIEN_NOT_ENABLED         ; Alien is exploding if above 244 so no need to add to alien appears counter

; Alien status is not exploding

ADD_TO_ALIEN_APPEAR_COUNTER:
; Add to alien appears counter
                        INC (IX+1)                      ; Add 1 to current alien appears counter
                        LD A,(IX+1)                     ; Get current alien appears counter
                        CP 251
                        JR NZ,SKIP_EMERGE_ALIEN_A
                        LD HL,PLAYER_EXPLODE_GRAPHICS
                        LD (IX+4),0                     ; Make sure fire is off for new alien
                        JP EMERGE_ALIEN
SKIP_EMERGE_ALIEN_A:
                        CP 252
                        JR NZ,SKIP_EMERGE_ALIEN_B
                        LD HL,PLAYER_EXPLODE_GRAPHICS+32
                        LD (IX+4),0                     ; Make sure fire is off for new alien
                        JP EMERGE_ALIEN
SKIP_EMERGE_ALIEN_B:
                        CP 253
                        JR NZ,SKIP_EMERGE_ALIEN_C
                        LD HL,PLAYER_EXPLODE_GRAPHICS+64
                        LD (IX+4),0                     ; Make sure fire is off for new alien
                        JP EMERGE_ALIEN
SKIP_EMERGE_ALIEN_C:
                        CP 254
                        JR NZ,SKIP_EMERGE_ALIEN_D
                        LD HL,PLAYER_EXPLODE_GRAPHICS+96
                        LD (IX+4),0                     ; Make sure fire is off for new alien
                        JP EMERGE_ALIEN
SKIP_EMERGE_ALIEN_D:
                        CP 255                          ; Alien to be enabled?
                        JP NZ,ALIEN_NOT_ENABLED         ; Jump to skip enabling alien

                        LD (IX+0),A                     ; Set alien enabled status to enabled
                        LD (IX+4),0                     ; Make sure fire is off for new alien

                        JP ALIEN_NOT_ENABLED            ;

                        ; Y=120 ACROSS,X=32 DOWN
DISPLAY_ALIEN:
; Display current alien
                        LD HL,(ALIEN_GRAPHIC)           ;
; Jumps here to display emerging alien
EMERGE_ALIEN:
                        LD A,(ALIEN_OFFSET_ADJUST)      ;
                        SUB 5                           ;
                        ADD A,(IX+25)                   ;
                        LD (IX+25),A                    ;
                        ; LD A,(IX+25)                    ; Get alien ship X coordinate
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(IX+26)                    ; Get alien ship Y coordinate
                        LD (dispx+1),A                  ; Set sprite Y to X coordinate

                        LD A,(IX+3)                     ; Get alien dropping counter
                        CP 255                          ; Going back up screen with water?
                        JR NZ,SKIP_MAKING_ALIEN_CYAN    ; If not then skip making alien cyan
                        LD A,(ALIEN_COLLECTED_O2_COLOUR); Set alien to cyan
                        JP SKIP_MAKING_ALIEN_CYANB      ;
SKIP_MAKING_ALIEN_CYAN:
                        LD A,(ALIEN_BACKGROUND_COLOUR)  ; A=6 for yellow
SKIP_MAKING_ALIEN_CYANB:

                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        CALL sprite                     ; Display sprite



                        ;  JP ALIEN_NOT_ENABLED  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



; Move alien
                        LD A,(IX+3)                     ; Get alien dropping counter
                        CP 254                          ; Is counter at 254 or above for alien to start dropping
                        JR NC,CHECK_ALIEN_DROPPING      ; If so then we dont want to move alien into default position
                        ;  CP 255                          ; Is counter at 255 for alien at bottom
                        ; JR Z,CHECK_ALIEN_DROPPING       ; If so then we dont want to move alien into default position

                        LD A,(IX+25)                    ; Get alien start X coordinate
                        LD B,(IX+27)                    ; Get alien end X coordinate
                        LD C,4                          ; 4 pixels to move left/right
                        CP B                            ;
                        JR C,SKIP_MOVE_ALIEN_LEFT       ;

                        LD A,(IX+25)                    ;
                        SUB C                           ;
                        LD (IX+25),A                    ;

                        JP SKIP_MOVE_ALIEN_LEFT_RIGHT   ;
SKIP_MOVE_ALIEN_LEFT:

                        ;  INC A                           ;
                        ;  INC A                           ;
                        ;  INC A                           ;
                        ;  INC A                           ;
                        ADD A,C                         ;
                        CP B                            ;
                        JR NC,SKIP_MOVE_ALIEN_LEFT_RIGHT;

                        LD A,(IX+25)                    ;
                        ADD C                           ;
                        LD (IX+25),A                    ;



SKIP_MOVE_ALIEN_LEFT_RIGHT:

                        LD A,(IX+26)                    ; Get alien start X coordinate
                        LD B,(IX+28)                    ; Get alien end X coordinate

                        CP B                            ;
                        JR C,SKIP_MOVE_ALIEN_UP         ;
                        DEC (IX+26)                     ;
                        JP SKIP_MOVE_ALIEN_UP_DOWN      ;
SKIP_MOVE_ALIEN_UP:

                        ;  INC A                           ;
                        ;  INC A                           ;
                        ;  INC A                           ;
                        ;  INC A                           ;
                        ADD A,C                         ;
                        CP B                            ;

                        JR NC,SKIP_MOVE_ALIEN_UP_DOWN   ;
                        INC (IX+26)                     ;


SKIP_MOVE_ALIEN_UP_DOWN:



CHECK_ALIEN_DROPPING:
; Alien dropping enabled?
                        LD A,(IX+3)                     ; Get alien dropping counter
                        OR A                            ; Alien counter at 0?
                        JR Z,SKIP_ALIEN_DROPPING        ; If so then skip alien dropping
                        CP 254                          ; Alien dropping bomb
                        JR Z,SKIP_ADDING_TO_DROP_COUNTER; If so then skip adding to drop bomb counter
                        CP 255                          ; Alien at bottom of screen?
                        JR Z,SKIP_ADDING_TO_DROP_COUNTER; If so then skip adding to drop bomb counter



; Alien is set to drop
                        INC (IX+3)                      ; Add 1 to alien dropping counter
SKIP_ADDING_TO_DROP_COUNTER:
                        LD A,(IX+3)                     ; Get alien dropping counter
                        CP 254                          ; Is counter at 254 for alien to start dropping
                        JR NZ,SKIP_ALIEN_BOTTOM_OF_SCREEN; If not then skip alien dropping
; Move alien down screen
                        ;  INC (IX+26)                     ; Move alien down
                        ;  INC (IX+26)                     ; Move alien down
                        LD A,(IX+26)                    ; Get alien up/down
                        INC A                           ; Move alien down
                        INC A                           ; Move alien down
                        LD (IX+26),A                    ; Update alien down

                        CP 176                          ; Is alien at bottom of screen?
                        JR C,SKIP_ALIEN_BOTTOM_OF_SCREEN; If not then skip setting alien to bottom of screen
                        LD A,255                        ; A=255 to set alien to bottom of screen
                        LD (IX+3),A                     ; Set alien dropping counter to 255 for bottom of screen
                        JP SKIP_ALIEN_DROPPING          ;
SKIP_ALIEN_BOTTOM_OF_SCREEN:
; Alien going back up screen?

                        LD A,(IX+3)                     ; Get alien dropping counter
                        CP 255                          ; Is alien at bottom of screen?
                        JR NZ,SKIP_ALIEN_GOING_UP_WITH_WATER; If not then skip alien going up with water

; Return to Portal    120,32

                        LD A,(IX+25)                    ; Get alien start X coordinate
                        ; LD B,120                        ; Get portal left/right coordinate

                        CP 120                          ; B                            ;
                        JR C,SKIP_MOVE_ALIEN_LEFTB      ;
                        DEC (IX+25)                     ;
                        DEC (IX+25)                     ;
                        JP SKIP_MOVE_ALIEN_LEFT_RIGHTB  ;
SKIP_MOVE_ALIEN_LEFTB:
                        JR NC,SKIP_MOVE_ALIEN_LEFT_RIGHTB;
                        INC (IX+25)                     ;
                        INC (IX+25)                     ;

SKIP_MOVE_ALIEN_LEFT_RIGHTB:

                        LD A,(IX+26)                    ; Get alien start X coordinate
                        ; LD B,32                         ; Get portal up/down coordinate

                        CP 32                           ; B                            ;
                        JR C,SKIP_MOVE_ALIEN_UPB        ;
                        DEC (IX+26)                     ;
                        ; DEC (IX+26)                     ;

SKIP_MOVE_ALIEN_UPB:
; Check if alien is back in portal
                        LD A,(IX+26)                    ; Get alien up/down coordinate
                        CP 32                           ; Alien back in portal?
                        JR NC,SKIP_DISABLE_ALIEN_AFTER_WATER ; If not then skip alien disable after water

                        LD A,(IX+25)                    ; Get alien up/down coordinate
                        CP 120                          ; Alien back in portal?
                        JR NC,SKIP_DISABLE_ALIEN_AFTER_WATER ; If not then skip alien disable after water

                        ; LD A,(IX+25)                    ; Get alien up/down coordinate
                        CP 128                          ; Alien back in portal?
                        JR NC,SKIP_DISABLE_ALIEN_AFTER_WATER ; If not then skip alien disable after water

; Alien is back in portal after collecting resources.

                        LD (IX+0),0                     ; Set alien to disabled
                        LD (IX+3),0                     ; Set alien dropping counter disabled

                        LD A,(ALIEN_HIT_COUNTER)        ; Get alien hit counter
                        OR A                            ; Is it 0?
                        JR Z,SKIP_ALIEN_APPEARS_QUICKLY ; Skip setting alien appears again quickly if so. We dont want any more aliens
                        LD (IX+1),200                   ; Set alien appears counter to 200 so it comes out again quickly
SKIP_ALIEN_APPEARS_QUICKLY:

; Take 1 from H2O and update H2O meter
                        LD HL,H2O                       ; Get H2O meter
                        DEC (HL)                        ; Take 1 from h2o meter
                        CALL UPDATE_METERS              ; Update meters

SKIP_DISABLE_ALIEN_AFTER_WATER:




SKIP_ALIEN_GOING_UP_WITH_WATER:


SKIP_ALIEN_DROPPING:
; Setup random alien dropping
                        LD A,(IX+3)                     ; Get alien dropping counter
                        OR A                            ; CP 0                            ; Alien counter at 0?
                        JR NZ,SKIP_RANDOM_ALIEN_DROPPING ; If so then skip alien dropping
                        CALL RND                        ;
                        CP 5                            ; RND >=5?
                        JR NC,SKIP_RANDOM_ALIEN_DROPPING; If not then skip setting alien for dropping
                        LD (IX+3),A                     ; Set alien to drop

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SKIP_RANDOM_ALIEN_DROPPING:
; Alien fire?
;ALIEN_DATA1:   30 bytes
;            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
;            DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
;            DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
;            DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
;            DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
;            DEFB 0,0                        ; Alien missile coordinates
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien explode dots coordinates (9 dots)
;            DEFB 0,0                        ; Alien start coordinate (25 in)
;            DEFB 0,0                        ; Alien end coordinate


                        LD A,(IX+4)                     ; Get alien drop bombs status
                        OR A                            ; CP 0 Alien dropping bombs?
                        JR Z,SKIP_ALIEN_DROPPING_BOMBS  ; If not then skip alien dropping bombs


                        ; LD A,1                         ; 10 rockets max available
DISPLAY_ALIEN_FIRE_LOOP:
                        ; PUSH AF                         ; Save rocket loop
; Display current alien rocket
                        LD HL,ALIEN_MISSILE_GRAPHIC     ; Point to player rocket graphic data
                        LD A,(IX+5)                     ; Get alien rocket collumn
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(IX+6)                     ; Get alien rocket line
                        LD (dispx+1),A                  ; Set sprite line

                        LD A,(ALIEN_BACKGROUND_COLOUR)  ; (A=2 for YELLOW)
                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        CALL sprite                     ; Display sprite
                        LD C,8                          ; 8 hires lines to move up screen at a time

; Move current alien rocket down 8 pixels
                        LD A,(IX+6)                     ; Get current rocket line
                        ADD A,C                         ; Move current alien rocket down screen 8 pixels
                        LD (IX+6),A                     ; Update current rocket line

; Reset alien missile if at bottom of screen
                        LD A,(IX+6)                     ; Get current player rocket line
                        CP 176                          ; At bottom
                        JR C,SKIP_SETTING_ALIEN_FIRE_ON ; If not then skip reseting missile
                        XOR A                           ; A=0 to reset missile
                        LD (IX+4),A                     ; Reset current missile


                        JP SKIP_SETTING_ALIEN_FIRE_ON   ;

SKIP_ALIEN_DROPPING_BOMBS:
; Check to see if we can enable alien missile
                        LD A,(ALIEN_GRAPHIC_COUNT)      ; Get alien graphic animation frame
                        CP 3                            ; Is it on frame 3?
                        JR NZ,SKIP_SETTING_ALIEN_FIRE_ON; If not then skip enabling alien fire
                        CALL RND                        ; Get random number
                        CP 40                           ; Reference 40
                        JR NC,SKIP_SETTING_ALIEN_FIRE_ON; If greater than 40 then skip enabling alien fire
                        LD (IX+4),255                   ; Set alien missile on

                        LD A,(IX+25)                    ; Get alien coordinate
                        LD (IX+5),A                     ; Set missile coordinate
                        LD A,(IX+26)                    ; Get alien coordinate
                        LD (IX+6),A                     ; Set missile coordinate
                        JP ALIEN_NOT_ENABLED            ; Jump to skip player hit by alien missile

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SKIP_SETTING_ALIEN_FIRE_ON:
; Check to see if alien rocket has hit player

                        LD A,(SHIELD_BONUS_COUNTDOWN)   ; Get bonus counter
                        OR A                            ; CP 0                            ; Is bonus off?
                        JR NZ,ALIEN_NOT_ENABLED         ; Bonus is on so alien bombs or alien cannot kill player

                        LD A,(PLAYER_HIT)               ; Get player hit status
                        OR A                            ; =0?
                        JR NZ,ALIEN_NOT_ENABLED         ; Skip checking alien ROCKET hitting player if so


                        LD A,(IX+4)                     ; Get current alien rocket status
                        OR A                            ; CP 0                            ; Is it disabled?
                        JR Z,ALIEN_ROCKET_NOT_HIT_PLAYER; Skip checking alien ROCKET hitting player if so

                        LD A,(SP1X_SHIP)                ; Get ship LEFT/RIGHT coordinate
                        SUB (IX+5)                      ; subtract alien missile line

                        JP P,CHCA1D                     ; No, skip negation
                        NEG                             ; Make it positive
CHCA1D:
                        CP 12                           ; within x range?
                        JR NC,ALIEN_ROCKET_NOT_HIT_PLAYER ; no - they've missed
CHCA2D:
                        LD A,(IX+6)                     ;

                        CP 160                          ; within y range?
                        JR C,ALIEN_ROCKET_NOT_HIT_PLAYER ; carry flag set if there's a collision

; Loose a life
                        XOR A                           ; A=0
                        LD (IX+4),A                     ; Disable alien missile
                        LD (PLAYER_MISSILE_SPREAD),A    ; Reset player missile spread
                        LD A,3                          ; A=3 to reset multi bombs to 3
                        LD (SET_NUMBER_OF_PLAYER_ROCKETS+1),A ; Reset multi bombs
                        LD A,1                          ; Set A to 1 to set player hit
                        LD (PLAYER_HIT),A               ; Set player hit to on

                        ; JP TAKE_1_FROM_LIVES            ; Take 1 from lives         ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        ; JP ALIEN_NOT_ENABLED            ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ALIEN_ROCKET_NOT_HIT_PLAYER:
; Check to see if alien has hit player
;ALIEN_DATA1:   30 bytes
;            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
;            DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
;            DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
;            DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
;            DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien missile coordinates (up to 10 missiles)
;            DEFB 0,0                        ; Alien start coordinate (25 in)
;            DEFB 0,0                        ; Alien end coordinate

                        LD A,(IX+0)                     ; Get current alien status
                        OR A                            ; CP 0, Is it disabled?
                        JR Z,ALIEN_NOT_ENABLED          ; Skip checking alien hitting player if so

                        LD A,(SP1X_SHIP)                ; Get ship LEFT/RIGHT coordinate
                        SUB (IX+25)                     ; subtract alien LEFT/RIGHT

                        JP P,CHCA1E                     ; No, skip negation
                        NEG                             ; Make it positive
CHCA1E:
                        CP 12                           ; within x range?
                        JR NC,ALIEN_NOT_ENABLED         ; no - they've missed
CHCA2E:
                        LD A,(IX+26)                    ; Get alien up/down

                        CP 150                          ; within y range?
                        JR C,ALIEN_NOT_ENABLED          ; carry flag set if there's a collision

; Loose a life
                        LD (PLAYER_MISSILE_SPREAD),A    ; Reset player missile spread
                        LD A,3                          ; A=3 to reset multi bombs to 3
                        LD (SET_NUMBER_OF_PLAYER_ROCKETS+1),A ; Reset multi bombs
                        LD A,1                          ; Set A to 1 to set player hit
                        LD (PLAYER_HIT),A               ; Set player hit to on
                        JP SKIP_ALIENS                  ;
                        ;  JP TAKE_1_FROM_LIVES            ; Take 1 from lives             ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        ; LD (IX+0),0                     ; Disable current alien

ALIEN_NOT_ENABLED:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                        LD DE,29                        ; Setup DE for addition to go to next alien data block
                        ADD IX,DE                       ; Move to next alien data block

NEXT_ALIEN:
                        LD BC,00                        ;
                        DEC B                           ;
                        JP NZ,PROCESS_ALIENS_LOOP1      ; Jump back until all aliens are processed



SKIP_ALIENS:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        ; CALL ADD_SCORE                  ;
                        ; CALL TAKE_1_FROM_LIVES            ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display player fire
                        LD IY,PLAYER_FIRE_MISSILE_COUNT ; Point to player rocket data
SET_NUMBER_OF_PLAYER_ROCKETS:LD A,3                     ; Number of rockets available Set by bonus
DISPLAY_PLAYER_FIRE_LOOP:
                        PUSH AF                         ; Save rocket loop
                        LD A,(IY+0)                     ; Get current missile enabled status
                        OR A                            ; Is current missile enabled?
                        JP Z,SKIP_DISPLAY_MISSILE       ; If not then jump to next player rocket data

                        LD HL,(PLAYER_MISSILE_GRAPHIC)  ; Point to player rocket graphic data
                        LD A,(IY+1)                     ; Get player rocket collumn
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(IY+2)                     ; Get player rocket line
                        LD (dispx+1),A                  ; Set sprite line

                        LD A,(ALIEN_BACKGROUND_COLOUR)  ; A=2 for YELLOW
                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        CALL sprite                     ; Display sprite
                        LD C,8                          ; 8 hires lines to move up screen at a time

; Is portal open so rockets go around portal?
                        LD A,(PORTAL_OPEN_CLOSE)        ; Get portal Open/Close status
                        CP 255                          ; Portal status open?
                        JR NZ,SKIP_MOVING_ROCKETS_AROUND_PORTAL ; If not then skip opening portal

; The portal is open so rockets must go around it if rocket is near portal
                        LD A,(IY+2)                     ; Get player rocket line
                        CP 64                           ; Are we around line 64, bottom of portal?
                        JR NC,SKIP_MOVING_ROCKETS_AROUND_PORTAL ; If not then skip moving rocket around portal

                        LD A,(IY+1)                     ; Get player rocket collumn
                        CP 120                          ; Middle of screen reference
                        JR NC,SKIP_MOVE_ROCKET_LEFT     ; If less than 120 then skip moving player rocket left
                        CP 80                           ; Close to the left of the portal?
                        JR C,SKIP_MOVE_ROCKET_LEFT      ; If less than 100 then skip moving player rocket left
                        LD A,(IY+1)                     ; Get player rocket collumn
                        SUB C                           ; Move rocket left
                        LD (IY+1),A                     ; Update player rocket collumn
                        JP SKIP_MOVING_ROCKETS_AROUND_PORTAL ; Jump to skip move rocket right check
SKIP_MOVE_ROCKET_LEFT:

                        JR C,SKIP_MOVE_ROCKET_RIGHT     ; If greater than 120 then skip moving player rocket right
                        CP 150                          ; Close to the right of the portal?
                        JR NC,SKIP_MOVE_ROCKET_RIGHT    ; If greater than 150 then skip moving player rocket right
                        ADD A,C                         ; Move rocket right
                        LD (IY+1),A                     ; Update player rocket collumn

SKIP_MOVE_ROCKET_RIGHT:



SKIP_MOVING_ROCKETS_AROUND_PORTAL:
; Check player fire spread
                        LD A,(PLAYER_MISSILE_SPREAD)    ; Get player fire spread status
                        CP 1                            ; Is it set?
                        JR NZ,SKIP_PLAYER_FIRE_SPREAD_DO ; If not then skip doing player fire spread

; The portal is open so rockets already go around it so skip moving left/right if alien spread and past line 64
                        LD A,(IY+2)                     ; Get player rocket line
                        CP 64                           ; Are we around line 64, bottom of portal?
                        JR C,SKIP_PLAYER_FIRE_SPREAD_DO ; If not then skip moving rocket around portal

                        CALL RND                        ; Get random number
                        CP 50                           ;
                        JR NC,SKIP_MOVE_ROCKET_LEFT2    ;


                        LD A,(IY+1)                     ; Get player rocket collumn
                        CP 16                           ; Middle of screen reference
                        JR C,SKIP_MOVE_ROCKET_LEFT2     ; If less than 120 then skip moving player rocket left

                        LD A,(IY+1)                     ; Get player rocket collumn
                        SUB C                           ; Move rocket left
                        LD (IY+1),A                     ; Update player rocket collumn
                        JP SKIP_PLAYER_FIRE_SPREAD_DO   ; Jump to skip move rocket right check
SKIP_MOVE_ROCKET_LEFT2:

                        CALL RND                        ; Get random number
                        CP 200                          ;
                        JR C,SKIP_PLAYER_FIRE_SPREAD_DO ;

                        LD A,(IY+1)                     ; Get player rocket collumn
                        CP 224                          ;
                        JR NC,SKIP_PLAYER_FIRE_SPREAD_DO ; If greater than 224 then skip moving player rocket right

                        ADD A,C                         ; Move rocket right
                        LD (IY+1),A                     ; Update player rocket collumn

SKIP_PLAYER_FIRE_SPREAD_DO:

;ALIEN_DATA1:   30 bytes
;            DEFB 0                          ; Alien status, 0-disabled, 255-enabled, countdown from 254-explode
;            DEFB 0                          ; Alien appears counter, counts up to 255, then enables alien, Set by wave data
;            DEFB 0                          ; Alien split counter, counts up, when 255,alien splits into 4
;            DEFB 0                          ; Alien dropping timer-0 disabled, any number set by wave data counts up to 254 then alien drops, 255=bottom of screen (has water)
;            DEFB 0                          ; Alien drops bombs status-0 no bombs, 255=drop bombs randomly.
;            DEFB 0,0                        ; Alien missile coordinates
;            DEFB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0; Alien explode dot coordinates (up to 9 dots)
;            DEFB 0,0                        ; Alien start coordinate (25 in)
;            DEFB 0,0                        ; Alien end coordinate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Test for player rocket hitting alien




                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        OR A                            ; CP 0                            ; Is Large head enabled?
                        JP NZ,SKIP_CHECKING_ALIEN_HIT_IF_HEAD_ENABLED; If so then skip testing player rocket hitting aliens



                        LD IX,ALIEN_DATA1               ; Point to Alien data
                        LD B,15                         ; 15 aliens to check
CHECK_ROCKET_HITTING_ALIEN_LOOP:
                        PUSH BC                         ;


; Is alien disabled, jump to next alien if so?
                        LD A,(IX+0)                     ; Get current alien status
                        OR A                            ; CP 0                            ; Is current alien disabled?
                        JP Z,JUMP_TO_NEXT_ALIEN_HIT_CHECK ; If disabled then jump to next alien

; Is alien enabled but not hit, check if alien is hit if so?
                        CP 255                          ; Is alien enabled?
                        JP Z,CHECK_HIT_ALIEN            ; If so then jump to Check if alien is hit

; Is alien hit already and counting down the explosion, jump to next alien if so?
                        CP 230                          ; Is alien counting down from 254 (exploding)?
                        JP NC,JUMP_TO_NEXT_ALIEN_HIT_CHECK ; Alien is exploding if above 244 so no need to check if alien hit

CHECK_HIT_ALIEN:
; Check if alien is hit

                        LD A,(IY+2)                     ; Get player's rocket line
                        SUB (IX+26)                     ; subtract alien sprite line

                        JP P,CHCA1                      ; No, skip negation
                        NEG                             ; Make it positive
CHCA1:
                        CP 12                           ; within x range?
                        JP NC,JUMP_TO_NEXT_ALIEN_HIT_CHECK ; no - they've missed

                        LD A,(IY+1)                     ; Get player's rocket collumn
                        SUB (IX+25)                     ; subtract alien sprite collumn
                        JP P,CHCA2                      ; No, skip negation
                        NEG                             ; Make it positive
CHCA2:

                        CP 12                           ; within y range?
                        JP NC,JUMP_TO_NEXT_ALIEN_HIT_CHECK ; carry flag set if there's a collision
; We hit an alien

                        LD (IX+3),0                     ; Set alien dropping counter disabled

                        CALL ADD_SCORE                  ; Add score

                        LD (IY+0),0                     ; Disable rocket
                        LD (IX+0),254                   ; Set alien to explode


; Setup alien explosion

                        LD D,(IX+25)                    ; Get alien up/down coordinate
                        LD E,(IX+26)                    ; Get alien left/right coordinate


                        LD (IX+7),D                     ; Setup alien exploding dots start coordinates
                        LD (IX+8),E                     ;
                        LD (IX+9),D                     ;
                        LD (IX+10),E                    ;
                        LD (IX+11),D                    ;
                        LD (IX+12),E                    ;
                        LD (IX+13),D                    ;
                        LD (IX+14),E                    ;
                        LD (IX+15),D                    ;
                        LD (IX+16),E                    ;
                        LD (IX+17),D                    ;
                        LD (IX+18),E                    ;
                        LD (IX+19),D                    ;
                        LD (IX+20),E                    ;
                        LD (IX+21),D                    ;
                        LD (IX+22),E                    ;
                        LD (IX+23),D                    ;
                        LD (IX+24),E                    ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                        LD HL,ALIEN_HIT_COUNTER         ; Point to alien hit counter
                        LD A,(HL)                       ; Get alien hit counter
                        OR A                            ; 0?
                        JR Z,SKIP_TAKING_1_FROM_ALIEN_HIT_COUNTER; If already 0 then we wont take any more
                        DEC (HL)                        ; Take 1 from alien hit counter
SKIP_TAKING_1_FROM_ALIEN_HIT_COUNTER:
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Setup bonus
                        LD A,(BONUS_ENABLE)             ; Get Bonus enabled status
                        OR A                            ; CP 0                            ; Is it off?
                        JR NZ,JUMP_TO_NEXT_ALIEN_HIT_CHECK ; Skip setting up bonus if already enabled

; Setup bonus
;BONUS_UP_DOWN:          DEFB 0                          ; Bonus up/down coordinate
;BONUS_LEFT_RIGHT        DEFB 0                          ; Bonus left/right coordinate
;BONUS_ENABLE:           DEFB 0                          ; Bonus enabled
;BONUS_GRAPHIC_POINTER:  DEFB 0,0                        ; Bonus graphic pointer
;SHIELD_BONUS_COUNTDOWN                                  ; Countdown then disable shield
;1= 1000 bonus, 2=Lives bonus, 3=Shield bonus, 4=Pow bonus, 5=H2O Bonus, 6=O2 bonus, 7=Multi player missiles
                        ; JP SKIP_ALIEN_HEAD_BONUS

; Normal alien bonus setup
                        LD A,(IX+26)                    ; Get alien up/down coordinate
                        LD (BONUS_UP_DOWN),A            ; Get bonus start up/down coordinate
                        LD A,(IX+25)                    ; Get alien left/right coordinate
                        LD (BONUS_LEFT_RIGHT),A         ; Get bonus start left/right coordinate

; Choose bonus

                        CALL CHOOSE_BONUS               ; Select a bonus

JUMP_TO_NEXT_ALIEN_HIT_CHECK:

                        LD DE,29                        ; Setup DE for addition to add for next sprite data block
                        ADD IX,DE                       ; Move to next sprite data block
                        POP BC                          ;
                        DEC B                           ;
                        JP NZ,CHECK_ROCKET_HITTING_ALIEN_LOOP;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Jumps here if Large head enabled
; Do we need to check if Alien head is hit by player fire?
SKIP_CHECKING_ALIEN_HIT_IF_HEAD_ENABLED:




; Check to see if Alien head is required
; ALIEN_HEAD_ENABLED =0 for disabled, 1 for coming out, 2 for going away, 3 for displaying
                        LD A,(ALIEN_HEAD_ENABLED)       ; Get alien head enabled status
                        CP 3                            ; If Alien head is not in show mode then skip alien head hit check
                        JP NZ,SKIP_CHECK_PLAYER_FIRE_HIT_ALIEN_HEAD ; Skip alien head if so

; Setup alienhead bonus
                        LD A,(BONUS_ENABLE)             ; Get Bonus enabled status
                        OR A                            ; CP 0                            ; Is it off?
                        JR NZ,CHECK_HIT_ALIEN_HEAD      ; Skip setting up bonus if already enabled

ALIENHEAD_BONUS_Y:      LD A,0                          ;
                        LD (BONUS_UP_DOWN),A            ; Get bonus start up/down coordinate
ALIENHEAD_BONUS_X:      LD A,0                          ;
                        LD (BONUS_LEFT_RIGHT),A         ; Get bonus start left/right coordinate


CHECK_HIT_ALIEN_HEAD:
; Check if alien head is hit

ALIENHEAD_CHECK_HIT_X:  LD A,0                          ;
                        SUB 48                          ;
                        LD B,A                          ;
                        LD A,(IY+2)                     ; Get player's rocket line
                        SUB B                           ;
                        JP P,CHCA1X                     ; No, skip negation
                        NEG                             ; Make it positive
CHCA1X:
                        CP 40                           ; within x range?
                        JP NC,SKIP_CHECK_PLAYER_FIRE_HIT_ALIEN_HEAD ; no - they've missed

ALIENHEAD_CHECK_HIT_Y:  LD A,0                          ;
                        SUB 16                          ;
                        LD B,A                          ;
                        LD A,(IY+1)                     ; Get player's rocket collumn
                        SUB B                           ;
                        JP P,CHCA2X                     ; No, skip negation
                        NEG                             ; Make it positive
CHCA2X:

                        CP 24                           ; within y range?
                        JP NC,SKIP_CHECK_PLAYER_FIRE_HIT_ALIEN_HEAD ; carry flag set if there's a collision
; We hit alien head

                        LD A,(BONUS_ENABLE)             ; Get Bonus enabled status
                        OR A                            ; CP 0                            ; Is it off?
                        JR NZ,CHECK_HIT_ALIEN_HEAD2     ; Skip setting up bonus if already enabled

                        CALL CHOOSE_BONUS               ; Choose bonus for Alienhead
CHECK_HIT_ALIEN_HEAD2:

                        CALL ADD_SCORE                  ; Add score
                        XOR A                           ; A=0
                        LD (IY+0),A                     ; Disable rocket

                        LD HL,ALIENHEAD_HIT_COUNTER     ; Point to to Alienhead hit counter
                        INC (HL)                        ; Add 1 to alien head hit pointer
                        LD A,(HL)                       ;
                        CP 20                           ; Is alien head hit 20 times?
                        JR C,SKIP_SETTING_ALIENHEAD_TO_EXPLODE ; Skip setting alien head to explode if not 20

; Set alien head to explode
                        LD (ALIEN_HEAD_MOVEMENT_COUNTER),A;
                        LD A,4                          ; A=4 for alienhead explode
                        LD (ALIEN_HEAD_ENABLED),A       ; Set alien head enabled status to explode

SKIP_SETTING_ALIENHEAD_TO_EXPLODE:

; Get hires ATTR address for lighting up alienhead when hit

                        LD A,(ALIENHEAD_CHECK_HIT_Y+1)  ; up/down       ; Look at the vertical first.
                        SUB 16                          ;
                        RRCA                            ;
                        RRCA                            ;
                        RRCA                            ;
                        AND 31                          ;
                        LD L,A                          ;
                        LD A,(ALIENHEAD_CHECK_HIT_X+1)  ; get horizontal position.
                        SUB 40                          ;
                        RLCA                            ;
                        RLCA                            ;
                        LD C,A                          ;
                        AND 224                         ;
                        OR L                            ;
                        LD L,A                          ;
                        LD A,C                          ;
                        AND 3                           ;
                        OR 120                          ; ATTR 1 LOCATION
                        ;      ADD A,112            ; attributes start at 112*256=28672.
                        LD H,A                          ;
; HL=screen ATTR address of alien head
; Flash alien head as it is hit
                        LD B,6                          ; 6 text lines to colour
LIGHT_ALIENHEAD_LOOP2:
                        PUSH BC                         ; Save ATTR outer loop
                        LD B,5                          ; 5 collumns to colour
LIGHT_ALIENHEAD_LOOP1:
                        LD (HL),120                     ; Colour current ATTR
                        INC HL                          ; Move to next collumn
                        DJNZ LIGHT_ALIENHEAD_LOOP1      ; Loop back to complete all collumns
                        POP BC                          ; Restore outer ATTR loop
                        LD DE,27                        ; Setup DE for addition
                        ADD HL,DE                       ; Add DE to current address to drop to next text line
                        DJNZ LIGHT_ALIENHEAD_LOOP2      ; Jump back until all text lines are done



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Jumps here if Alien head is not being tested for player missiles hitting it
SKIP_CHECK_PLAYER_FIRE_HIT_ALIEN_HEAD:


; Move current player rocket up screen for next display
                        LD A,(IY+2)                     ; Get current rocket line
                        SUB 8                           ; Move current player rocket up screen 8 pixels
                        LD (IY+2),A                     ; Update current rocket line
                        CP 8                            ; At top (line 8?)
                        JR NC,SKIP_FIRE_ON              ; If not then skip reseting missile
                        XOR A                           ; A=0 to reset missile
                        LD (IY+0),A                     ; Reset current missile
                        JP SKIP_FIRE_ON                 ; Move to next missile
SKIP_DISPLAY_MISSILE:
; Current missile is not used, check if fire is pressed and use this missile if so
                        LD A,(FIRE_ON)                  ; Get fire key pressed status?
                        OR A                            ; Is fire pressed?
                        JR Z,SKIP_FIRE_ON               ; If not then skip fire

                        LD HL,TORPEDO_SOUND             ;
                        CALL GENERAL_SOUND              ;

                        LD (IY+0),A                     ; Set current missile to on
                        LD A,(SP1X_SHIP)                ; Get player collumn
                        LD (IY+1),A                     ; Set missile collumn to player collumn
                        LD A,(SP1Y_SHIP)                ; Get player ship row
                        SUB 12                          ; Take 12 pixels to start rocket above player ship
                        LD (IY+2),A                     ; Set missile row
                        XOR A                           ; A=0 to Set fire key to off
                        LD (FIRE_ON),A                  ; Set fire key to off

SKIP_FIRE_ON:
                        INC IY                          ; Move to next player rocket data
                        INC IY                          ;
                        INC IY                          ;
                        POP AF                          ; Restore rocket loop
                        DEC A                           ;
                        JP NZ,DISPLAY_PLAYER_FIRE_LOOP  ; Jump back to display all enabled rockets


                        LD A,(ALIEN_HEAD_ENABLED)       ;
                        CP 0                            ;
                        JP NZ,SKIP_NEXT_LEVEL_CHECK     ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display alien explosions

                        LD IX,ALIEN_DATA1               ; Point to Alien data
                        LD B,15                         ; 15 aliens to check
CHECK_ALIEN_EXPLODING_LOOP:
                        PUSH BC                         ; Save alien exploding check loop

                        LD A,(IX+0)                     ; Get alien status
                        ;   CP 0                            ; Is alien enabled
                        ;  JR Z,JUMP_TO_NEXT_ALIEN_EXPLODE_CHECK ; If so, skip alien exploding

                        CP 255                          ; Is alien enabled?
                        JP Z,JUMP_TO_NEXT_ALIEN_EXPLODE_CHECK ; If so then jump to next alien check

                        CP 230                          ; Is alien counting down from 254 (exploding)?
                        JP C,JUMP_TO_NEXT_ALIEN_EXPLODE_CHECK ; Alien is not exploding if below 244 so no need to update explode dots

; Update alien exploding


                        PUSH IX                         ; Save alien pointer

                        LD DE,7                         ; Setup DE for addition
                        ADD IX,DE                       ; Move to alien explode data

                        ;  CALL RND                        ;
                        ;  CP 10                           ;
                        ;  JR C,SKIP_EXPLODE_1            ;
                        DEC (IX+0)                      ; Take 1 from current alien explode dot coordinate
SKIP_EXPLODE_1:         ;

                        DEC (IX+2)                      ; Take 1 from current alien explode dot coordinate

                        CALL RND                        ;
                        CP 50                           ;
                        JR NC,SKIP_EXPLODE_2            ;

                        DEC (IX+3)                      ;
SKIP_EXPLODE_2:
                        ; DEC (IX+5)                      ;
                        DEC (IX+6)                      ; Take 1 from current alien explode dot coordinate


                        INC (IX+8)                      ; Take 1 from current alien explode dot coordinate
                        ;

                        INC (IX+10)                     ; Take 1 from current alien explode dot coordinate
                        CALL RND                        ;
                        CP 20                           ;
                        JR NC,SKIP_EXPLODE_8            ;
                        INC (IX+10)                     ;
SKIP_EXPLODE_8:
                        INC (IX+11)                     ;

                        CALL RND                        ;
                        CP 20                           ;
                        JR NC,SKIP_EXPLODE_3            ;

                        INC (IX+12)                     ;
SKIP_EXPLODE_3:
                        INC (IX+13)                     ;


                        CALL RND                        ;
                        CP 20                           ;
                        JR NC,SKIP_EXPLODE_6            ;
                        INC (IX+13)                     ;
SKIP_EXPLODE_6:
                        INC (IX+14)                     ;
                        CALL RND                        ;
                        CP 10                           ;
                        JR NC,SKIP_EXPLODE_7            ;
                        INC (IX+14)                     ;
SKIP_EXPLODE_7:
                        CALL RND                        ;
                        CP 50                           ;
                        JR NC,SKIP_EXPLODE_4            ;
                        INC (IX+15)                     ;
SKIP_EXPLODE_4:
                        INC (IX+15)                     ;

                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,SKIP_EXPLODE_5A           ;

                        DEC (IX+16)                     ;
SKIP_EXPLODE_5A:
                        CALL RND                        ;
                        CP 100                          ;
                        JR NC,SKIP_EXPLODE_5            ;
                        INC (IX+17)                     ;
SKIP_EXPLODE_5:
                        CALL DRAW_EXPLOSION             ;

                        POP IX                          ; Restore alien pointer

ALIEN_NOT_EXPLODING:
                        CALL NOISE_SOUND                ; Make explosion sound
                        DEC (IX+0)                      ; Take 1 from alien status to count down explode
                        LD A,(IX+0)                     ; Get alien explode status
                        CP 245                          ; Is the explosion counter at 243 or less?
                        JR NC,JUMP_TO_NEXT_ALIEN_EXPLODE_CHECK ; Alien is exploding so skip reseting alien
; Reset alien
                        XOR A                           ; A=0
                        LD (IX+0),A                     ; Disable alien
                        INC A                           ; A=1
                        ;
                        LD (IX+1),A                     ; Set alien appears counter
                        LD A,120                        ; Portal coordinates   120,32
                        LD (IX+25),A                    ; Set alien collumn

                        LD A,32                         ;
                        LD (IX+26),A                    ; Set alien line


JUMP_TO_NEXT_ALIEN_EXPLODE_CHECK:

                        LD DE,29                        ; Setup DE for addition to add for next sprite data block
                        ADD IX,DE                       ; Move to next sprite data block
                        POP BC                          ;
                        DEC B                           ;
                        JP NZ,CHECK_ALIEN_EXPLODING_LOOP;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Check to see if we need to move to next wave

                        LD HL,ALIEN_DATA1               ; Point to alien data
                        LD B,14                         ; 15 aliens to check
ALIEN_ENABLED_TEST_LOOP:
                        LD A,(HL)                       ; Get status of current alien
                        OR A                            ; Is the status 0?
                        JP NZ,SKIP_CLOSE_PORTAL         ; If not then return as there are still some aliens enabled
                        LD DE,29                        ; Setup DE for addition
                        ADD HL,DE                       ; Move to next alien block
                        DJNZ ALIEN_ENABLED_TEST_LOOP    ; Jump back to check all 15 aliens

; There are no aliens still enabled.

                        LD HL,ALIEN_HIT_COUNTER         ; Point to alien hit counter
                        LD A,(HL)                       ; Get alien hit counter
                        OR A                            ; CP 0                            ; No more aliens so onto next level?
                        JR NZ,SKIP_CLOSE_PORTAL         ;
                        LD A,0                          ;
                        LD (PORTAL_OPEN_CLOSE),A        ;

SKIP_CLOSE_PORTAL:
                        LD A,(PORTAL_OPEN_COUNTER)      ;
                        CP 255                          ;
                        JR NZ,SKIP_NEXT_LEVEL_CHECK     ;
                        LD A,(PORTAL_APPEAR_COUNTER)    ; Get portal status
                        OR A                            ; CP 0                            ; Is portal closed?
                        JP Z,MOVE_TO_NEXT_LEVEL         ; If so then jump to move to next level
SKIP_NEXT_LEVEL_CHECK:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display bonus
                        LD A,(BONUS_ENABLE)             ; Get Bonus enabled status
                        OR A                            ; CP 0                            ; Is it off?
                        JP Z,SKIP_DISPLAYING_BONUS      ; Skip displaying bonus if not enabled

; Setup bonus
;BONUS_UP_DOWN:          DEFB 0                          ; Bonus up/down coordinate
;BONUS_LEFT_RIGHT        DEFB 0                          ; Bonus left/right coordinate
;BONUS_ENABLE:           DEFB 0                          ; Bonus enabled
;BONUS_GRAPHIC_POINTER:  DEFB 0,0                        ; Bonus graphic pointer

; Display player bonus

                        LD HL,(BONUS_GRAPHIC_POINTER)   ; Get bonus graphic
                        PUSH HL                         ;
                        LD A,(BONUS_LEFT_RIGHT)         ; Get bonus LEFT/RIGHT coordinate
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(BONUS_UP_DOWN)            ; Get bonus UP/DOWN coordinate (SP1Y_SHIP)
                        LD (dispx+1),A                  ; Set sprite Y to X coordinate
                        ; XOR A                           ; OR SPRITE
                        AND 3                           ;
                        LD B,A                          ;

BONUS_COLOUR:           LD A,5                          ; A=bonus colour set from rest of code

                        ; ADD A,B

                        OR B                            ;
                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        CALL sprite                     ; Display sprite
                        POP HL                          ;
; Rotate centre of bonus

                        LD A,(ROTATE_BONUS)             ; Get bonus rotation status
                        CP 0                            ; Is it off?
                        JR Z,SKIP_ROTATE_BONUS          ; Skip if so

                        LD DE,11                        ;
                        ADD HL,DE                       ;

                        LD B,7                          ; 7 lines of sprite to rotate
ROTATE_BONUS_LOOP:
                        RLC (HL)                        ; Rotate left content of screen at HL
                        DEC HL                          ; get screen location to the left
                        RLC (HL)                        ; Rotate left content of screen at HL



                        INC HL                          ; Move left byte to the right one collumn
                        INC HL                          ; Move right byte to the right one collumn
                        INC HL                          ; Move right byte to the right one collumn

                        DJNZ ROTATE_BONUS_LOOP          ; Jump back to complete all lines



SKIP_ROTATE_BONUS:


; Move bonus down screen and check if at the bottom

                        LD HL,BONUS_UP_DOWN             ; Get bonus up/down coordinate
                        INC (HL)                        ; Move bonus down screen
                        LD A,(HL)                       ; Get up/down value
                        CP 176                          ; Is bonus at bottom of screen?
                        JR C,SKIP_RESETTING_BONUS       ; If not then skip resetting bonus
                        XOR A                           ; A=0 to disable bonus
                        LD (BONUS_ENABLE),A             ; Disable bonus
                        JP SKIP_DISPLAYING_BONUS        ; Jump to skip rest of bonus

SKIP_RESETTING_BONUS:

                        CP 146                          ; within y range?
                        JP C,NOT_HIT_BONUS              ; carry flag set if there's a collision

                        LD A,(BONUS_LEFT_RIGHT)         ; Get bonus left/right
                        LD B,A                          ; Place into B
                        LD A,(SP1X_SHIP)                ; Get ship LEFT/RIGHT coordinate
                        SUB B                           ; Subtract bonus LEFT/RIGHT
                        JP P,CHCA1CA                    ; No, skip negation
                        NEG                             ; Make it positive
CHCA1CA:
                        CP 12                           ; within x range?
                        JR NC,NOT_HIT_BONUS             ; no - they've missed

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;1= 1000 bonus, 2=Lives bonus, 3=Shield bonus, 4=Pow bonus, 5=H2O Bonus, 6=O2 bonus, 7=Rocket bonus
; Bonus collected

                        LD HL,GET_BONUS_SOUND           ;
                        CALL GENERAL_SOUND              ;

                        LD A,(BONUS_ENABLE)             ; Get bonus status

                        CP 1                            ; Is it 1 for 1000?
                        JR NZ,SKIP_1000                 ; If not then skip 1000
                        CALL ONE_THOUSAND_POINTS        ; Add 1000 to score
                        JP BONUS_END                    ; Jump to end bonus
SKIP_1000:

                        CP 2                            ; Is it 2 for lives?
                        JR NZ,SKIP_ADD_LIFE             ; If not then skip adding life
                        CALL ADD_1_TO_LIVES             ; Add life
                        JP BONUS_END                    ; Jump to end bonus
SKIP_ADD_LIFE:

                        CP 3                            ; Is it 3 for shields?
                        JR NZ,SKIP_ADD_LIFEB            ; If not then skip adding shields
                        LD A,200                        ; Set shield counter to 200
                        LD (SHIELD_BONUS_COUNTDOWN),A   ;
                        JP BONUS_END                    ; Jump to end bonus
SKIP_ADD_LIFEB:

                        CP 4                            ; Is it 4 for Pow?
                        JR NZ,SKIP_POW                  ;
                        CALL POW                        ; Pow all visible aliens
                        JP BONUS_END                    ; Jump to end bonus
SKIP_POW:

                        CP 5                            ; Is it 5 for H2O Bonus?
                        JR NZ,SKIP_H2O                  ; If not then skip adding H2O
                        LD A,9                          ;
                        LD (H2O),A                      ; Point to H2O varable
                        CALL UPDATE_METERS              ; Update meters
                        JP BONUS_END                    ; Jump to end bonus
SKIP_H2O:
                        CP 6                            ; Is it 6 for O2 Bonus?
                        JR NZ,SKIP_O2                   ; If not then skip adding O2
                        LD A,9                          ; Fill O2
                        LD (O2),A                       ; Set O2 varable
                        CALL UPDATE_METERS              ; Update meters
                        JP BONUS_END                    ; Jump to end bonus

SKIP_O2:
; Multi player missile bonus
                        CP 7                            ; Is it 7 for multi missiles Bonus?
                        JR NZ,BONUS_END                 ; If not then skip adding multi missiles

; If multi missile is already set then set to missile spread
                        LD A,(SET_NUMBER_OF_PLAYER_ROCKETS+1) ; Get current number of player rockets
                        CP 6                            ; Is player rockets set to 6 already?
                        JR Z,GET_ROCKET_SPREAD_BONUS    ; If not then skip spreading player rockets bonus

                        LD A,6                          ; Set player missiles to 6
                        LD (SET_NUMBER_OF_PLAYER_ROCKETS+1),A ; Set player number of missiles
                        LD HL,PLAYER_MISSILE_GRAPHIC2   ; Point to Player basic missile graphic
                        LD (PLAYER_MISSILE_GRAPHIC),HL  ; Set player missile graphic pointer to basic missile graphic
                        JP BONUS_END                    ; Skip setting player rocket spread


GET_ROCKET_SPREAD_BONUS:
                        LD A,8                          ; A=8 to set number of player rockets
                        LD (SET_NUMBER_OF_PLAYER_ROCKETS+1),A ; Set current number of player rockets to 5
                        LD A,1                          ; A=1 to set multi missile spread on
                        LD (PLAYER_MISSILE_SPREAD),A    ; Set player multi missile spread
                        LD HL,PLAYER_MISSILE_GRAPHIC3   ; Point to Player basic missile graphic
                        LD (PLAYER_MISSILE_GRAPHIC),HL  ; Set player missile graphic pointer to basic missile graphic



BONUS_END:
; Disable bonus as it has been used
                        XOR A                           ; A=0 to disable bonus
                        LD (BONUS_ENABLE),A             ; Disable bonus

NOT_HIT_BONUS:


SKIP_DISPLAYING_BONUS:






;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display player ship

                        ; LD HL,(PLAYER_SHIP_GRAPHIC_POINTER) ; Get current player ship graphic
SET_PLAYER_GRAPHIC:     LD HL,0                         ; This value is changed by the rest of the code
                        LD A,(SP1X_SHIP)                ; Get ship LEFT/RIGHT coordinate (SP1X_SHIP)
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(SP1Y_SHIP)                ; Get ship UP/DOWN coordinate (SP1Y_SHIP)
                        LD (dispx+1),A                  ; Set sprite Y to X coordinate

SET_PLAYER_COLOUR:      LD A,0                          ; A=5 for bright cyan
                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        CALL sprite                     ; Display sprite


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Update alien animation
                        LD HL,ALIEN_GRAPHIC_COUNT       ; Get alien graphic counter
                        INC (HL)                        ; Add 1 to anim
                        LD A,(HL)                       ; Get alien graphic counter number
                        CP 4                            ; Alien graphic counter at 4?
                        JR NZ,SKIP_RESETING_ALIEN_GRAPHIC_COUNTER; If not 4 then skip resetting alien graphic counter
                        LD (HL),0                       ; A=0 Reset alien graphic counter number to 0

                        CALL MEMORY_SWITCH_1            ; Switch to memory 0
                        CALL SET_ALIEN_GRAPHIC_1        ;

                        LD HL,CURRENT_ALIEN_GRAPHIC     ; Reset graphic back to first frame
                        LD (ALIEN_GRAPHIC),HL           ;
                        JP SKIP_RESETING_ALIEN_GRAPHIC  ; Jump to skip adding frame

SKIP_RESETING_ALIEN_GRAPHIC_COUNTER:

                        LD HL,(ALIEN_GRAPHIC)           ; Get alien graphic pointer
                        LD DE,32                        ; Setup DE for addition
                        ADD HL,DE                       ; Move to next graphic
                        LD (ALIEN_GRAPHIC),HL           ; Get alien graphic pointer

SKIP_RESETING_ALIEN_GRAPHIC:

                        CALL BUBBLES                    ; Display bubbles in test tubes


                        LD A,(PLAYER_HIT)               ; Get player hit status
                        OR A                            ; Is it 0 for not hit?
                        JR Z,SKIP_EXPLODE_PLAYER_FRAME  ; If 0 then skip exploding player.

; Player_hit is greater than 0 to advance player explode graphic
EXPLODE_PLAYER_FRAME:
                        LD HL,PLAYER_EXPLODE_GRAPHICS   ; Point to explosion graphics
                        LD A,(PLAYER_HIT)               ; Place player hit into A for loop to increment explode graphic
                        CP 0                            ; Has player just been hit?
                        JR C,SKIP_ADD_TO_EXPLOSION_GRAPHIC ; Skip adding to explode graphic if so

                        LD B,A                          ; Get alien hit graphic counter into B for loop
ADD_TO_EXPLOSION_GRAPHIC_LOOP:
                        LD DE,32                        ; Setup DE for addition
                        ADD HL,DE                       ; Update explode graphic pointer
                        DJNZ ADD_TO_EXPLOSION_GRAPHIC_LOOP ; Jump back until we have the correct explosion graphic frame
SKIP_ADD_TO_EXPLOSION_GRAPHIC:
                        LD A,(SP1X_SHIP)                ; Get ship LEFT/RIGHT coordinate (SP1X_SHIP)
                        LD (dispy+1),A                  ; Set sprite Y to X coordinate
                        LD A,(SP1Y_SHIP)                ; Get ship UP/DOWN coordinate (SP1Y_SHIP)
                        LD (dispx+1),A                  ; Set sprite Y to X coordinate

;Colour player explode
                        LD A,(ALIEN_BACKGROUND_COLOUR)  ; A=main level colour set from rest of code

                        LD (SET_SPRITE_COLOUR+1),A      ; Set sprite colour store to cyan
                        CALL sprite                     ; Display sprite
                        CALL NOISE_SOUND                ; Explosion sound

                        LD HL,PLAYER_HIT                ; Place player hit into A for loop to increment explode graphic
                        INC (HL)                        ; Add 1 to player hit graphic counter
                        LD A,(HL)                       ; Get player hit counter into A for testing
                        CP 16                           ; Are we on frame 8 of exploding player?
                        JP Z,TAKE_1_FROM_LIVES          ; If so then jump to take 1 from lives

SKIP_EXPLODE_PLAYER_FRAME:



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;--------------------------------------------------------------------------------------------------------
SHOW_BUFFER:
;ATTR

                        ;  LD (SAVE_SPB+1),SP
                        LD HL,ATTR1+(23*30) +12         ;
                        LD DE,22528+(23*30) +11         ; ATTR Line 2,2


                        LD A,19                         ;

C45503:
                        LD BC,0                         ;
                        LDD                             ; 16 T-States
                        LDD                             ; 16 T-States
                        LDD                             ; 16 T-States
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;
                        LDD                             ;



                        DEC DE                          ;
                        DEC DE                          ;
                        DEC DE                          ;
                        DEC DE                          ;
                        DEC HL                          ;
                        DEC HL                          ;
                        DEC HL                          ;
                        DEC HL                          ;
                        DEC A                           ;
                        JR NZ,C45503                    ;


;SAVE_SPB:                 LD SP,00
                        ;   EI
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Screen
                        LD B,A                          ; B=0
                        LD A,28                         ;
                        ; LD C,A                          ;
                        ; LD HL,24642                     ;
                        ; LD DE,16450                     ;
                        ; LDIR                            ;
                        LD C,A                          ;
                        LD HL,24674                     ;
                        LD DE,16482                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,24706                     ;
                        LD DE,16514                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,24738                     ;
                        LD DE,16546                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,24770                     ;
                        LD DE,16578                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,24802                     ;
                        LD DE,16610                     ;
                        LDIR                            ;
                        ;  LD C,A                          ;
                        ;  LD HL,24834                     ;
                        ;  LD DE,16642                     ;
                        ;  LDIR                            ;
                        ;  LD C,A                          ;
                        ;  LD HL,24866                     ;
                        ;  LD DE,16674                     ;
                        ;  LDIR                            ;
                        ;  LD C,A                          ;
                        ;  LD HL,24898                     ;
                        ;  LD DE,16706                     ;
                        ;  LDIR                            ;
                        LD C,A                          ;
                        LD HL,24930                     ;
                        LD DE,16738                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,24962                     ;
                        LD DE,16770                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,24994                     ;
                        LD DE,16802                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,25026                     ;
                        LD DE,16834                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25058                     ;
                        LD DE,16866                     ;
                        LDIR                            ;
                        ; LD C,A                          ;
                        ; LD HL,25090                     ;
                        ; LD DE,16898                     ;
                        ; LDIR                            ;
                        ; LD C,A                          ;
                        ; LD HL,25122                     ;
                        ; LD DE,16930                     ;
                        ; LDIR                            ;
                        ; LD C,A                          ;
                        ; LD HL,25154                     ;
                        ; LD DE,16962                     ;
                        ; LDIR                            ;
                        LD C,A                          ;
                        LD HL,25186                     ;
                        LD DE,16994                     ;
                        LDIR                            ;


                        LD C,A                          ;
                        LD HL,25218                     ;
                        LD DE,17026                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25250                     ;
                        LD DE,17058                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25282                     ;
                        LD DE,17090                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25314                     ;
                        LD DE,17122                     ;
                        LDIR                            ;
                        ; LD C,A                          ;
                        ; LD HL,25410                     ;
                        ; LD DE,17218                     ;
                        ; LDIR                            ;
                        LD C,A                          ;
                        LD HL,25442                     ;
                        LD DE,17250                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,25474                     ;
                        LD DE,17282                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25506                     ;
                        LD DE,17314                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25538                     ;
                        LD DE,17346                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25570                     ;
                        LD DE,17378                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        ; LD HL,25602                     ;
                        ; LD DE,17410                     ;
                        ; LDIR                            ;


                        ; LD C,A                          ;
                        ; LD HL,25634                     ;
                        ; LD DE,17442                     ;
                        ; LDIR                            ;
                        ; LD C,A                          ;
                        ; LD HL,25666                     ;
                        ; LD DE,17474                     ;
                        ; LDIR                            ;
                        LD C,A                          ;
                        LD HL,25698                     ;
                        LD DE,17506                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25730                     ;
                        LD DE,17538                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,25762                     ;
                        LD DE,17570                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25794                     ;
                        LD DE,17602                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,25826                     ;
                        LD DE,17634                     ;
                        LDIR                            ;
                        ; LD C,A                          ;
                        ; LD HL,25922                     ;
                        ; LD DE,17730                     ;
                        ; LDIR                            ;
                        LD C,A                          ;
                        LD HL,25954                     ;
                        LD DE,17762                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,25986                     ;
                        LD DE,17794                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26018                     ;
                        LD DE,17826                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26050                     ;
                        LD DE,17858                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26082                     ;
                        LD DE,17890                     ;
                        LDIR                            ;   17990 FAULT

                        LD C,A                          ;
                        LD HL,26210                     ;
                        LD DE,18018                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26242                     ;
                        LD DE,18050                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26274                     ;
                        LD DE,18082                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26306                     ;
                        LD DE,18114                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26338                     ;
                        LD DE,18146                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26466                     ;
                        LD DE,18274                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26498                     ;
                        LD DE,18306                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26530                     ;
                        LD DE,18338                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26562                     ;
                        LD DE,18370                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26594                     ;
                        LD DE,18402                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26626                     ;
                        LD DE,18434                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26658                     ;
                        LD DE,18466                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26690                     ;
                        LD DE,18498                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26722                     ;
                        LD DE,18530                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26754                     ;
                        LD DE,18562                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26786                     ;
                        LD DE,18594                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26818                     ;
                        LD DE,18626                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26850                     ;
                        LD DE,18658                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,26882                     ;
                        LD DE,18690                     ;
                        LDIR                            ;


                        LD C,A                          ;
                        LD HL,26914                     ;
                        LD DE,18722                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,26946                     ;
                        LD DE,18754                     ;
                        LDIR                            ;


                        LD C,A                          ;
                        LD HL,26978                     ;
                        LD DE,18786                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27010                     ;
                        LD DE,18818                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27042                     ;
                        LD DE,18850                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27074                     ;
                        LD DE,18882                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27106                     ;
                        LD DE,18914                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27138                     ;
                        LD DE,18946                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27170                     ;
                        LD DE,18978                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27202                     ;
                        LD DE,19010                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27234                     ;
                        LD DE,19042                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27266                     ;
                        LD DE,19074                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27298                     ;
                        LD DE,19106                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27330                     ;
                        LD DE,19138                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27362                     ;
                        LD DE,19170                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27394                     ;
                        LD DE,19202                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27426                     ;
                        LD DE,19234                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27458                     ;
                        LD DE,19266                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27490                     ;
                        LD DE,19298                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27522                     ;
                        LD DE,19330                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27554                     ;
                        LD DE,19362                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27586                     ;
                        LD DE,19394                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27618                     ;
                        LD DE,19426                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27650                     ;
                        LD DE,19458                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27682                     ;
                        LD DE,19490                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27714                     ;
                        LD DE,19522                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27746                     ;
                        LD DE,19554                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27778                     ;
                        LD DE,19586                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27810                     ;
                        LD DE,19618                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27842                     ;
                        LD DE,19650                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27874                     ;
                        LD DE,19682                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27906                     ;
                        LD DE,19714                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27938                     ;
                        LD DE,19746                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,27970                     ;
                        LD DE,19778                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28002                     ;
                        LD DE,19810                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28034                     ;
                        LD DE,19842                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28066                     ;
                        LD DE,19874                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28098                     ;
                        LD DE,19906                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28130                     ;
                        LD DE,19938                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28162                     ;
                        LD DE,19970                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28194                     ;
                        LD DE,20002                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28226                     ;
                        LD DE,20034                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28258                     ;
                        LD DE,20066                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28290                     ;
                        LD DE,20098                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28322                     ;
                        LD DE,20130                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28354                     ;
                        LD DE,20162                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28386                     ;
                        LD DE,20194                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28418                     ;
                        LD DE,20226                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28450                     ;
                        LD DE,20258                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28482                     ;
                        LD DE,20290                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28514                     ;
                        LD DE,20322                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28546                     ;
                        LD DE,20354                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28578                     ;
                        LD DE,20386                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28610                     ;
                        LD DE,20418                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28642                     ;
                        LD DE,20450                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28674                     ;
                        LD DE,20482                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28706                     ;
                        LD DE,20514                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28738                     ;
                        LD DE,20546                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28770                     ;
                        LD DE,20578                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28802                     ;
                        LD DE,20610                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28834                     ;
                        LD DE,20642                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28930                     ;
                        LD DE,20738                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28962                     ;
                        LD DE,20770                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,28994                     ;
                        LD DE,20802                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29026                     ;
                        LD DE,20834                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29058                     ;
                        LD DE,20866                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,29090                     ;
                        LD DE,20898                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,29186                     ;
                        LD DE,20994                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29218                     ;
                        LD DE,21026                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29250                     ;
                        LD DE,21058                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29282                     ;
                        LD DE,21090                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29314                     ;
                        LD DE,21122                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29346                     ;
                        LD DE,21154                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29442                     ;
                        LD DE,21250                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29474                     ;
                        LD DE,21282                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29506                     ;
                        LD DE,21314                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29538                     ;
                        LD DE,21346                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29570                     ;
                        LD DE,21378                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29602                     ;
                        LD DE,21410                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29698                     ;
                        LD DE,21506                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29730                     ;
                        LD DE,21538                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29762                     ;
                        LD DE,21570                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29794                     ;
                        LD DE,21602                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29826                     ;
                        LD DE,21634                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29858                     ;
                        LD DE,21666                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29954                     ;
                        LD DE,21762                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,29986                     ;
                        LD DE,21794                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30018                     ;
                        LD DE,21826                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30050                     ;
                        LD DE,21858                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30082                     ;
                        LD DE,21890                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30114                     ;
                        LD DE,21922                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30210                     ;
                        LD DE,22018                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30242                     ;
                        LD DE,22050                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30274                     ;
                        LD DE,22082                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30306                     ;
                        LD DE,22114                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30338                     ;
                        LD DE,22146                     ;
                        LDIR                            ;

                        LD C,A                          ;
                        LD HL,30370                     ;
                        LD DE,22178                     ;
                        LDIR                            ;


                        LD C,A                          ;
                        LD HL,30466                     ;
                        LD DE,22274                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30498                     ;
                        LD DE,22306                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30530                     ;
                        LD DE,22338                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30562                     ;
                        LD DE,22370                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30594                     ;
                        LD DE,22402                     ;
                        LDIR                            ;
                        LD C,A                          ;
                        LD HL,30626                     ;
                        LD DE,22434                     ;
                        LDIR                            ;

                        LD A,(BUFFER_RETURN)            ; Get buffer return status
                        OR A                            ; CP 0                            ;
                        JR Z,SKIP_BUFFER_RETURN         ;
                        RET                             ;
SKIP_BUFFER_RETURN:


                        LD HL,GENERAL_COUNTER           ; Get general counter
                        INC (HL)                        ; Add 1 to general counter
                        LD A,(HL)                       ; Get general counter into A for testing
                        OR A                            ; Is it 0?
                        JR NZ,SKIP_TAKE_1_FROM_O2       ; If not then skip taking 1 from O2
                        LD HL,O2                        ; Point at O2
                        DEC (HL)                        ; Take 1 from O2
                        CALL UPDATE_METERS              ;

SKIP_TAKE_1_FROM_O2:
                        LD HL,BONUS_SELECT_COUNTER      ; Point to bonus select counter
                        INC (HL)                        ; Add 1 to bonus select counter
                        LD A,(HL)                       ; Get bonus select counter for testing
                        CP 20                           ; Compare with 20
                        JR C,SKIP_BONUS_SELECT_RESET    ; Are we greater than 20? If not then skip resetting bonus select counter
                        LD (HL),0                       ; Reset bonus select counter

SKIP_BONUS_SELECT_RESET:



                        JP MAIN_GAME_LOOP               ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHOOSE_BONUS:
                        LD A,(BONUS_SELECT_COUNTER)     ;

                        CP 7                            ;
                        JR Z,SETUP_O2_BONUS             ;
                        CP 6                            ;
                        JR Z,SETUP_H2O_BONUS            ;
                        CP 5                            ;
                        JR Z,SETUP_SHIELD_BONUS         ;
                        CP 4                            ;
                        JR Z,SETUP_1000_BONUS           ;
                        CP 3                            ;
                        JR Z,SETUP_LIFE_BONUS           ;
                        CP 2                            ;
                        JP Z,SETUP_POW_BONUS            ;
                        CP 1                            ;
                        JP Z,SETUP_ROCKET_BONUS         ;
                        RET                             ;


SETUP_O2_BONUS:
                        LD A,(O2)                       ; Get O2 meter
                        CP 5                            ; Reference 5
                        RET NC                          ; O2 is already at least 5
                        LD A,6                          ; A=6 to set bonus enable to O2
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,O2_BONUS                  ; Point to O2 bonus graphic data
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic
                        LD A,(O2_BONUS_COLOUR)          ; Bright magenta
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,1                          ; A=1 to set bonus rotation on
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;

SETUP_H2O_BONUS:
                        LD A,(H2O)                      ; Get H2O meter
                        CP 5                            ; Reference 5
                        RET NC                          ; H2O is already at least 5
                        LD A,5                          ; A=5 to set bonus enable to H2O
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,H2O_BONUS                 ; Point to H2O bonus graphic data
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic
                        LD A,(H2O_BONUS_COLOUR)         ; Bright cyan
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,1                          ; A=1 to set bonus rotation on
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;
SETUP_SHIELD_BONUS:
; Shield bonus

                        LD A,3                          ; A=3 to set bonus enable to shield
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,SHIELD_BONUS              ; Point to shield bonus graphic data
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic
                        LD A,(SHIELD_BONUS_COLOUR)      ; Bright red
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,0                          ; A=0 to set bonus rotation off
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;

SETUP_1000_BONUS:
; 1000 Bonus

                        LD A,1                          ; A=1 to set bonus shield
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,ONE_THOUSAND_BONUS        ; Point to One thousand bonus graphic data
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic
                        LD A,(THOUSAND_BONUS_COLOUR)    ; Bright white
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,1                          ; A=1 to set bonus rotation on
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;
SETUP_LIFE_BONUS:
; Lives bonus

                        LD A,(LIVES)                    ; Get lives status
                        CP 25                           ; Reference 8 lives
                        RET NC                          ; Jump setting up lives bonus if lives are already greater than 8
                        LD A,2                          ; A=2 to set bonus enable
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,LIFE_BONUS                ; Point to life bonus graphic
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic data
                        LD A,(LIFE_BONUS_COLOUR)        ; Bright magenta
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,1                          ; A=1 to set bonus rotation on
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;
SETUP_POW_BONUS:
; Pow bonus

                        LD A,(WAVE_COUNT)               ; Get wave count status
                        CP 3                            ; Reference level 3
                        RET C                           ; Jump Pow if level is below 3

                        LD A,(ALIEN_HEAD_ENABLED)       ; Get Alienhead status
                        OR A                            ; Is it 0 for disabled?
                        RET NZ                          ; If enabled then we need to skip Pow.

                        LD A,(PLAYER_MISSILE_SPREAD)    ; Get player missile spread status
                        OR A                            ; Is it 0?
                        RET NZ                          ; Jump Pow if on multi random rockets

                        LD A,4                          ; A=4 to set bonus enable
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,POW_BONUS                 ; Point to pow bonus graphic data
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic
                        LD A,(POW_BONUS_COLOUR)         ; Bright cyan
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,1                          ; A=1 to set bonus rotation on
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;

SETUP_ROCKET_BONUS:
; Multi player missile bonus

                        LD A,(WAVE_COUNT)               ; Get wave count status
                        CP 3                            ; Reference level 3
                        RET C                           ; Jump multi rockets if level is below 3
                        LD A,(PLAYER_MISSILE_SPREAD)    ; Get player missile spread status
                        OR A                            ; Is it 0?
                        RET NZ                          ; Jump multi rockets if already on multi random rockets
                        LD A,7                          ; A=7 to set bonus player multi missile enable
                        LD (BONUS_ENABLE),A             ; Enable bonus
                        LD HL,ROCKET_BONUS              ; Point to player multi missile bonus graphic data
                        LD (BONUS_GRAPHIC_POINTER),HL   ; Set Bonus graphic pointer to graphic
                        LD A,(ROCKET_BONUS_COLOUR)      ; Bright green
                        LD (BONUS_COLOUR+1),A           ; Set bonus icon colour
                        LD A,0                          ; A=0 to set bonus rotation off
                        LD (ROTATE_BONUS),A             ; Set bonus rotation status
                        RET                             ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Clear alien data
CLEAR_ALIEN_DATA:

                        LD HL,ALIEN_DATA1               ; Alien data start address
                        LD DE,ALIEN_DATA1+1             ; Alien data start second address
                        LD BC,15*29                     ; 15 aliens X 29 bytes
                        XOR A                           ; A=0 to reset all data
                        LD (HL),A                       ; Set first address with 0
                        LDIR                            ; Fill all 435 locations with 0
                        RET                             ; Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Move to next level
MOVE_TO_NEXT_LEVEL:

                        LD HL,WAVE_COUNT                ; Point to wave number
                        INC (HL)                        ; Move to next wave
                        LD A,(HL)                       ; Get wave number
                        CP 50                           ; Are we on wave 51?
                        JR NZ,SKIP_ENABLING_ALIEN_HEAD  ; Skip enabling Alien head if not
                        LD A,1                          ; A=1 to enable Alien head coming out
                        LD (ALIEN_HEAD_ENABLED),A       ; Initial alien head status
                        LD A,10                         ;
                        LD (ALIEN_HIT_COUNTER),A        ; Set Alien hit counter so alienhead can be hit 10 times before going home
                        LD A,71                         ;
                        LD (ALIEN_BACKGROUND_COLOUR),A  ; Set background colour for Alien head level
                        LD (THOUSAND_BONUS_COLOUR),A    ; Bright white on black 71
                        LD (ALIEN_COLLECTED_O2_COLOUR),A ; Bright cyan on black 69


                        LD A,66                         ;
                        LD (SHIELD_BONUS_COLOUR),A      ; Bright red on black 66
                        INC A                           ;
                        LD (O2_BONUS_COLOUR),A          ; Bright magenta on black 67
                        LD (LIFE_BONUS_COLOUR),A        ; Bright magenta on black 67
                        INC A                           ;
                        LD (ROCKET_BONUS_COLOUR),A      ; Bright green on black 68
                        INC A                           ;
                        LD (H2O_BONUS_COLOUR),A         ; Bright cyan on black 69
                        LD (POW_BONUS_COLOUR),A         ; Bright cyan on black 69
                        LD (PLAYER_COLOUR),A            ; Player colour cyan on black 69

                        JP SKIP_RESETTING_WAVE_TO_0     ; Skip resetting vave to 0

SKIP_ENABLING_ALIEN_HEAD:
                        CP 51                           ; Are we on wave 52?
                        JR NZ,SKIP_RESETTING_WAVE_TO_0  ; If not then skip resetting vave to 0

; Reset wave back to start
                        XOR A                           ; A=0
                        LD (HL),A                       ; Set wave to 0

SKIP_RESETTING_WAVE_TO_0:

                        CALL FADE_CLEAR_PLAY_AREA       ; Clear play area

                        LD BC,20000                     ; Set delay time
                        CALL DELAY                      ; Delay

                        LD A,(ALIEN_BACKGROUND_COLOUR)  ; Get background colour
                        LD (NEXT_LEVEL_MESSAGE+2),A     ; Set background colour for text

                        LD IX,NEXT_LEVEL_MESSAGE        ; Point to Next level message
                        CALL DISPLAY_STRING             ; Display Next level message
                        ; LD IX,NEXT_LEVEL_MESSAGE2       ; Point to Next level message2
                        ; CALL DISPLAY_STRING             ; Display Next level message
                        LD B,8                          ;
SCROLL_NEXT_LEVEL_LOOP:
                        PUSH BC                         ;
                        LD BC,5000                      ; Set delay time
                        CALL DELAY                      ; Delay


                        CALL SCROLL_BOX                 ;
                        POP BC                          ;
                        DJNZ SCROLL_NEXT_LEVEL_LOOP     ;


                        JP NEXT_WAVE                    ; Jump to next wave
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reset all alien missiles
RESET_ALIEN_MISSILES:
                        LD HL,ALIEN_DATA1+4             ; Move to alien missile data pointers
                        LD B,15                         ; Set number of aliens
NUMBER_OF_ALIENS_LOOP6:

                        LD (HL),0                       ; Set current alien missile status to off
                        LD DE,25                        ; Setup DE for addition of 28 bytes for next alien data block
                        ADD HL,DE                       ; Add 28 bytes for next alien data block

                        DJNZ NUMBER_OF_ALIENS_LOOP6     ; Loop back until all aliens are setup
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player explode
PLAYER_EXPLODE_GRAPHICS:

                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 7, 128;
                        defb 7, 224, 1, 128, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 15, 64, 29, 192;
                        defb 15, 240, 7, 96, 1, 192, 3, 128, 0, 0, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 3, 128, 26, 208, 31, 248, 15, 248, 29, 248;
                        defb 29, 248, 14, 252, 29, 216, 31, 240, 13, 192, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 3, 128, 26, 208, 31, 248, 15, 248, 29, 248;
                        defb 29, 248, 14, 252, 29, 216, 31, 240, 13, 192, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 7, 128, 63, 112, 59, 216, 29, 248, 126, 88;
                        defb 113, 252, 63, 216, 63, 232, 59, 240, 25, 240, 1, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 7, 128, 54, 200, 59, 220, 27, 220, 61, 252, 54, 248;
                        defb 57, 252, 31, 186, 30, 222, 61, 236, 63, 224, 25, 192, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 7, 192, 63, 184, 59, 236, 29, 248, 126, 172, 126, 214;
                        defb 126, 254, 113, 254, 63, 236, 63, 244, 59, 248, 25, 248, 1, 128, 0, 0;

                        defb 0, 0, 0, 0, 7, 128, 15, 204, 23, 222, 27, 254, 124, 238, 255, 89;
                        defb 254, 231, 237, 251, 183, 222, 254, 228, 123, 124, 121, 184, 48, 192, 0, 0;




                        defb 0, 0, 0, 0, 7, 128, 15, 204, 23, 222, 27, 254, 124, 238, 255, 89;
                        defb 254, 231, 237, 251, 183, 222, 254, 228, 123, 124, 121, 184, 48, 192, 0, 0;


                        defb 0, 0, 0, 0, 7, 192, 63, 184, 59, 236, 29, 248, 126, 172, 126, 214;
                        defb 126, 254, 113, 254, 63, 236, 63, 244, 59, 248, 25, 248, 1, 128, 0, 0;

                        defb 0, 0, 0, 0, 7, 128, 54, 200, 59, 220, 27, 220, 61, 252, 54, 248;
                        defb 57, 252, 31, 186, 30, 222, 61, 236, 63, 224, 25, 192, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 7, 128, 63, 112, 59, 216, 29, 248, 126, 88;
                        defb 113, 252, 63, 216, 63, 232, 59, 240, 25, 240, 1, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 3, 128, 26, 208, 31, 248, 15, 248, 29, 248;
                        defb 29, 248, 14, 252, 29, 216, 31, 240, 13, 192, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 3, 128, 26, 208, 31, 248, 15, 248, 29, 248;
                        defb 29, 248, 14, 252, 29, 216, 31, 240, 13, 192, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 0, 15, 64, 29, 192;
                        defb 15, 240, 7, 96, 1, 192, 3, 128, 0, 0, 0, 0, 0, 0, 0, 0;

                        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 7, 128;
                        defb 7, 224, 1, 128, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bonus graphics
ONE_THOUSAND_BONUS:
                        defb 3, 192, 12, 240, 19, 248, 47, 252, 127, 254, 91, 186, 149, 85, 213, 85;
                        defb 213, 85, 213, 85, 91, 186, 127, 254, 63, 244, 31, 200, 15, 48, 3, 192;

LIFE_BONUS:
                        defb 3, 192, 12, 240, 19, 248, 47, 252, 127, 254, 90, 34, 218, 239, 218, 239;
                        defb 218, 103, 218, 239, 90, 238, 74, 226, 63, 252, 31, 200, 15, 48, 3, 192;

SHIELD_BONUS:
                        defb 65, 130, 225, 135, 178, 77, 157, 185, 162, 197, 190, 253, 220, 123, 81, 26;
                        defb 108, 118, 46, 244, 54, 236, 23, 232, 27, 216, 13, 176, 6, 96, 3, 192;

POW_BONUS:
                        defb 3, 192, 12, 240, 19, 248, 47, 252, 255, 254, 27, 109, 85, 85, 85, 85;
                        defb 21, 85, 117, 85, 123, 187, 255, 254, 63, 244, 31, 200, 15, 48, 3, 192;

H2O_BONUS:
                        defb 3, 192, 12, 240, 19, 248, 47, 252, 127, 254, 91, 114, 218, 173, 195, 173;
                        defb 219, 109, 218, 237, 90, 50, 127, 254, 63, 244, 31, 200, 15, 48, 3, 192;

O2_BONUS:
                        defb 3, 192, 12, 240, 19, 248, 47, 252, 127, 254, 115, 206, 237, 183, 237, 247;
                        defb 237, 239, 237, 223, 115, 134, 127, 254, 63, 244, 31, 200, 15, 48, 3, 192;

ROCKET_BONUS:           defb 0, 0, 108, 124, 63, 242, 63, 254, 108, 124, 0, 0, 108, 124, 63, 242;
                        defb 63, 254, 108, 124, 0, 0, 108, 124, 63, 242, 63, 254, 108, 124, 0, 0;


;-----------------------------------------------------------------------------------------------

GAME_OVER_TEXT:
                        DEFB 10,7,71,1                  ; Line,Collumn,Colour,1=Double Height
                        ; DEFM "                  #"      ; String to display
                        DEFM " G A M E  O V E R #"      ; String to display
                        DEFB 255                        ; String end flag
;GAME_OVER_TEXT2:
;                        DEFB 13,7,71,0                 ; Line,Collumn,Colour,1=Double Height
;                       ; DEFM "                  #"      ; String to display
;                        DEFB 255                        ; String end flag

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Next level message
NEXT_LEVEL_MESSAGE:
                        DEFB 10,4,66,1                  ; Line,Collumn,Colour,1=Double Height
                        ;  DEFM "                  #"      ; String to display
                        DEFM "W A V E  C O M P L E T E#" ; String to display
                        DEFB 255                        ; String end flag
;NEXT_LEVEL_MESSAGE2:
;                        DEFB 13,7,71,0                 ; Line,Collumn,Colour,1=Double Height
;                        DEFM "                  #"      ; String to display
;                        DEFB 255                        ; String end flag

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Used to count number
DISPLAY_COUNTING_NUMBER:
                        DEFB 3,14,71,0                  ;
                        DEFM "000"                      ;
                        DEFB 255                        ;



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Colour sprite
COLOUR_SPRITE:
                        ; Get screen ATTR address
GET_HIRES_ATTR_ADDRESS:
                        LD A,(dispy+1)                  ; up/down       ; Look at the vertical first.
                        RRCA                            ;
                        RRCA                            ;
                        RRCA                            ;
                        AND 31                          ;
                        LD L,A                          ;
                        LD A,(dispx+1)                  ; get horizontal position.
                        RLCA                            ;
                        RLCA                            ;
                        LD C,A                          ;
                        AND 224                         ;
                        OR L                            ;
                        ADD A,3                         ;
                        LD L,A                          ;
                        LD A,C                          ;
                        AND 3                           ;
                        OR 120                          ; ATTR 1 LOCATION
                        ;      ADD A,112            ; attributes start at 112*256=28672.
                        LD H,A                          ;
                        ; RET                             ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SET_SPRITE_COLOUR:
                        LD D,0                          ; Set colour at SET_SPRITE_COLOUR+1
                        LD E,D                          ; Set colour into both registers to be pushed
                        LD (SET_SPA+1),SP               ;
                        ; INC HL                          ; Allign to buffer
                        ; INC HL                          ;
                        ; INC HL                          ;
                        LD SP,HL                        ; Set stack pointer

                        PUSH DE                         ; Push colour to buffer
                        PUSH DE                         ; Push colour to buffer
                        LD BC,32                        ; Setup BC for addition
                        ADD HL,BC                       ; Jump to next line
                        LD SP,HL                        ; Set colour into both registers to be pushed

                        PUSH DE                         ;
                        PUSH DE                         ;
                        LD BC,32                        ; Setup BC for addition
                        ADD HL,BC                       ; Jump to next line
                        LD SP,HL                        ; Set stack pointer

                        PUSH DE                         ; Push colour to buffer
                        PUSH DE                         ; Push colour to buffer

SET_SPA:                LD SP,00                        ; Reset stack

                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Display Hi Scores title
DISPLAY_HI_SCORES_TELETEXT_TITLE:

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0

                        LD IX,START_MESSAGEA2_0         ;
                        CALL DISPLAY_STRING             ;
                        LD IX,SBCFAX_SCORES_TITLE_0     ;
                        CALL DISPLAY_LARGE_TELETEXT_COMPRESSED_0 ; Display data
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

DISPLAY_START_NEWS:

                        CALL MEMORY_SWITCH_0            ; Switch to memory 0

                        LD IX,DISPLAY_INSTRUCTIONS_DATA1D_0;
                        CALL DISPLAY_STRING             ;
                        LD IX,DISPLAY_INSTRUCTIONS_DATA1E_0;
                        CALL DISPLAY_STRING             ;
                        RET                             ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set screen to colour in A
SET_SCREEN_COLOUR:
                        LD HL,22528                     ; Get ATTR address stored at 24676
                        LD D,H                          ; Place screen address into DE
                        LD E,L                          ;
                        INC DE                          ; Add 1 to DE
                        LD BC,767                       ; 767 ATTR addresses to fill with colour
                        LD (HL),A                       ; Set first address to what is stored in A
                        LDIR                            ; Fill all ATTR addresses
                        RET                             ; Return

; Clear screen and ATTR to black
;
; Used by the routines at #R25059, #R25315, #R26390, #R27959 and #R28545.
CLEAR_SCREEN:
                        LD HL,16384                     ; First screen address
                        LD DE,16385                     ; Second screen address
                        LD BC,6143                      ; 6143 bytes to clear screen
                        SUB A                           ; A=0
                        LD (HL),A                       ; Set first screen address to 0 to clear
                        LDIR                            ; Fill all screen to 0 to clear

                        RET                             ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Dim the screen
DIM_SCREEN:
                        LD B,7                          ;
DIM_SCREEN_LOOP1:
                        PUSH BC                         ;
                        LD BC,768                       ;
                        LD HL,22528                     ;
DIM_SCREEN_LOOP2:
                        LD A,(HL)                       ;
                        SUB 8                           ;
                        AND %00111111                   ;
                        LD (HL),A                       ;
                        INC HL                          ;
                        DEC BC                          ;
                        LD A,B                          ;
                        OR C                            ;
                        JR NZ,DIM_SCREEN_LOOP2          ;


                        ; LD BC,3000                      ; time for delay
                        ; CALL TEXT_DELAY                 ;


                        POP BC                          ;
                        DJNZ DIM_SCREEN_LOOP1           ;

                        LD BC,768                       ;
                        LD HL,22528                     ;

DIM_SCREEN_LOOP2B:
                        LD A,7                          ; 56                       ;

                        LD (HL),A                       ;

                        INC HL                          ;
                        DEC BC                          ;
                        LD A,B                          ;
                        OR C                            ;

                        JR NZ,DIM_SCREEN_LOOP2B         ;


                        RET                             ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COLOUR_NO_FUTURE_ON:
; Display No Future Teletext by colouring it bright white
                        LD A,74                         ;
                        CALL SET_NO_FUTURE_COLOUR       ;
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
COLOUR_NO_FUTURE_OFF:
; Display No Future text by colouring it bright white
                        LD A,0                          ;
                        CALL SET_NO_FUTURE_COLOUR       ;
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

SET_NO_FUTURE_COLOUR:
                        LD HL,22528+(17*32)+5           ;
                        LD B,22                         ;
SET_NO_FUTURE_COLOUR_LOOP:
                        LD (HL),A                       ;
                        LD DE,32                        ;
                        ADD HL,DE                       ;
                        LD (HL),A                       ;
                        OR A                            ;
                        SBC HL,DE                       ;
                        INC HL                          ;
                        DJNZ SET_NO_FUTURE_COLOUR_LOOP  ;
                        RET                             ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FLASH_NO_FUTURE_COUNTER:DEFB 0                          ; Counts and sets No Future title on or off

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Select J or K for control
FLASH_COUNTER:          DEFB 0                          ;
SELECT_JK:
                        EI                              ;

SELECT_JK_LOOP:
                        LD HL,FLASH_NO_FUTURE_COUNTER   ; FLASH_COUNTER1
                        INC (HL)                        ;
                        LD A,(HL)                       ;
                        CP 0                            ;
                        CALL Z,COLOUR_NO_FUTURE_ON      ;
                        CP 128                          ;
                        CALL Z,COLOUR_NO_FUTURE_OFF     ;


                        LD IX,DISPLAY_COUNTING_NUMBER   ;
                        CALL DISPLAY_STRING             ;

                        LD HL,DISPLAY_COUNTING_NUMBER+6 ;
                        LD A,(HL)                       ;
                        CP "0"                          ;
                        JR NZ,INC_NUMBER_3              ;
                        DEC HL                          ;
                        LD A,(HL)                       ;
                        CP "0"                          ;
                        JR NZ,INC_NUMBER_3              ;
                        DEC HL                          ;
                        LD A,(HL)                       ;
                        CP "2"                          ;
                        JR NZ,INC_NUMBER_3              ;
                        LD HL,DISPLAY_COUNTING_NUMBER+4 ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;
                        INC HL                          ;
                        LD (HL),48                      ;

                        JP SKIP_INC_NUMBER_3            ;
INC_NUMBER_3:
                        LD HL,DISPLAY_COUNTING_NUMBER+6 ;
                        CALL RND                        ;
                        CP 10                           ;
                        CALL C,INCREMENT_SCOREB         ;
SKIP_INC_NUMBER_3:

                        LD BC,700                       ;
FLASH_LOOP_1:
                        DEC BC                          ;
                        LD A,B                          ;
                        OR C                            ;
                        JR NZ,FLASH_LOOP_1              ;




                        LD BC,49150                     ; Reads the half row ENTER to H
                        IN A,(C)                        ; Get keys

                        BIT 1,A                         ; Is L pressed?
                        JR Z,SET_FULLER                 ; If so then jump to set control to Fuller

                        BIT 2,A                         ; Is K pressed?
                        JR Z,SET_KEYBOARD               ; If so then jump to set control to keyboard
                        BIT 3,A                         ; Is J pressed
                        JR NZ,SELECT_JK_LOOP            ; If not then jump back until J, K, or L is pressed

                        LD A,1                          ; A=1 for joystick control
                        LD (CONTROL),A                  ; Set control to Joystick
                        RET                             ; Return
SET_KEYBOARD:
                        XOR A                           ; A=0 for keyboard control
                        LD (CONTROL),A                  ; Set control to Keyboard
                        RET                             ; Return
SET_FULLER:
                        LD A,2                          ; A=2 for Fuller control
                        LD (CONTROL),A                  ; Set control to Keyboard
                        RET                             ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; POW all aliens when Pow bonus is collected
POW:
                        PUSH IX                         ;
                        PUSH DE                         ;
                        PUSH BC                         ;
                        LD IX,ALIEN_DATA1               ; Point to Alien data
                        LD B,15                         ; 15 aliens to check
CHECK_ALIEN_EXPLODING_LOOPB:

                        LD A,(IX+0)                     ; Get alien status
                        OR A                            ; CP 0                            ; Is alien disabled
                        JR Z,JUMP_TO_NEXT_ALIEN_EXPLODE_CHECKB ; If so, skip alien exploding

                        CP 244                          ; Is alien counting down from 254 (exploding)?
                        JR C,JUMP_TO_NEXT_ALIEN_EXPLODE_CHECKB ; Alien is not exploding if below 244 so no need to update explode dots

; Reset alien to explode
                        LD (IX+0),254                   ; Set alien to explode

                        LD (IX+3),0                     ; Set alien dropping counter disabled

                        CALL ADD_SCORE                  ; Add score

                        LD HL,ALIEN_HIT_COUNTER         ; Point to alien hit counter
                        LD A,(HL)                       ; Get alien hit counter
                        OR A                            ; 0?
                        JR Z,SKIP_TAKING_FROM_ALIEN_COUNTER; If already 0 then dont take any more
                        DEC (HL)                        ; Take 1 from alien hit counter
SKIP_TAKING_FROM_ALIEN_COUNTER:

; Setup alien explosion

                        LD D,(IX+25)                    ; Get alien up/down coordinate
                        LD E,(IX+26)                    ; Get alien left/right coordinate


                        LD (IX+7),D                     ; Setup alien exploding dots start coordinates
                        LD (IX+8),E                     ;
                        LD (IX+9),D                     ;
                        LD (IX+10),E                    ;
                        LD (IX+11),D                    ;
                        LD (IX+12),E                    ;
                        LD (IX+13),D                    ;
                        LD (IX+14),E                    ;
                        LD (IX+15),D                    ;
                        LD (IX+16),E                    ;
                        LD (IX+17),D                    ;
                        LD (IX+18),E                    ;
                        LD (IX+19),D                    ;
                        LD (IX+20),E                    ;
                        LD (IX+21),D                    ;
                        LD (IX+22),E                    ;
                        LD (IX+23),D                    ;
                        LD (IX+24),E                    ;



JUMP_TO_NEXT_ALIEN_EXPLODE_CHECKB:

                        LD A,120                        ; Black on light white
                        OUT (254),A                     ; Set border
                        LD (SET_COLOUR+1),A             ; Set colour
                        LD A,19                         ; Set colour lines
                        LD (SET_COLOUR_LINES+1),A       ; Set colour for lines

                        PUSH BC                         ;
                        CALL COLOUR_PLAY_AREA           ; Set play area to colour
                        POP BC                          ;

                        LD DE,29                        ; Setup DE for addition to add for next sprite data block
                        ADD IX,DE                       ; Move to next sprite data block
                        DJNZ CHECK_ALIEN_EXPLODING_LOOPB; Jump back to Pow all visible aliens
                        POP BC                          ;
                        POP DE                          ;
                        POP IX                          ;
                        LD A,0                          ; A=0 for black
                        OUT (254),A                     ; Set border to black
                        RET                             ; Return




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DOUBLE_HEIGHT_FLAG:     DEFB 0                          ; Double height flag 1=on
SAVE_COLLUMN_FOR_NEW_LINE:DEFB 0                        ; Stores collumn for next line start
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Slowly display string IX=string, begining 2 bytes=coordinates, next byte for colour, ends with 255
DISPLAY_STRING:
                        LD A,(IX+0)                     ; Get Row
                        LD D,A                          ; Store row
                        LD A,(IX+1)                     ; Get collumn
                        LD (SAVE_COLLUMN_FOR_NEW_LINE),A; Store collumn for next line
                        LD E,A                          ; Store collumn
                        LD A,(IX+2)                     ; Get colour
                        LD (TEXT_COLOUR+1),A            ; Store text colour
                        LD A,(IX+3)                     ; Get double height flag
                        LD (DOUBLE_HEIGHT_FLAG),A       ; Set double height flag

                        INC IX                          ; Move to text data
                        INC IX                          ;
                        INC IX                          ;
                        INC IX                          ;

DISPLAY_STRING2:        LD A,(IX+0)                     ; Get text character from current string location
                        CP 255                          ; End of string?
                        RET Z                           ; Exit string if 0 for end of string
                        CP 35                           ; Is character a #
                        JR NZ,NEXT_CHARACTER            ; If not then skip dropping down a line
                        INC D                           ; Move down 1 row
                        LD A,(SAVE_COLLUMN_FOR_NEW_LINE) ; Add 1 to collumn to move right
                        LD E,A                          ;
                        JP NEXT_CHARACTER2              ; Jump to delay and get next character
NEXT_CHARACTER:

                        CALL GET_TEXT_STATUS            ; Display character
NEXT_CHARACTER2:

                        INC IX                          ; Move to next text data

                        JR DISPLAY_STRING2              ; Jump back to finish string

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Delay. Called with delay in BC
DELAY:
                        PUSH BC                         ;
DELAY_LOOP:
                        DEC BC                          ;
                        LD A,B                          ; Check loop counter for 0
                        OR C                            ;
                        JR Z,NEXT_DELAY                 ;
                        JP DELAY_LOOP                   ; Jump back to continue with delay

NEXT_DELAY:
                        POP BC                          ;
DELAY_LOOP2:
                        DEC BC                          ;
                        LD A,B                          ; Check loop counter for 0
                        OR C                            ;
                        RET Z                           ;
                        JP DELAY_LOOP2                  ; Jump back to continue with delay



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Get text status   A=Character
GET_TEXT_STATUS:
                        PUSH AF                         ; Save character
                        LD A,(DOUBLE_HEIGHT_FLAG)       ; Get double height flag
                        OR A                            ; CP 0                            ;
                        JR NZ,SKIP_SINGLE_HEIGHT        ;

                        POP AF                          ;
                        SUB 32                          ;
                        CALL PRINT_8X8                  ; Display 8X8 character if Double height flag =0
                        JP SKIP_DOUBLE_HEIGHT           ;
SKIP_SINGLE_HEIGHT:
                        POP AF                          ;
                        SUB 32                          ;
                        CALL PRINT_16X8                 ; Display 16X8 character if Double height flag =1

SKIP_DOUBLE_HEIGHT:
                        LD A,E                          ; Place collumn into A for testing
                        CP 32                           ; Are we at collumn 32?
                        JR NZ,SKIP_MOVING_TEXT_DOWN     ; If not at last collumn then skip moving text down
                        INC D                           ; Move text down
                        LD E,0                          ;
SKIP_MOVING_TEXT_DOWN:

                        INC E                           ; Move text coordinate to next collumn
                        RET                             ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Service routine to call display 8X8 character
PRINT_8X8:
                        ; CALL MENU_SOUND                 ;

                        PUSH DE                         ; Save text coordinates
                        PUSH AF                         ; Save current text data
                        CALL DISPLAY_8X8                ; Display 8X8 character. A=graphic number
                        POP AF                          ; Restore current text data
                        POP DE                          ; Restore text coordinates
                        RET                             ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PRINT_16X8:
                        ; CALL MENU_SOUND                 ;

                        PUSH DE                         ; Save text coordinates
                        PUSH AF                         ; Save current text data
                        CALL DOUBLEHEIGHT_TEXT          ; Display 16X8 character. A=graphic number
                        POP AF                          ; Restore current text data
                        POP DE                          ; Restore text coordinates
                        RET                             ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Get font character pointer into HL. A=character number
GET_FONT:
                        LD H,0                          ; Reset HL to 0
                        LD L,A                          ; L=A 8x8 character
                        ADD HL,HL                       ; Multiple HL by 8 to get to the correct block of 8 bytes
                        ADD HL,HL                       ;
                        ADD HL,HL                       ;
                        LD DE,FONT                      ; Get start of font data pointer into DE
                        ADD HL,DE                       ; Add the font data pointer to the pointer
                        RET                             ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display 8X8 character A=character, DE=coordinate
DISPLAY_8X8:
                        DI                              ;
                        PUSH DE                         ; Save coordinates
                        PUSH AF                         ; Save character
                        CALL GETATTR                    ; Get ATTR address and colour current address
                        POP AF                          ; Restore character
                        CALL GET_FONT                   ; Get font character pointer into HL. A=character number
                        POP DE                          ; Restore coordinates
                        CALL GET8X8_SCREEN_ADDRESS      ; Get screen address into DE. Called with DE=coordinates

;DE=SCREEN ADDRESS
;A=CHARACTER
;HL=CHARACTER DATA

                        LD B,8                          ; 7 lines make character
DISPLAY_8X8_LOOP:
                        PUSH BC                         ;


                        LD A,(HL)                       ; Get first line of character data

                        LD (DE),A                       ; Place to screen
                        INC HL                          ; Move to next character data
                        INC D                           ; Move down to next screen address
                        POP BC                          ;
                        DJNZ DISPLAY_8X8_LOOP           ;

                        RET                             ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display double height text A=character, DE=coordinate
DOUBLEHEIGHT_TEXT:
                        PUSH DE                         ; Save coordinates
                        PUSH AF                         ; Save character
                        CALL GETATTR                    ; Get ATTR address and colour current address
                        POP AF                          ; Restore character
                        CALL GET_FONT                   ; Get font character pointer into HL. A=character number
                        POP DE                          ; Restore coordinates
                        PUSH DE                         ;
                        CALL GET8X8_SCREEN_ADDRESS      ; Get screen address into DE. Called with DE=coordinates

                        LD B,4                          ;
DOUBLEHEIGHT_TEXT_LOOP:
                        LD A,(HL)                       ; Get first line of character data
                        LD (DE),A                       ; Place to screen
                        INC D                           ; Move down to next screen address
                        LD (DE),A                       ; Place second line of character to screen
                        INC HL                          ; Move to next character data
                        INC D                           ; Move down to next screen address
                        DJNZ DOUBLEHEIGHT_TEXT_LOOP     ;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        POP DE                          ; Restore coordinates
                        INC D                           ;
                        PUSH HL                         ;
                        PUSH DE                         ; Save character
                        CALL GETATTR                    ; Get ATTR address and colour current address
                        POP DE                          ; Restore character
                        POP HL                          ;
                        CALL GET8X8_SCREEN_ADDRESS      ; Get screen address into DE. Called with DE=coordinates

                        LD B,4                          ;
DOUBLEHEIGHT_TEXT_LOOPB:


                        LD A,(HL)                       ; Get first line of character data
                        LD (DE),A                       ; Place to screen
                        INC D                           ; Move down to next screen address
                        LD (DE),A                       ; Place second line of character to screen
                        INC HL                          ; Move to next character data
                        INC D                           ; Move down to next screen address
                        DJNZ DOUBLEHEIGHT_TEXT_LOOPB    ;

                        RET                             ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Get screen address into DE. Called with DE=coordinates
GET8X8_SCREEN_ADDRESS:
                        LD A,D                          ; Get line coordinate into A
                        AND 24                          ; Only interested in 24 lines
                        OR 64                           ; Start from start screen address
                        LD B,A                          ; Place line address into B
                        SUB A                           ; A=0
                        SRL D                           ;
                        RRA                             ;
                        SRL D                           ;
                        RRA                             ;
                        SRL D                           ;
                        RRA                             ;
                        OR E                            ;
                        LD E,A                          ; DE=screen address
                        LD D,B                          ;
                        RET                             ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Get ATTR address of coordinates DE and place into DE and colour address with TEXT_COLOUR+1
GETATTR:
                        SUB A                           ; A=0
                        SRL D                           ;
                        RRA                             ;
                        SRL D                           ;
                        RRA                             ;
                        SRL D                           ;
                        RRA                             ;
                        OR E                            ;
                        LD E,A                          ;
                        LD A,D                          ;
                        OR 88                           ;
                        LD D,A                          ;
TEXT_COLOUR:            LD A,0                          ;
                        LD (DE),A                       ;
                        INC E                           ;
                        LD A,(DE)                       ;
                        LD (TEMP1),A                    ;
                        LD A,248                        ;
                        LD (DE),A                       ;
                        LD A,(TEMP1)                    ;
                        PUSH AF                         ;
                        ; LD BC,300                       ; time for delay
                        ; CALL TEXT_DELAY                 ;

                        POP AF                          ;
                        LD (DE),A                       ;
                        DEC E                           ;
                        RET                             ; Return
TEMP1:                  DEFB 0                          ; Store current screen attr

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
CHECK_HI_SCORE:
C35441:                 LD HL,HI_SCORE_VALUE+6          ; Address of last Hi score scratch area
                        LD DE,SCORE                     ; Data location for main score
                        LD B,7                          ; 7 digits to check
C35449:
                        LD A,(DE)                       ; A=current score test digit
                        SUB 8                           ; Take 8 from digit
                        LD (HL),A                       ; Set current digit of Hi score scratch area
                        INC DE                          ; Move to nextbyte of score
                        DEC HL                          ; Move one to the left of Hu score scratch area
                        DJNZ C35449                     ; Jump back until all 7 digits are done
                        CALL UPDATE_HIGH_SCORE_RANK     ;
                        LD A,(HI_SCORE_RANK)            ; Get Hi score rank
                        CP 1                            ; Is Hi score rank 1?
                        RET Z                           ; Return if so. Score is not enough for table

; Continue to update Hi score table
                        CALL UPDATE_HIGH_SCORE_RANK     ;

                        CALL HI_SCORE_ENTRY             ;



; Sort Hi scores
                        LD A,(HI_SCORE_RANK)            ;
                        DEC A                           ;
                        LD B,A                          ;
; Take reading for upper Hi score in table and copy it to lower Hi score
                        LD HL,HI_SCORE_5_READING        ;
                        LD DE,HI_SCORE_4_READING        ;
C35483:
                        PUSH HL                         ; Save Hi score 5 reading location pointer
                        LD C,7                          ; 7 figures to copy
C35486:
                        LD A,(DE)                       ; Get first digit of upper table reading
                        LD (HL),A                       ; Place it into lower table reading
                        INC HL                          ; Go to next lower table reading digit
                        INC DE                          ; Go to next upper table reading digit
                        DEC C                           ; Reduce digit counter by 1
                        JR NZ,C35486                    ; Jump back until all 7 figures are copied

                        POP HL                          ; Restore lower Hi score reading location
                        LD DE,10                        ; Setup DE for a subtraction of 10
                        SBC HL,DE                       ; Take 10 memory address locations from Hi score 5 reading location so HL now points at Hi score 4 reading location
                        PUSH HL                         ; Save Hi score 4 reading location pointer
                        SBC HL,DE                       ; Take 10 memory address locations from Hi score 4 reading location so HL now points at Hi score 3 reading location
                        EX DE,HL                        ; DE=Hi score 3 reading location pointer
                        POP HL                          ; HL=Hi score 4 reading location pointer
                        DJNZ C35483                     ; Jump back until all required Hi score table readings are moved down
; Take name for upper Hi score in table and copy it to lower Hi score in table
                        LD A,(HI_SCORE_RANK)            ;
                        DEC A                           ;
                        LD B,A                          ;
                        LD HL,HI_SCORE_5_DATA           ;
                        LD DE,HI_SCORE_4_DATA           ;
C35517:
                        PUSH HL                         ; Save Hi score 5 name location pointer
                        LD C,12                         ; 12 letters to copy
C35520:
                        LD A,(DE)                       ; Get first letter of upper table
                        LD (HL),A                       ; Place it into lower table
                        INC HL                          ; Go to next lower table reading letter
                        INC DE                          ; Go to next upper table reading letter
                        DEC C                           ; Reduce text counter by 1
                        JR NZ,C35520                    ; Jump back until all 12 letters are copied

                        POP HL                          ; Restore lower Hi score reading location
                        LD DE,15                        ; Setup DE for a subtraction of 15
                        SBC HL,DE                       ; Take 10 memory address locations from lower Hi score reading location so HL now points at upper Hi score reading location
                        PUSH HL                         ; Save upper Hi score reading location pointer
                        SBC HL,DE                       ; Take 10 memory address locations from upper Hi score reading location so HL now points at next lower Hi score reading location
                        EX DE,HL                        ; DE=Lower Hi score reading location pointer
                        POP HL                          ; HL=Upper Hi score reading location pointer
                        DJNZ C35517                     ; Jump back until all required Hi score table names are moved down
                        LD HL,HI_SCORE_TITLE            ; HL=first location for "HI SCORE" text
                        LD DE,10                        ; Setup DE for subtraction so we step back 10 locations from the "HI SCORE" text location to get to right table location
                        LD A,(HI_SCORE_RANK)            ;
                        DEC A                           ;
                        LD B,A                          ;
; Select table location for new score
C35551:
                        SBC HL,DE                       ; Take 10 from table score reading location
                        DJNZ C35551                     ; Jump back until we are in the correct table location

; Place score into correct area of table
                        LD DE,SCORE                     ; HI_SCORE_VALUE   ; Get Hi score from game that just finished
                        LD B,7                          ; 7 digits for score
; HL=Hi score table location to place latest score
C35560:
                        LD A,(DE)                       ; A=current score digit
                        LD (HL),A                       ; Place score digit into table
                        INC HL                          ; Goto next Hi score table location
                        INC DE                          ; Go to next latest score digit
                        DJNZ C35560                     ; Jump back until all digits are done

                        ; Update new name in Hi score table
                        LD HL,HI_SCORE_1_READING        ; Point HL at top score reading in Hi score table
                        LD DE,15                        ; Setup DE for subtraction
                        LD A,(HI_SCORE_RANK)            ;
                        DEC A                           ;
                        LD B,A                          ;
C35577:
                        SBC HL,DE                       ; Take 15 from Hi score table name pointer to go to begining of previous name
                        DJNZ C35577                     ; Jump back until we are at the correct table location
                        LD DE,HI_SCORE_ENTRY_BAR_TEXT_DATA_HB ; Point DE at memory location of new name entry
                        LD B,12                         ; 12 characters for name to copy

C35586:
                        LD A,(DE)                       ; Get first letter of new name
                        LD (HL),A                       ; Place letter in table
                        INC HL                          ; Go to next table location
                        INC DE                          ; Go to next new name text location
                        DJNZ C35586                     ; Jump back until all new name text locations are added to the table

                        CALL FADE_CLEAR_PLAY_AREA       ;

                        ;  CALL DISPLAY_HI_SCORE_TABLE     ; Display Hi Score table
                        RET                             ; Return


UPDATE_HIGH_SCORE_RANK:
                        LD HL,HI_SCORE_5_READING        ; Hi score 5 memory location
                        LD C,0                          ; Reset Hi score table counter
C35601:
                        LD DE,SCORE                     ; HI_SCORE_VALUE ; Score memory location
  PUSH HL       ; Save current HI_SCORE_*_READING (*1=5)
  CALL C35628   ; Compare the score to current score check in Hi score table
  LD A,C        ; A=score table counter for next compare
  CP 6          ; All 5 scores in the table are checked?
  JR Z,C35621   ; Jump to set ranking if so
  LD DE,9       ; Setup DE for subtraction
  POP HL        ; Restore HI_SCORE_5_READING
  SBC HL,DE     ; Take 9 from the Hi score reading table to go to next upper ranking
  JR C35601     ; Jump back until all 5 scores in the table are checked
C35621:
 LD A,C   ; A=score table counter
  LD (HI_SCORE_RANK),A  ;Set rank
  POP HL        ;
  RET           ; Return


; Routine at 35628
;
; Used by the routine at #R35596.
C35628:
 LD B,0        ;
  INC C         ;
  PUSH BC       ;
C35632:
 LD A,(DE); Get byte of HI_SCORE_VALUE
  CP (HL)       ; Compare with HI_SCORE_5_READING
  JR Z,C35640   ;
  JR NC,C35659  ;
  JR C,C35650   ;
C35640:
 INC B         ;
  LD A,B        ;
  CP 7          ; Are we at digit 7?
  JR Z,C35650   ;
  INC HL        ; Go to next Hi score 5 reading digit
  INC DE        ; Go to next Hi score value digit
  JR C35632     ; Jump back until all 7 digits are completed
C35650:
 LD A,1   ;
  POP BC        ;
  POP HL        ;
  LD HL,C35621   ;
  PUSH HL       ;
  RET           ; Return
C35659:
 LD A,0        ;
  POP BC        ;
  RET           ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display Hi Score table for editing
; Display A to Z string
DISPLAY_HI_SCORE_TABLE2:
                       ;CALL 3503     ; Call ROM routine to clear the screen
                       ;CALL CLEAR_SCREEN_BLACK_HB    ; Clear screen to blue border with blue paper
                       LD IX,HI_SCORE_ENTRY_CACHE_HB   ; Address of text data for Hi score A to Z string
                       LD B,22       ; 22 blocks of text data
C35669:                PUSH BC       ; Save loop
                       CALL DISPLAY_TEXT_HB    ; Display text
                       INC IX        ; Go to next address of text data
                       POP BC        ; Restore loop
                       DJNZ C35669    ; Jump back until all text is displayed
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display Hi score title

                        LD IX,DONE_GRAPHIC
                         CALL DISPLAY_LARGE_GRAPHIC

                        LD IX,SELECT_GRAPHIC
                        CALL DISPLAY_LARGE_GRAPHIC

                        LD IX,DELETE_GRAPHIC
                       CALL DISPLAY_LARGE_GRAPHIC

HI_SCORE_TABLE_TITLE:
                      CALL DISPLAY_HI_SCORES_TELETEXT_TITLE



                        LD HL,23172
                       LD (HL),2

                        LD HL,23175
                       LD (HL),2
                         LD HL,23190
                       LD (HL),2
                       INC HL
                        LD (HL),2
                        INC HL
                        LD (HL),2
                        INC HL
                        LD (HL),2

                        LD HL,23269-64

                        LD B,4
DELETE_COLOUR_LOOP:
                        LD (HL),2
                        INC HL
                         DJNZ DELETE_COLOUR_LOOP
                        LD HL,23288-66
                        LD B,4
SELECT_COLOUR_LOOP:
                        LD (HL),2
                        INC HL
                         DJNZ SELECT_COLOUR_LOOP

                       RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



DELETE_GRAPHIC:
DEFW 18432+2048+128+32+5 ;Screen location
DEFB 1,4; Rows, columns
DEFB 0, 0, 0, 0, 124, 2, 0, 0, 70, 2, 1, 0, 66, 114, 115, 156
DEFB 66, 138, 137, 34, 66, 250, 249, 62, 70, 130, 129, 32, 124, 122, 121, 158

SELECT_GRAPHIC:
DEFW 18432+2048+128+32+22 ;Screen location
DEFB 1,4; Rows, columns
DEFB 0, 0, 0, 0, 56, 4, 0, 0, 68, 4, 0, 16, 64, 228, 227, 184
DEFB 57, 21, 20, 16, 5, 245, 244, 16, 69, 5, 4, 16, 56, 244, 243, 152

DONE_GRAPHIC:
DEFW 18432+1024+512+256+256+64+64+22 ;Screen location
DEFB 1,4; Rows, columns
DEFB 0, 0, 0, 0, 124, 0, 0, 0, 70, 0, 0, 0, 66, 115, 199, 0
DEFB 66, 138, 40, 128, 66, 138, 47, 128, 70, 138, 40, 0, 124, 114, 39, 128


HI_SCORE_ENTRY_CURSOR:  DEFB 0
; Letter selection routine for Hi Score entry

;Reset entry cache to "____________________"
HI_SCORE_ENTRY:
                        EI

                         CALL FADE_CLEAR_PLAY_AREA
                          LD A,7
                        LD (ALIEN_BACKGROUND_COLOUR),A  ; Set background colour at background colour routine to black

                        CALL COLOUR_FULL_PLAY_AREA

                      LD HL,HI_SCORE_ENTRY_CURSOR
                      LD (HL),0
; Display the table
                      CALL DISPLAY_HI_SCORE_TABLE2  ; Display the table
; Clear text entry
C35679:
                       LD HL,HI_SCORE_ENTRY_BAR_HB   ; location of Hi score entry bar data
                       INC HL        ; Jump 2 addresses for the string
                       INC HL        ;
                       LD B,12       ; 12 characters
C35686:
                       LD (HL),32 ; Set current address to Code for " "
                       INC HL ; Go to next address
                       DJNZ C35686 ; Jump back until all "_" are loded into the database

; Display the text entry bar
                       LD IX,HI_SCORE_ENTRY_BAR_HB ; Location of Hi score entry bar data
                       CALL DISPLAY_TEXT_HB ; Display text

; Begining of text entry
                       LD DE,HI_SCORE_ENTRY_BAR_TEXT_DATA_HB ; location of Hi score entry bar data
                       LD HL,23074 ; First ATTR address of Hi score A-Z selection bar
C35704:
                       PUSH DE ; Save location of Hi score table bar data
                       PUSH HL ; Save first ATTR address

;Check for a key being pressed . Do not continue until a key is not pressed
C35706:                 EI
;Quick delay
                        LD B,4        ; B=7 to set delay loop for short delay
C35863Y:
                        HALT          ; Small delay
                        DJNZ C35863Y   ; Jump back until delay loop is finished
                        HALT          ; Small delay

                       CALL 654      ; Call ROM routine to check for any key being pressed
                       LD A,E        ; Key is now in A
                       CP 255        ; Is a key pressed?
                       JR NZ,C35706  ; If a key is pressed then jump back until a key is not pressed

;A key has not been pressed
                       POP HL        ; Restore ATTR address
; Display the text select cursor and check for a key being pressed
                       CALL CHECK_FOR_HI_SCORE_KEY_ENTRY_HB    ; Get keys for Hi score entry table and move

                                       ; A-Z selection if Q or W is pressed

                       POP DE        ; Restore location of Hi score table bar data

                       CP 33         ; Is Enter key being pressed?
                       RET Z         ; Return if so

                       CP 35         ; Is "0" being pressed for delete?
                       JR NZ,C35748  ; If not then jump the delete routine

                      ; LD A,E        ; A=Shift buttons being pressed


                       ;CP 75         ; Is Symbol Shift key being pressed?
                       ;JR Z,C35704   ; If so then jump back for next key check

;Key 0 was pressed so delete a character from Hi score entry
                             LD A,(HI_SCORE_ENTRY_CURSOR)  ;Get Hi score entry cursor locator
                             OR A;OR A;CP 0                         ;Are we at  Hi score entry location 0?
                       JR Z,C35704     ; If so, jump back for next key check. We cannot take any more letters

                       DEC A                         ;Take one to cursor
                       LD (HI_SCORE_ENTRY_CURSOR),A  ;Update Hi score entry cursor locator

                       LD A,32       ; Code for " "
                       DEC DE        ; Take 1 from Hi score A-Z entry table location
                       LD (DE),A     ; Set current address to Code for "_"
                       PUSH DE       ; Save Hi score A-Z entry table location
                       PUSH HL       ; Save ATTR address
                       LD IX,HI_SCORE_ENTRY_BAR_HB   ; Location of Hi score entry bar data
                       CALL DISPLAY_TEXT_HB    ;Display updated Hi score entry bar data
                       POP HL        ; Restore ATTR address
                       POP DE        ; Restore Hi score A-Z entry table location
                       JR C35704     ; Jump back for next key check

;Add character to Hi score entry bar
C35748:
                       LD A,(HI_SCORE_ENTRY_CURSOR)  ;Get Hi score entry cursor locator
                       CP 12                         ;Are we at  Hi score entry location 13
                       JR NC,C35704     ; If so, jump back for next key check. We cannot add any more letters


                       INC A                         ;Add one to cursor
                       LD (HI_SCORE_ENTRY_CURSOR),A  ;Update Hi score entry cursor locator

                       PUSH HL       ; Save ATTR address
                       PUSH DE       ; Save Hi score A-Z entry table location
                       LD DE,23074   ; First ATTR address of Hi score A-Z selection bar
                       SBC HL,DE     ; Subtract current ATTR address from firstATTR address of Hi score A-Z selection bar
                       EX DE,HL      ; DE="AtoZ" string index
                       LD HL,T35924+1; Address of Hi score A to Z text "ABCDEFGHIJKLMNOPQRSTUVWXYZ ."
                       ADD HL,DE     ; Add first ATTR address of Hi score A-Z selection bar to "AtoZ" string index
                       LD A,(HL)     ; A=selected character
                       POP DE        ; Restore Hi score A-Z entry bar location
                       LD (DE),A     ; Add character to entry
                       PUSH DE       ; Save Hi score A-Z entry bar location
                       LD IX,HI_SCORE_ENTRY_BAR_HB ; Location of Hi score entry bar data
                       CALL DISPLAY_TEXT_HB ; Display updated Hi score entry bar data
                       POP DE        ; Restore Hi score A-Z entry bar location
                       INC DE        ; Move to next character in Hi score entry bar
                       POP HL        ; Restore ATTR address
                       LD A,E        ; A=low byte of current entry bar location



                       CP 87         ; Are we at the end of the entry bar?
                       RET Z         ; Return if so
                       JP C35704     ; Jump back for next key check

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Loop to display screen of text
; IX=data location  first 2 bytes=print coordinate
DISPLAY_TEXT_HB:
                       LD D,(IX+0)   ; D=first byte of IX for row number
                       CALL GET_DISPLAY_LOCATION_HB    ; HL=screen address
                       LD E,(IX+1)   ; E=collumn
                       LD A,E        ; A=collumn
                       ADD A,L       ; Add screen address to A
                       LD L,A        ; L now=screen address including collumn
                       INC IX        ; Increment IX 2 addresses for string data location
                       INC IX        ;
DISPLAY_TEXT_LOOP_HP:
                       LD A,(IX+0)   ; Coordinates done now for the text data
                       CP 255        ; Does data=255?
                       RET Z         ; If so then return from this routine
                       PUSH HL       ; Save screen address
                       INC IX        ; Go to next data address
                       LD H,0        ;
                       SUB 32        ; Take 32 from text data
                       LD L,A        ; L=result
                       ADD HL,HL     ; Text character location pointer X 2
                       ADD HL,HL     ; Text character location pointer X 4
                       ADD HL,HL     ; Text character location pointer X 8
                       LD DE,FONT-0  ;15616   ; Set DE up for addition of 15616 (15616=FONT)
                       ADD HL,DE     ; Add 15616 to Text character location pointer
                       EX DE,HL      ; Swap Text character location pointer and location of first character in character set
                       POP HL        ; Restore original screen address

                       CALL DISPLAY_SINGLE_TEXT_CHARACTER_HB    ; Display a text character
                       INC HL        ; Go to next screen address
                       JR DISPLAY_TEXT_LOOP_HP ; Jump back to continue until data=255
                       RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display a text character
DISPLAY_SINGLE_TEXT_CHARACTER_HB:
                       PUSH HL       ; Save screen address
                       LD B,8        ; B=8 lines to draw for text character
C35828:
                       LD A,(DE)     ; A=graphic data (one pixel line)
                       LD (HL),A     ; Place the data to the screen address in HL
                       INC H         ; Go to next screen address for next line of graphic
                       INC DE        ; Go to next graphic data
                       DJNZ C35828    ; Jump back until all lines are completed
                       POP HL        ; Restore original screen address to reset back for next character if required
                       RET           ; Return

; Get screen address into HL
GET_DISPLAY_LOCATION_HB:
                        LD A,D        ; D=collumn
                        AND 24        ;
                        LD H,A        ; H=screen address low byte
                        LD A,D        ;
                        AND 7         ;
                        SLA A         ; AX2
                        SLA A         ; Ax4
                        SLA A         ; Ax8
                        SLA A         ; Ax16
                        SLA A         ; Ax32
                        LD L,A        ; L=result of addition (Number of screen bytes to add to HL)
                        LD DE,16384   ; DE=first byte of screen address
                        ADD HL,DE     ; Add screen address to addition result so HL=screen address
                        RET           ; Return


CHECK_FOR_HI_SCORE_KEY_ENTRY_HB:
; Get keys for Hi score entry table

;Display text selection cursor
                        LD (HL),112    ; Set current A-Z ATTR location to black ink on yellow paper
;Quick delay
                        LD B,4        ; B=4 to set delay loop for short delay

C35863:
                        HALT          ; Small delay
                        DJNZ C35863   ; Jump back until delay loop is finished
                        HALT          ; Small delay

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        PUSH HL       ; Save current ATTR A-Z screen address
C35868:
; Chance the high score table colours

;A quick delay
                        LD B,4        ; B=7 to set delay loop for short delay

C35863B:
                        HALT          ; Small delay
                        DJNZ C35863B   ; Jump back until delay loop is finished
                        HALT          ; Small delay

;Check for a key being pressed and do not do anything until a key is pressed
                        CALL 654      ; Call ROM routine to check for any key being pressed
                        LD A,E        ; A=Key
                        CP 255        ; No key being pressed?
                        JR Z,C35868   ; If not then jump back until a key is pressed

;A key is pressed so check to see if any relevant key is pressed
                        POP HL        ; Restore current ATTR A-Z screen address
                        CP 37         ; "Q" key pressed?
                        JR Z,MOVE_HI_SCORE_ATOZ_SELECTION_LEFT   ;
                        CP 29         ; "W" key pressed?
                        JR Z,MOVE_HI_SCORE_ATOZ_SELECTION_RIGHT    ;
                        CP " "         ; "SPACE" key pressed?
                        RET Z         ; Return if so
                        CP 35         ; "0" key pressed?
                        RET Z         ; Return if so
                        CP 33         ; "ENTER" key pressed?
                        RET Z         ; Return if so

                        JP CHECK_FOR_HI_SCORE_KEY_ENTRY_HB      ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MOVE_HI_SCORE_ATOZ_SELECTION_RIGHT:

                        LD A,L        ;
                        LD (HL),7     ; Display black paper/white ink at current letter selection location to clear selection

                        CP 61         ; Are we at the far right of the selection?
                        JR NZ,C35906  ; If not then skip the next wrap around to the begining of selection
                        LD HL,23073   ; HL=ATTR loaction for start of A-Z selection. Wrap around to the begining of selection
C35906:
                        INC L         ; Add one to selection address to move selection cursor right
                        JP CHECK_FOR_HI_SCORE_KEY_ENTRY_HB      ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
MOVE_HI_SCORE_ATOZ_SELECTION_LEFT:
                        LD A,L        ;
                        LD (HL),7     ; Display black paper/white ink at current letter selection location to clear selection
                        CP 34         ; Are we at the far left of the selection?
                        JR NZ,C35919  ; If not then skip the next wrap around to the end of selection
                        LD HL,23102   ; HL=ATTR loaction for end of A-Z selection. Wrap around to the end of selection
C35919:
                        DEC L         ; Take one to selection address to move selection cursor left
                        JP CHECK_FOR_HI_SCORE_KEY_ENTRY_HB      ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Hi score table
HI_SCORE_ENTRY_CACHE_HB: DEFB 17 ;Row 17 for A-Z text
                         DEFB 2 ;Collumn 2 for A-Z text

; Hi score A to Z text "ABCDEFGHIJKLMNOPQRSTUVWXYZ ."
T35924:                  DEFM "ABCDEFGHIJKLMNOPQRSTUVWXYZ "
                         DEFB 46 ;"."
                         DEFB 255 ; End of text flag

; Hi score table text data
HI_SCORE_TABLE_TEXT_DATA_HB:
                         DEFB 8 ;Row 7 for first name in table
                         DEFB 7 ;Collumn 7 for first name in table

HI_SCORE_1_DATA:              ;;;;;;;;;;;;;;
                         DEFM "HELANA      " ;Hi score 1 string
                         DEFB 255 ; End of text flag

                         DEFB 10 ;Row 9 for second name in table
                         DEFB 7 ;Collumn 7 for second name in table

HI_SCORE_2_DATA:              ;;;;;;;;;;;;;;
                         DEFM "ISABELLA    " ;Hi score 2 string
                         DEFB 255 ; End of text flag

                         DEFB 12 ;Row 11 for third name in table
                         DEFB 7 ;Collumn 7 for third name in table

HI_SCORE_3_DATA:              ;;;;;;;;;;;;;;
                         DEFM "STEVE       " ;Hi score 3 string
                         DEFB 255 ; End of text flag

                         DEFB 14 ;Row 13 for forth name in table
                         DEFB 7 ;Collumn 7 for forth name in table

HI_SCORE_4_DATA:              ;;;;;;;;;;;;;;
                         DEFM "RICH        " ;Hi score 4 string
                         DEFB 255 ; End of text flag

                         DEFB 16  ;Row 15 for forth name in table
                         DEFB 7  ;Collumn 7 for forth name in table

HI_SCORE_5_DATA:              ;;;;;;;;;;;;;;
                         DEFM "TOD         " ;Hi score 5 string
                         DEFB 255 ; End of text flag


                         DEFB 8    ;Row 7 for forth name in table
                         DEFB 21  ;Collumn 21 for forth name in table
HI_SCORE_1_READING:
                         DEFM "0001000" ; Hi score 1
                         DEFB 255

                         DEFB 10   ;Row 9 for forth name in table
                         DEFB 21  ;Collumn 21 for forth name in table
HI_SCORE_2_READING:
                         DEFM "0000900" ; Hi score 2
                         DEFB 255 ; End of text flag

                         DEFB 12    ;Row 11 for forth name in table
                         DEFB 21   ;Collumn 21 for forth name in table
HI_SCORE_3_READING:
                         DEFM "0000800" ; Hi score 3
                         DEFB 255 ; End of text flag

                         DEFB 14   ;Row 13 for forth name in table
                         DEFB 21  ;Collumn 21 for forth name in table
HI_SCORE_4_READING:
                         DEFM "0000030" ; Hi score 4
                         DEFB 255 ; End of text flag

                         DEFB 16   ;Row 15 for forth name in table
                         DEFB 21  ;Collumn 21 for forth name in table
HI_SCORE_5_READING:
                         DEFM "0000020" ; Hi score 5
                         DEFB 255 ; End of text flag


                         DEFB 21   ;Row 14 for forth name in table
                         DEFB 20   ;Collumn 7 for forth name in table
HI_SCORE_TITLE:
                         DEFM "          " ; Hi Score text
                         DEFB 255 ; End of text flag


                         DEFB 8
                         DEFB 3

                         DEFM "1"
                         DEFB 255

                         DEFB 10
                         DEFB 3

                         DEFM "2"
                         DEFB 255

                         DEFB 12
                         DEFB 3

                         DEFM "3"
                         DEFB 255

                         DEFB 14
                         DEFB 3

                         DEFM "4"
                         DEFB 255

                         DEFB 16
                         DEFB 3

                         DEFM "5"
                         DEFB 255

                         DEFB 20
                         DEFB 3

                         DEFM "Q< W> " ; Hi score keys text "LEFT"
                         DEFB 255 ; End of text flag

                         DEFB 21
                         DEFB 2

                         DEFM "       " ; Hi score keys text "W-RIGHT"
                         DEFB 255 ; End of text flag

                         DEFB 21
                         DEFB 3

                         DEFM "0" ; Hi score keys text "0-DELETE"
                         DEFB 255 ; End of text flag

                         DEFB 20
                         DEFB 16

                         DEFM "ENTER" ; Hi score keys text "ENTER-END"
                         DEFB 255 ; End of text flag

                         DEFB 21
                         DEFB 12

                         DEFM "SPACE KEY" ; DEFM "S SHIFT-SELCT"
                         DEFB 255 ; End of text flag

HI_SCORE_ENTRY_BAR_HB:
                         DEFB 18
                         DEFB 10

HI_SCORE_ENTRY_BAR_TEXT_DATA_HB:
                         DEFM "123456789022" ; Hi score entry bar data
                         DEFB 255 ; End of text flag

DEFB 255

DEFB 255

; Message at 36186
HI_SCORE_VALUE:          DEFM "0099999"  ; Last digit is address 36192


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Set play area to 19 text lines and dark yellow on black
COLOUR_FULL_PLAY_AREA:

                         LD A,19 ; 19 lines to colour
                         LD (SET_COLOUR_LINES+1),A
                         LD A,(ALIEN_BACKGROUND_COLOUR)
                         LD (SET_COLOUR+1),A
                         CALL COLOUR_PLAY_AREA

                         RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Colour play area A=colour
COLOUR_PLAY_AREA:
SET_COLOUR:            LD A,0        ; A=0 for colour black

                       LD HL,22626   ; First address of ATTR

SET_COLOUR_LINES:            LD B,19  ; 19 lines
CLEAR_ATTR_LOOP:
               PUSH BC
               LD B,28  ; 28 collumns
CLEAR_ATTR_LOOP1:
               LD (HL),A
               INC HL
               DJNZ CLEAR_ATTR_LOOP1
               INC HL
               INC HL
               INC HL
               INC HL
               POP BC
               DJNZ CLEAR_ATTR_LOOP

                XOR A
c28851:         LD BC,254     ; Border channel
                OUT (C),A     ;
                LD (23624),A  ;  Set border to A and set border system varable to A

                RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Clear ATTR1 Called with A=colour
COLOUR_ATTR1:
                LD HL,ATTR1
                LD DE,ATTR1+1
                LD BC,768
                LD (HL),A
                LDIR
                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Unused
s36224 DEFS 76

; Display Hi score table
;
DISPLAY_HI_SCORE_TABLE:
c36300:
                      LD A,71                    ; A=71 for bright white on black
                      LD (ALIEN_BACKGROUND_COLOUR),A ; Set background colour
                      CALL COLOUR_FULL_PLAY_AREA ;Clear screen and setup colours for table
                     ; CALL HI_SCORE_TABLE_TITLE ; Display Hi score table title
                      CALL DISPLAY_HI_SCORES_TELETEXT_TITLE


                      LD IX,HI_SCORE_TABLE_TEXT_DATA_HB   ; Hi score table text data location
                      LD B,16       ; We only want the 5 Hi Score table data
C36312:
                      PUSH BC       ; Save loop counter
                      CALL DISPLAY_TEXT_HB    ; Display text
                      INC IX        ; Go to next memory location
                      POP BC        ; Restore loop counter
                      DJNZ C36312    ; Jump back until all data is completed
                    ;  CALL DISPLAY_START_NEWS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                      LD B,4      ; Time for Hi score table to be displayed
C36326:
                      PUSH BC         ;


                    ;  CALL CHANGE_HI_SCORE_SCREEN_COLOUR ;Change the table colours so they flash



                      POP BC
                      DJNZ C36326    ;

                      RET           ; Return

HI_SCORE_RANK:        DEFB 1


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RESET_PLAYER_FIRE:
; Set all player fire to off.
                XOR A
                LD HL,PLAYER_FIRE_MISSILE_COUNT ; Point to player rocket data
                LD (HL),A               ; Set initial address to 0
                LD (FIRE_ON),A          ; Reset Fire
                LD BC,29                 ; 30 rocket data bytes to reset
                LD DE,PLAYER_FIRE_MISSILE_COUNT+1 ; Point to player rocket data
                LDIR                    ; Clear data
                RET                     ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AY38910 Sound called with HL=Sound data
; Routine at 61348
ayctrl                  EQU 65533                       ; Control
aydata                  EQU 49149                       ; Data
; Sound called with HL=Sound data
GENERAL_SOUND:

                        ld d,0                          ; start with register 0.
w8912a:
                        ld a,(hl)                       ; value to write.
                        cp 255                          ; Is data 255?
                        call NZ,outer                   ; If not then change value
                        inc hl                          ;
                        inc d                           ;
                        ld a,d                          ;
                        cp 15                           ;
                        jp nz,w8912a                    ; repeat until done.
                        ret                             ;


outer                   ld bc,ayctrl                    ; select control port
                        out (c),d                       ; send specified value
                        ld bc,aydata                    ; select data port
                        out (c),a                       ; send specified value
                        ret                             ;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reset sound
RESET_ALL_SOUNDS:
                        LD HL,RESET_SOUND_DATA          ; Data for sound reset
                        CALL GENERAL_SOUND              ; Reset sound
                        RET                             ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RESET_SOUND_DATA:       DB 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FIRE_SOUND_DATA:
                        ; Pitch
                        ; Fine| |Course                ;BACKGROUND NOISE ON A
                        DB 0,0                      ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 100,0                          ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 200,0                          ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C

MISSILE_PITCH:          DB 3                           ; (6) 5-bit (0-31) Noise pitch N:(13)

                        ;        Noise
                        ;   Tone|  |
                        ; N/A CBACBA         Mixer A=noise B=noise C=tone
                        ;   ||||||||
                          ;               Noise
                        ;         Tone|  |
                        ;   Not used CBACBA
                        ;          ||||||||
                         DB %00110001                         ; %00011111                    ; (7) 8-bit Mixer
                        DB %00010000                            ;   (8)
                        DB %00100000                           ;  (9)
                  ;Use Envelope|||||
               DB %00010000                            ; (10) 4-bit (0-15) channel A volume
                DB %00010000                            ; (11) 4-bit (0-15) channel B volume
               DB %00010000                          ; (12)4-bit (0-15) channel C volume

                DB 1                          ; (13) 8-bit (0-255) Envelope fine duration
              DB 5                          ; (14) 8-bit (0-255) Envelope course duration

               DB 9                           ; (15) 4-bit (0-15)  Envelope shape







TORPEDO_SOUND:

                        ; Fine| |Course
                        DB 0,0                          ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 200,10                       ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 0,0                          ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C


                        DB 25                           ; (6) 5-bit (0-31) Noise pitch

                        ;        Noise
                        ;   Tone|  |
                        ;   Not used CBACBA
                        ;    ||||||||
                        DB %00010001                    ; (7) 8-bit Mixer

;                Volume
                        ;  ||||
;    Use Envelope|||||
                        DB %00010000                    ; (8) 4-bit (0-15) channel A volume
                        DB %00000010                    ; (9) 4-bit (0-15) channel B volume
                        DB %00000000                    ; (10)4-bit (0-15) channel C volume

                        DB 1                            ; (11) 8-bit (0-255) Envelope fine duration
                        DB 40                           ; (12) 8-bit (0-255) Envelope course duration

                        ; Not used
                        ;             ||||
                        DB 9                            ; (13) 4-bit (0-15)  Envelope shape
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Make noise
NOISE_SOUND:
                        LD HL,ALIEN_EXPLODING_SOUND
                        CALL GENERAL_SOUND
                         RET
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Exploding alien sound data
ALIEN_EXPLODING_SOUND:
                        ; Pitch
                        ; Fine| |Course
                        DB 0,0                          ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 0,15                         ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 0,0                          ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C

                        ;    Not used
                        ;        |||
                        DB 31                           ; (6) 5-bit (0-31) Noise pitch

                        ;        Noise
                        ;   Tone|  |
                        ;   Not used CBACBA
                        ;    ||||||||
                        DB 1                            ; (7) 8-bit Mixer

;                Volume
                        ;  ||||
;    Use Envelope|||||
                        DB %00010000                    ; (8) 4-bit (0-15) channel A volume
                        DB %00010000                    ; (9) 4-bit (0-15) channel B volume
                        DB %00000000                    ; (10)4-bit (0-15) channel C volume

                        DB 1                            ; (11) 8-bit (0-255) Envelope fine duration
                        DB 50                           ; (12) 8-bit (0-255) Envelope course duration

                        ; Not used
                        ;             ||||
                        DB 9                            ; (13) 4-bit (0-15)  Envelope shape


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Background noise data
BACKGROUND_SOUND_DATA:
                        ; Pitch
                        ; Fine| |Course
                        DB 255,255                      ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 255,255                      ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 255,255                      ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C

                        ;    Not used
                        ;        |||

                        DB 19                           ; (6) 5-bit (0-31) Noise pitch

                        ;        Noise
                        ;   Tone|  |
                        ;   Not used CBACBA
                        ;    ||||||||
sndmix:                 DB %00001111                    ; (7) 8-bit Mixer

;                Volume
                        ;  ||||
;    Use Envelope|||||
sndvola:                DB 255                          ; (8) 4-bit (0-15) channel A volume
sndvolb:                DB 255                          ; (9) 4-bit (0-15) channel B volume
sndvolc:                DB 4                            ; (10)4-bit (0-15) channel C volume

envfine:                DB 255                          ; (11) 8-bit (0-255) Envelope fine duration
envcourse:              DB 255                          ; (12) 8-bit (0-255) Envelope course duration

                        ; Not used
                        ;             ||||
envshape:               DB 255                          ; (13) 4-bit (0-15)  Envelope shape

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Alarm sound data
                        ; Pitch
                        ; Fine| |Course
ALARM_SOUND_DATA:
                        DB 255,1                        ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 255,255                      ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 255,255                      ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C

                        ;    Not used
                        ;        |||
                        DB 8                            ; (6) 5-bit (0-31) Noise pitch

                        ;        Noise
                        ;   Tone|  |
                        ;   Not used CBACBA
                        ;    ||||||||
                        DB %00001000                    ; (7) 8-bit Mixer

;                Volume
                        ;  ||||
;                  Use Envelope|||||
                        DB %00010000                    ; (8) 4-bit (0-15) channel A volume
                        DB 0                            ; (9) 4-bit (0-15) channel B volume
                        DB 0                            ; (10)4-bit (0-15) channel C volume

                        DB %11111111                    ; (11) 8-bit (0-255) Envelope fine duration
                        DB %00001111                    ; (12) 8-bit (0-255) Envelope course duration

                        ; Not used
                        ;             ||||
                        DB %00001001                    ; (13) 4-bit (0-15)  Envelope shape

; Make torpedo sound
GET_BONUS_SOUND:

                        ; Pitch
                        ; Fine| |Course                ;BACKGROUND NOISE ON A
                        DB 0,0                      ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 100,0                          ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 200,0                          ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C

                        DB 3                           ; (6) 5-bit (0-31) Noise pitch N:(13)

                        ;        Noise
                        ;   Tone|  |
                        ; N/A CBACBA         Mixer A=noise B=noise C=tone
                        ;   ||||||||
                          ;               Noise
                        ;         Tone|  |
                        ;   Not used CBACBA
                        ;          ||||||||
                         DB %00110001                         ; %00011111                    ; (7) 8-bit Mixer
                      ;  DB %00010000                            ;   (8)
                       ; DB %00100000                           ;  (9)
                  ;Use Envelope|||||
                DB %00010000                            ; (10) 4-bit (0-15) channel A volume
                DB %00010000                            ; (11) 4-bit (0-15) channel B volume
                DB %00010000                          ; (12)4-bit (0-15) channel C volume

                DB 1                          ; (13) 8-bit (0-255) Envelope fine duration
              DB 30                          ; (14) 8-bit (0-255) Envelope course duration

               DB 9                           ; (15) 4-bit (0-15)  Envelope shape













; 0      \__________     single decay then off

; 1      /|_________     single attack then off

; 8      \|\|\|\|\|\     repeated decay

; 9      \__________     single decay then off

; 10      \/\/\/\/\/\     repeated decay-attack

;          _________
; 11      \|              single decay then hold

; 12      /|/|/|/|/|/     repeated attack
;         __________
; 13      /               single attack then hold

; 14      /\/\/\/\/\/     repeated attack-decay

; 15      /|_________     single attack then off

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Tracker sound data
                        ; Pitch
                        ; Fine| |Course
TRACKER_SOUND_DATA:
                        DB 0,220                        ; (0) 8 bit 0-255 (1) 4 bit 0 to 15 tone registers, channel A
                        DB 0,220                        ; (2) 8 bit 0-255 (3) 4 bit 0 to 15 tone registers, channel B
                        DB 255,255                      ; (4) 8 bit 0-255 (5) 4 bit 0 to 15 tone registers, channel C

                        ;    Not used
                        ;        |||
                        DB 1                            ; (6) 5-bit (0-31) Noise pitch

                        ;        Noise
                        ;   Tone|  |
                        ;   Not used CBACBA
                        ;    ||||||||
                        DB %00010000                    ; (7) 8-bit Mixer

;                Volume
                        ;  ||||
;    Use Envelope|||||
                        DB 255                          ; (8) 4-bit (0-15) channel A volume
                        DB %00010000                    ; (9) 4-bit (0-15) channel B volume
                        DB 255                          ; (10)4-bit (0-15) channel C volume

                        DB %01111111                    ; (11) 8-bit (0-255) Envelope fine duration
                        DB %00001111                    ; (12) 8-bit (0-255) Envelope course duration

                        ; Not used
                        ;             ||||
                        DB 1                            ; (13) 4-bit (0-15)  Envelope shape

; 0      \__________     single decay then off

; 1      /|_________     single attack then off

; 8      \|\|\|\|\|\     repeated decay

; 9      \__________     single decay then off

; 10      \/\/\/\/\/\     repeated decay-attack

;           _________
; 11      \|              single decay then hold

; 12      /|/|/|/|/|/     repeated attack
;         __________
; 13     /               single attack then hold

; 14      /\/\/\/\/\/     repeated attack-decay

; 15      /|_________     single attack then off


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FONT:
;43 CHARACTERS SET
CHARSET:
                DEFB 0,0,0,0,0,0,0,0          ; Space
                DEFB 4,4,4,4,4,0,4,0          ;!
                DEFB 10,10,10,0,0,0,0,0       ;"
                DEFB 6,9,8,28,8,8,31,0        ;£
                DEFB 14,21,20,14,5,21,14,0    ;$
                DEFB 24,25,2,4,8,19,3,0       ;%
                DEFB 8,20,20,8,21,18,13,0     ;&
                DEFB 4,4,4,0,0,0,0,0          ;'
                DEFB 2,4,8,8,8,4,2,0          ;(
                DEFB 8,4,2,2,2,4,8,0          ;)
                DEFB 4,21,14,4,14,21,4,0      ;*
                DEFB 0,4,4,31,4,4,0,0         ;+
                DEFB 0,0,0,0,4,4,8,0          ;,
                DEFB 0,0,0,14,0,0,0,0         ;-
                DEFB 0,0,0,0,0,0,32,0          ;.
                DEFB 0,1,2,4,8,16,0           ;/

NUMBER0:
                DEFB 0,4,10,17,17,17,10,4    ;0
                DEFB 0,4,12,4,4,4,4,14       ;1
                DEFB 0,14,17,1,6,8,16,31     ;2
                DEFB 0,31,1,2,6,1,17,14      ;3
                DEFB 0,2,6,10,18,31,2,2      ;4
                DEFB 0,31,16,30,1,1,17,14    ;5
                DEFB 0,6,8,16,30,17,17,14    ;6
                DEFB 0,31,1,2,4,8,8,8        ;7
                DEFB 0,14,17,17,14,17,17,14  ;8
                DEFB 0,14,17,17,15,1,2,12    ;9
SPECIALCHARS:
                DEFB 0,0,0,0,4,0,4,0         ;:
                DEFB 0,0,0,4,0,4,4,8         ;;
                DEFB 0,2,4,8,16,8,4,2        ;<
                DEFB 0,0,0,31,0,31,0,0       ;=
                DEFB 0,8,4,2,1,2,4,8         ;>
                DEFB 0,14,17,18,4,4,0,4      ;?
                DEFB 0,14,17,23,21,23,16,14  ;@

LETTERS:
                DEFB 0,4,10,17,17,31,17,17       ;A
                DEFB 0,30,17,17,30,17,17,30      ;B
                DEFB 0,14,17,16,16,16,17,14      ;C
                DEFB 0,30,17,17,17,17,17,30      ;D
                DEFB 0,31,16,16,30,16,16,31      ;E
                DEFB 0,31,16,16,30,16,16,16      ;F
                DEFB 0,14,17,16,16,19,17,15      ;G
                DEFB 0,17,17,17,31,17,17,17      ;H
                DEFB 0,14,4,4,4,4,4,14           ;I
                DEFB 0,1,1,1,1,1,17,14           ;J
                DEFB 0,17,18,20,24,20,18,17      ;K
                DEFB 0,16,16,16,16,16,16,31      ;L
                DEFB 0,17,27,21,21,17,17,17      ;M
                DEFB 0,17,17,25,21,19,17,17      ;N
                DEFB 0,14,17,17,17,17,17,14      ;O
                DEFB 0,30,17,17,30,16,16,16      ;P
                DEFB 0,14,17,17,17,21,18,13      ;Q
                DEFB 0,30,17,17,30,20,18,17      ;R
                DEFB 0,14,17,16,14,1,17,14       ;S
                DEFB 0,31,4,4,4,4,4,4            ;T
                DEFB 0,17,17,17,17,17,17,14      ;U
                DEFB 0,17,17,17,10,10,4,4        ;V
                DEFB 0,17,17,17,21,21,21,10      ;W
                DEFB 0,17,17,10,4,10,17,17       ;X
                DEFB 0,17,17,10,4,4,4,4          ;Y
                DEFB 0,31,1,2,4,8,16,31          ;Z

                DEFB 0,0,4,8,31,8,4,0
                DEFB 0,16,16,16,22,1,2,4
                DEFB 7,0,4,2,31,2,4,0
                DEFB 0,0,4,14,21,4,4,0
                DEFB 0,10,10,31,10,31,10,10
                DEFB 0,0,0,0,31,0,0,0

                DEFB 0,0,0,14,1,15,17,15       ;a
                DEFB 0,16,16,30,17,17,17,30    ;b
                DEFB 0,0,0,15,16,16,16,15      ;c
                DEFB 0,1,1,15,17,17,17,15      ;d
                DEFB 0,0,0,14,17,31,16,14      ;e
                DEFB 0,2,4,4,14,4,4,4          ;f
                DEFB 0,0,0,15,17,17,15,1       ;g
                DEFB 14,16,16,30,17,17,17,17   ;h
                DEFB 0,4,0,12,4,4,4,14         ;i
                DEFB 0,4,0,4,4,4,4,4           ;j
                DEFB 8,8,8,9,10,12,10,9        ;k
                DEFB 0,12,4,4,4,4,4,14         ;l
                DEFB 0,0,0,26,21,21,21,21      ;m
                DEFB 0,0,0,30,17,17,17,17      ;n
                DEFB 0,0,0,14,17,17,17,14      ;o
                DEFB 0,0,0,30,17,17,30,16      ;p
                DEFB 16,0,0,15,17,17,15,1      ;q
                DEFB 1,0,0,11,12,8,8,8         ;r
                DEFB 0,0,0,14,16,14,1,30       ;s
                DEFB 0,4,4,14,4,4,4,2          ;t
                DEFB 0,0,0,17,17,17,17,15      ;u
                DEFB 0,0,0,17,17,10,10,4       ;v
                DEFB 0,0,0,17,17,21,21,10      ;w
                DEFB 0,0,0,17,10,4,10,17       ;x
                DEFB 0,0,0,17,17,17,15,1       ;y
                DEFB 15,0,0,31,2,4,8,31        ;z


; Large head missile counters
HEAD_FIRE_MISSILE_COUNT:

                       DEFB 0,0,0 ;Fire missile 1. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 2. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 3. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 4. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 5. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 6. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 7. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 8. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 9. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 10. Enabled 0,1, Up/Down, Left/right
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player missile counters
PLAYER_FIRE_MISSILE_COUNT:

                       DEFB 0,0,0 ;Fire missile 1. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 2. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 3. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 4. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 5. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 6. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 7. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 8. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 9. Enabled 0,1, Up/Down, Left/right
                       DEFB 0,0,0 ;Fire missile 10. Enabled 0,1, Up/Down, Left/right
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Player missile graphic
PLAYER_MISSILE_GRAPHIC1:

                        defb 0, 0, 16, 16, 16, 16, 16, 16, 0, 0, 16, 16, 16, 16, 16, 16
                        defb 0, 0, 16, 16, 16, 16, 16, 16, 0, 0, 16, 16, 16, 16, 0, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Player missile graphic
PLAYER_MISSILE_GRAPHIC2:
                        defb 0, 0, 24, 24, 16, 8, 24, 24, 24, 24, 8, 16, 24, 24, 24, 24
                        defb 24, 24, 16, 8, 24, 24, 24, 24, 8, 16, 24, 24, 24, 24, 0, 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Player missile graphic
PLAYER_MISSILE_GRAPHIC3:
                        defb 0, 0, 26, 88, 50, 76, 56, 28, 26, 88, 8, 16, 26, 88, 58, 92
                        defb 57, 156, 48, 12, 25, 152, 25, 152, 8, 16, 29, 184, 29, 184, 0, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;Alien missile graphic
ALIEN_MISSILE_GRAPHIC:
                       defb 0, 0, 0, 0, 8, 16, 8, 16, 28, 56, 28, 56, 28, 56, 8, 16
                       defb 20, 40, 28, 56, 20, 40, 20, 40, 28, 56, 0, 0, 0, 0, 0, 0

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
PORTAL_GRAPHIC_A1:
                        DEFW SCREEN1+110      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns

        defb 0, 7, 224, 0, 0, 56, 28, 0, 0, 195, 195, 0, 1, 28, 56, 128, 2, 96, 6, 64, 4, 128, 1, 32, 9, 0, 0, 144, 18, 0, 0, 72
        defb 36, 0, 0, 36, 40, 0, 0, 20, 72, 0, 0, 18, 80, 0, 0, 10, 80, 0, 0, 10, 80, 0, 0, 10, 144, 0, 0, 9, 160, 0, 0, 5
        defb 160, 0, 0, 5, 144, 0, 0, 9, 80, 0, 0, 10, 80, 0, 0, 10, 80, 0, 0, 10, 72, 0, 0, 18, 40, 0, 0, 20, 36, 0, 0, 36
        defb 18, 0, 0, 72, 9, 0, 0, 144, 4, 128, 1, 32, 2, 96, 6, 64, 1, 28, 56, 128, 0, 195, 195, 0, 0, 56, 28, 0, 0, 7, 224, 0

PORTAL_GRAPHIC_A2:
                    DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 192, 0, 0, 28, 56, 0, 0, 97, 134, 0, 0, 142, 113, 0, 1, 48, 12, 128, 2, 64, 2, 64
        defb 4, 128, 1, 32, 9, 0, 0, 144, 10, 0, 0, 80, 18, 0, 0, 72, 20, 0, 0, 40, 20, 0, 0, 40, 20, 0, 0, 40, 36, 0, 0, 36
        defb 36, 0, 0, 36, 20, 0, 0, 40, 20, 0, 0, 40, 20, 0, 0, 40, 18, 0, 0, 72, 10, 0, 0, 80, 9, 0, 0, 144, 4, 128, 1, 32
        defb 2, 64, 2, 64, 1, 48, 12, 128, 0, 142, 113, 0, 0, 97, 134, 0, 0, 28, 56, 0, 0, 3, 192, 0, 0, 0, 0, 0, 0, 0, 0, 0

PORTAL_GRAPHIC_A3:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 0, 0, 14, 112, 0, 0, 48, 12, 0, 0, 71, 226, 0
        defb 0, 152, 25, 0, 1, 32, 4, 128, 2, 64, 2, 64, 2, 128, 1, 64, 4, 128, 1, 32, 5, 0, 0, 160, 5, 0, 0, 160, 5, 0, 0, 160
        defb 5, 0, 0, 160, 5, 0, 0, 160, 5, 0, 0, 160, 4, 128, 1, 32, 2, 128, 1, 64, 2, 64, 2, 64, 1, 32, 4, 128, 0, 152, 25, 0
        defb 0, 71, 226, 0, 0, 48, 12, 0, 0, 14, 112, 0, 0, 1, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0

PORTAL_GRAPHIC_A4:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 128, 0, 0, 6, 96, 0, 0, 8, 16, 0, 0, 9, 144, 0, 0, 18, 72, 0
        defb 0, 18, 72, 0, 0, 9, 144, 0, 0, 8, 16, 0, 0, 6, 96, 0, 0, 1, 128, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
        defb 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Portal open animation graphics
PORTAL_GRAPHIC_B1:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 0, 112, 14, 0, 1, 135, 225, 128, 2, 56, 28, 64, 4, 195, 195, 32, 9, 28, 56, 144, 18, 96, 6, 72, 36, 128, 1, 36, 73, 0, 0, 146
        defb 82, 0, 0, 74, 148, 0, 0, 41, 164, 0, 0, 37, 168, 0, 0, 21, 168, 0, 0, 21, 40, 0, 0, 20, 72, 0, 0, 18, 80, 0, 0, 10
        defb 80, 0, 0, 10, 72, 0, 0, 18, 40, 0, 0, 20, 168, 0, 0, 21, 168, 0, 0, 21, 164, 0, 0, 37, 148, 0, 0, 41, 82, 0, 0, 74
        defb 73, 0, 0, 146, 36, 128, 1, 36, 18, 96, 6, 72, 9, 28, 56, 144, 4, 195, 195, 32, 2, 56, 28, 64, 1, 135, 225, 128, 0, 112, 14, 0

PORTAL_GRAPHIC_B2:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 3, 15, 240, 192, 4, 112, 14, 32, 9, 135, 225, 144, 18, 56, 28, 72, 36, 195, 195, 36, 73, 28, 56, 146, 146, 96, 6, 73, 164, 128, 1, 37
        defb 41, 0, 0, 148, 74, 0, 0, 82, 82, 0, 0, 74, 84, 0, 0, 42, 84, 0, 0, 42, 148, 0, 0, 41, 164, 0, 0, 37, 168, 0, 0, 21
        defb 168, 0, 0, 21, 164, 0, 0, 37, 148, 0, 0, 41, 84, 0, 0, 42, 84, 0, 0, 42, 82, 0, 0, 74, 74, 0, 0, 82, 41, 0, 0, 148
        defb 164, 128, 1, 37, 146, 96, 6, 73, 73, 28, 56, 146, 36, 195, 195, 36, 18, 56, 28, 72, 9, 135, 225, 144, 4, 112, 14, 32, 3, 15, 240, 192

PORTAL_GRAPHIC_B3:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 8, 224, 7, 16, 19, 15, 240, 200, 36, 112, 14, 36, 73, 135, 225, 146, 146, 56, 28, 73, 36, 195, 195, 36, 73, 28, 56, 146, 82, 96, 6, 74
        defb 148, 0, 0, 41, 165, 0, 0, 165, 169, 0, 0, 149, 170, 0, 0, 85, 42, 0, 0, 84, 74, 0, 0, 82, 82, 0, 0, 74, 84, 0, 0, 42
        defb 84, 0, 0, 42, 82, 0, 0, 74, 74, 0, 0, 82, 42, 0, 0, 84, 170, 0, 0, 85, 169, 0, 0, 149, 165, 0, 0, 165, 148, 0, 0, 41
        defb 82, 96, 6, 74, 73, 28, 56, 146, 36, 195, 195, 36, 146, 56, 28, 73, 73, 135, 225, 146, 36, 112, 14, 36, 19, 15, 240, 200, 8, 224, 7, 16

PORTAL_GRAPHIC_B4:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
        defb 38, 31, 248, 100, 72, 224, 7, 18, 147, 15, 240, 201, 36, 112, 14, 36, 73, 135, 225, 146, 146, 56, 28, 73, 164, 195, 195, 37, 41, 28, 56, 148
        defb 74, 0, 0, 82, 82, 0, 0, 74, 84, 0, 0, 42, 85, 0, 0, 170, 149, 0, 0, 169, 165, 0, 0, 165, 169, 0, 0, 149, 170, 0, 0, 85
        defb 170, 0, 0, 85, 169, 0, 0, 149, 165, 0, 0, 165, 149, 0, 0, 169, 85, 0, 0, 170, 84, 0, 0, 42, 82, 0, 0, 74, 74, 0, 0, 82
        defb 41, 28, 56, 148, 164, 195, 195, 37, 146, 56, 28, 73, 73, 135, 225, 146, 36, 112, 14, 36, 147, 15, 240, 201, 72, 224, 7, 18, 38, 31, 248, 100

PORTAL_GRAPHIC_B5:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
      defb 145, 192, 3, 137, 38, 31, 248, 100, 72, 224, 7, 18, 147, 15, 240, 201, 36, 112, 14, 36, 73, 135, 225, 146, 82, 56, 28, 74, 148, 192, 3, 41
      defb 165, 0, 0, 165, 169, 0, 0, 149, 170, 0, 0, 85, 42, 0, 0, 84, 74, 0, 0, 82, 82, 0, 0, 74, 84, 0, 0, 42, 84, 0, 0, 42
      defb 84, 0, 0, 42, 84, 0, 0, 42, 82, 0, 0, 74, 74, 0, 0, 82, 42, 0, 0, 84, 170, 0, 0, 85, 169, 0, 0, 149, 165, 0, 0, 165
      defb 148, 192, 3, 41, 82, 56, 28, 74, 73, 135, 225, 146, 36, 112, 14, 36, 147, 15, 240, 201, 72, 224, 7, 18, 38, 31, 248, 100, 145, 192, 3, 137

PORTAL_GRAPHIC_B6:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
      defb 76, 63, 252, 50, 145, 192, 3, 137, 38, 31, 248, 100, 72, 224, 7, 18, 147, 15, 240, 201, 164, 112, 14, 37, 41, 135, 225, 148, 74, 56, 28, 82
      defb 82, 0, 0, 74, 84, 0, 0, 42, 85, 0, 0, 170, 149, 0, 0, 169, 165, 0, 0, 165, 169, 0, 0, 149, 170, 0, 0, 85, 170, 0, 0, 85
      defb 170, 0, 0, 85, 170, 0, 0, 85, 169, 0, 0, 149, 165, 0, 0, 165, 149, 0, 0, 169, 85, 0, 0, 170, 84, 0, 0, 42, 82, 0, 0, 74
      defb 74, 56, 28, 82, 41, 135, 225, 148, 164, 112, 14, 37, 147, 15, 240, 201, 72, 224, 7, 18, 38, 31, 248, 100, 145, 192, 3, 137, 76, 63, 252, 50

PORTAL_GRAPHIC_B7:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
      defb 35, 128, 1, 196, 76, 63, 252, 50, 145, 192, 3, 137, 38, 31, 248, 100, 72, 224, 7, 18, 83, 15, 240, 202, 148, 112, 14, 41, 165, 135, 225, 165
      defb 169, 0, 0, 149, 170, 0, 0, 85, 42, 0, 0, 84, 74, 0, 0, 82, 82, 0, 0, 74, 84, 0, 0, 42, 85, 0, 0, 170, 85, 0, 0, 170
      defb 85, 0, 0, 170, 85, 0, 0, 170, 84, 0, 0, 42, 82, 0, 0, 74, 74, 0, 0, 82, 42, 0, 0, 84, 170, 0, 0, 85, 169, 0, 0, 149
      defb 165, 135, 225, 165, 148, 112, 14, 41, 83, 15, 240, 202, 72, 224, 7, 18, 38, 31, 248, 100, 145, 192, 3, 137, 76, 63, 252, 50, 35, 128, 1, 196

PORTAL_GRAPHIC_B8:
                  DEFW SCREEN1+110                      ; Start address of graphics
                        DB 4,4                         ; 8 rows, 4 collumns
      defb 152, 127, 254, 25, 35, 128, 1, 196, 76, 63, 252, 50, 145, 192, 3, 137, 166, 31, 248, 101, 40, 224, 7, 20, 75, 15, 240, 210, 82, 112, 14, 74
      defb 84, 0, 0, 42, 85, 0, 0, 170, 149, 0, 0, 169, 165, 0, 0, 165, 169, 0, 0, 149, 170, 0, 0, 85, 170, 0, 0, 85, 170, 0, 0, 85
      defb 170, 0, 0, 85, 170, 0, 0, 85, 170, 0, 0, 85, 169, 0, 0, 149, 165, 0, 0, 165, 149, 0, 0, 169, 85, 0, 0, 170, 84, 0, 0, 42
      defb 82, 112, 14, 74, 75, 15, 240, 210, 40, 224, 7, 20, 166, 31, 248, 101, 145, 192, 3, 137, 76, 63, 252, 50, 35, 128, 1, 196, 152, 127, 254, 25

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Make sure meters are updated
UPDATE_METERS:
                LD A,(H2O)      ;Get H2O reading
                PUSH AF
                LD B,A         ; Put into B for loop
                LD HL,23200  ; Screen ATTR address for bottom of left test tube
UPDATE_METERS_LOOP1:
                LD (HL),47 ;Dark cyan paper white ink
                INC HL  ; Move to next address to the right
                LD (HL),111 ;Light cyan paper white ink
                LD DE,33        ;Setup DE for subtraction
                OR A            ; Reset carry flag
                SBC HL,DE       ; Move up screen
                DJNZ UPDATE_METERS_LOOP1

                LD (HL),63 ; Cyan ink on dark white paper
                INC HL  ; Move to next address to the right
                LD (HL),127 ;Light gyan ink on white paper
                POP AF
                CP 1
                JP NZ,SKIP_OUT_OF_H2O            ; H2O is not 0 so dont jump to game over.
                 LD A,9                          ; A=9 to set meters
                 LD (H2O),A                      ; Set H2O meter

                LD A,1                          ; Set A to 1 to set player hit
                LD (PLAYER_HIT),A               ; Set player hit to on
                RET
               ; JP TAKE_1_FROM_LIVES                 ; Jump to lose a life


SKIP_OUT_OF_H2O:

                LD A,(O2)      ;Get O2 reading
                PUSH AF
                LD B,A         ; Put into B for loop
                LD HL,23200+30  ; Screen ATTR address for bottom of left test tube
UPDATE_METERS_LOOP2:
                LD A,31
                LD (HL),A ;Dark cyan paper white ink
                INC HL  ; Move to next address to the right
              ;  LD A,95
                LD (HL),95;A ;Dark cyan paper white ink
                LD DE,33        ;Setup DE for subtraction
                OR A            ; Reset carry flag
                SBC HL,DE       ; Move up screen
                DJNZ UPDATE_METERS_LOOP2
                ;LD A,63
                LD (HL),63;A ; Magenta ink on dark white paper
                INC HL  ; Move to next address to the right
               ; LD A,127
                LD (HL),127;A ; Light Magenta ink on white paper
                POP AF
                 CP 1
                JP NZ,SKIP_OUT_OF_O2            ; If Lives are not 0 then skip jump to game over.
                 LD A,9                          ; A=9 to set meters
                        LD (O2),A                       ; Set O2 meter
                        LD (H2O),A                      ; Set H2O meter

                    LD A,1                          ; Set A to 1 to set player hit
                LD (PLAYER_HIT),A               ; Set player hit to on


               ; JP TAKE_1_FROM_LIVES
SKIP_OUT_OF_O2:

                 RET



;Display large graphic
;Data Byte 1/2-screen address, 3=rows used, 4=collumns used
DISPLAY_LARGE_GRAPHIC:
                       ;PUSH IX

                       LD H,(IX+1) ; Get screen address
                       LD L,(IX+0)

                       LD A,(IX+2) ; Get rows
                       LD C,(IX+3) ; Get collumns

                       INC IX ; Move IX to graphic data
                       INC IX
                       INC IX
                       INC IX

DISPLAY_LARGE_GRAPHIC_LOOP3:
                       PUSH HL ; Save screen address
                       PUSH AF ; Save rows loop

                       LD B,8 ; 8 Hi res lines
DISPLAY_LARGE_GRAPHIC_LOOP1:

                       LD A,C ; Get collumns (13 columns)
DISPLAY_LARGE_GRAPHIC_LOOP2:
                       PUSH AF ; Save collumn loop
                       LD A,(IX+0)
                       LD (HL),A
                       INC IX ; Move to next graphic data
                       INC L  ; Move to next screen address to the right
                       POP AF ; Restore collumn loop
                       DEC A  ; Take one from collumn loop
                       JP NZ,DISPLAY_LARGE_GRAPHIC_LOOP2 ; Jump back until all collumns are done

                       INC H  ; Move to next screen Hires line
                       LD A,L ; Setup A for a subtraction
                       SUB C  ; Subtract collumns to go back to begining of graphic for next Hi res line
                       LD L,A ; Update screen address

                       DJNZ DISPLAY_LARGE_GRAPHIC_LOOP1 ;Jump back until all Hi res lines loop are completed

                       POP AF ; Restore rows loop
                       POP HL
                       LD DE,32 ; Setup DE for addition
                       ADD HL,DE ; Update screen address for next text line

                       DEC A  ; Take one from rows loop
                       JP NZ,DISPLAY_LARGE_GRAPHIC_LOOP3 ; Jump back until all rows are completed

                       RET           ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
FADE_CLEAR_PLAY_AREA:
                                LD D,254
                                LD B,5
FADE_CLEAR_PLAY_AREA_LOOP:
                              ;  PUSH BC
                                LD H,24

                                LD A,B
                                CP 6
                                JR C,SKIP_DESOLVE1
                                RRC D         ;
                                RLC D         ;
                                RLC D         ;
                                RLC D         ;
                                JP SKIP_DESOLVE3

SKIP_DESOLVE1:
                                CP 3
                                JR C,SKIP_DESOLVE2
                                RRC D         ;
                                RR D         ;
                                RLC D         ;
                                JP SKIP_DESOLVE3

SKIP_DESOLVE2:

                                CP 2
                                JR C,SKIP_DESOLVE3
                                RR D         ;

SKIP_DESOLVE3:
                                RR D         ;

FADE_CLEAR_PLAY_AREA_LOOP1:

                                LD L,17 ; Start at Hires collumn 17

FADE_CLEAR_PLAY_AREA_LOOP2:
                                PUSH HL

; Get hires address
                                LD A,L        ;
                                RRCA          ;
                                RRCA          ;
                                RRCA          ;
                                AND 31        ;
                                LD L,A        ;
                                LD A,H        ;
                                RLCA          ;
                                RLCA          ;
                                AND 224       ;
                                OR L          ;
                                LD L,A        ;
                                LD A,H        ;
                                AND 7         ;
                                EX AF,AF'     ;
                                LD A,H        ;
                                RRCA          ;
                                RRCA          ;
                                RRCA          ;
                                AND 24        ;
                                OR 64         ; Move to visible screen
                                LD H,A        ;
                                EX AF,AF'     ;
                                OR H          ;
                                LD H,A        ;

                                LD A,(HL) ; Get current play area content

                                AND D
                                LD (HL),A   ;Update screen address
                                POP HL


                            LD A,L
                            ADD A,8
                            LD L,A
                           CP 255-16
                           JR C,FADE_CLEAR_PLAY_AREA_LOOP2

                            INC H
                            LD A,H
                            CP 176
                            JR C,FADE_CLEAR_PLAY_AREA_LOOP1

                          ;  POP BC
                            DJNZ FADE_CLEAR_PLAY_AREA_LOOP
                         ;   LD A,71
                      ;  LD (ALIEN_BACKGROUND_COLOUR),A
                          ;  CALL COLOUR_FULL_PLAY_AREA
                            RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
DRAW_EXPLOSION:                                 ; Called with HL=explode data

               EXX

                LD B,9                          ;9 dots for explosion
ALIEN_EXPLOSION_LOOP:
                PUSH BC                         ; Save explode loop
                LD E,(IX+0)                     ; Get current dot coordinates
                LD D,(IX+1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Get screen address for pixel
                  LD A,D
                  AND A        ;A holds b7b6b5b4b3b2b1b0,
                  RRA          ;The bite of B. And now 0b7b6b5b4b3b2b1.
                  SCF
                  RRA          ;Now 10b7b6b5b4b3b2.
                  AND A
                  RRA          ;Now 010b7b6b5b4b3.
                  XOR D
                  AND 248      ;Finally 010b7b6b2b1b0, so that
                  XOR D        ;H becomes 64 + 8*INT (B/64) +
                  OR 96        ; Move to screen buffer
                  LD H,A       ;B (mod 8), the high byte of the
                  LD A,E       ;pixel address. C contains X.
                  RLCA         ;A starts as c7c6c5c4c3c2c1c0.
                  RLCA
                  RLCA         ;And is now c2c1c0c7c6c5c4c3.
                  XOR D
                  AND 199
                  XOR D        ;Now c2c1b5b4b3c5c4c3.
                  RLCA
                  RLCA         ;Finally b5b4b3c7c6c5c4c3, so
                  LD L,A       ;that L becomes 32*INT (B(mod

                  LD A,E       ;64)/8) + INT(x/8), the low byte.
                  AND 7        ;A holds x(mod 8): so the pixel

                          ;is bit (A - 7) within the byte.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                LD B,A         ;B will count A+1 loops to get a
               INC B          ;Zero to the correct place in A.
               LD A,254       ;The zero is entered.
PLOTLOOPB:
               RRCA           ;Then lined up with the pixel
               DJNZ PLOTLOOPB ;Bit position in the byte.
               LD B,A         ;Then copied to B.
               LD A,(HL)      ;The pixel-byte is obtained in A.

               XOR B          ;Over 1
               CPL

                  LD (HL),A   ;The byte is entered. Its other bits are unchanged in every case.

                        INC IX
                        INC IX
                 POP BC
              DJNZ ALIEN_EXPLOSION_LOOP


             EXX
                RET


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
seed:                                      DEFB 0
SNOW_FLAKE_DATA1:                         DEFS 250

;Snow flake data format
;DELAY         x up/down,  y left/right,  DOWN speed,
;  0              1             2                 3
;  1 2 4 8 16 32 64 128 256

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;setup snow in data 1
SETUP_SNOWFLAKES:

                 LD IX,SNOW_FLAKE_DATA1
                 LD B,20
SNOWLOOP1:
                 PUSH BC
                 CALL RND
                 LD (IX+0),A          ;Setup start delay for current star

                 CALL RND               ;Random across
                 LD (IX+2),A          ;Setup across start

                 LD A,175               ;Start all stars at top of screen
                 LD (IX+1),A          ; Setup up/down start

                 CALL RND               ;Setup speed down)
                 AND %00000011
                 LD (IX+3),A          ;

                 LD BC,4
                 ADD IX,BC
                 POP BC

                 DJNZ SNOWLOOP1
                 RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Meter bubble store
H2O_BUBBLE_ENABLED1:     DEFB 0  ; H2O Bubble1 status 0=off, 1=on
H2O_BUBBLE_UP_DOWN1:     DEFB 0  ; H2O Bubble1 up/down coordinate
H2O_BUBBLE_LEFT_RIGHT1:  DEFB 0  ; H2O Bubble1 left/right coordinate

H2O_BUBBLE_ENABLED2:     DEFB 0  ; H2O Bubble2 status 0=off, 1=on
H2O_BUBBLE_UP_DOWN2:     DEFB 0  ; H2O Bubble2 up/down coordinate
H2O_BUBBLE_LEFT_RIGHT2:  DEFB 0  ; H2O Bubble2 left/right coordinate

H2O_BUBBLE_ENABLED3:     DEFB 0  ; H2O Bubble3 status 0=off, 1=on
H2O_BUBBLE_UP_DOWN3:     DEFB 0  ; H2O Bubble3 up/down coordinate
H2O_BUBBLE_LEFT_RIGHT3:  DEFB 0  ; H2O Bubble3 left/right coordinate

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
O2_BUBBLE_ENABLED1:     DEFB 0  ; O2 Bubble1 status 0=off, 1=on
O2_BUBBLE_UP_DOWN1:     DEFB 0  ; O2 Bubble1 up/down coordinate
O2_BUBBLE_LEFT_RIGHT1:  DEFB 0  ; O2 Bubble1 left/right coordinate

O2_BUBBLE_ENABLED2:     DEFB 0  ; O2 Bubble2 status 0=off, 1=on
O2_BUBBLE_UP_DOWN2:     DEFB 0  ; O2 Bubble2 up/down coordinate
O2_BUBBLE_LEFT_RIGHT2:  DEFB 0  ; O2 Bubble2 left/right coordinate

O2_BUBBLE_ENABLED3:     DEFB 0  ; O2 Bubble3 status 0=off, 1=on
O2_BUBBLE_UP_DOWN3:     DEFB 0  ; O2 Bubble3 up/down coordinate
O2_BUBBLE_LEFT_RIGHT3:  DEFB 0  ; O2 Bubble3 left/right coordinate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Setup test tube bubbles
SETUP_TESTTUBE_BUBBLES:
                        LD IX,H2O_BUBBLE_ENABLED1 ; Point at bubble data
                        LD A,175               ; Bubble starts at bottom of screen
                        LD (IX+0),0            ; Set H2O bubble 1 status to disabled
                        LD (IX+1),A            ; Set H2O bubble 1 up/down coordinate to bottom
                        LD (IX+2),0            ; Set H2O Bubble 1 left/right coordinate

                        LD (IX+3),0            ; Set H2O bubble 2 status to disabled
                        LD (IX+4),A            ; Set H2O bubble 2 up/down coordinate to bottom
                        LD (IX+5),0            ; Set H2O Bubble 2 left/right coordinate

                        LD (IX+6),0            ; Set H2O bubble 3 status to disabled
                        LD (IX+7),A            ; Set H2O bubble 3 up/down coordinate to bottom
                        LD (IX+8),0            ; Set H2O Bubble 3 left/right coordinate

                        LD (IX+9),0            ; Set O2 bubble 1 status to disabled
                        LD (IX+10),A           ; Set O2 bubble 1 up/down coordinate to bottom
                        LD (IX+11),0           ; Set O2 Bubble 1 left/right coordinate

                        LD (IX+12),0           ; Set O2 bubble 2 status to disabled
                        LD (IX+13),A           ; Set O2 bubble 2 up/down coordinate to bottom
                        LD (IX+14),0           ; Set O2 Bubble 2 left/right coordinate

                        LD (IX+15),0           ; Set O2 bubble 3 status to disabled
                        LD (IX+16),A           ; Set O2 bubble 3 up/down coordinate to bottom
                        LD (IX+17),0           ; Set O2 Bubble 3 left/right coordinate

                        RET                    ; Return

                ;H2O_BUBBLE_ENABLED1:     DEFB 0  ; H2O Bubble status 0=off, 1=on
                ;H2O_BUBBLE_UP_DOWN1:     DEFB 0  ; H2O Bubble up/down coordinate
                ;H2O_BUBBLE_LEFT_RIGHT1:  DEFB 0  ; H2O Bubble left/right coordinate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Bubbles in test tubes
BUBBLES:
                        LD HL,H2O_BUBBLE_ENABLED1 ; Point at bubble data
                        LD E,240                ; Set for addition to move across to right test tube
                        LD B,6                  ; 3 bubbles in two test tubes
BUBBLES_LOOP:
                        LD A,(HL)               ; Get current bubble status
                        OR A;CP 1                    ; Is current bubble disabled?
                        JR NZ,SKIP_O2_TUBE2      ; If enabled then skip trying to enable it

                        CALL RND
                        CP 100                  ; Reference 50
                        JR C,SKIP_RANDOM_BUBBLE_ENABLE ; If A<50 then skip enabling bubble

                        LD (HL),1               ; Enable bubble

                        INC HL                  ; Move to HL+1 for up/down coordinate
                        CALL RND                ; Get random number
                        AND 10                  ; At least collumn 8
                        OR 3                    ; Below 16 needs to stay inside test tube
                        LD C,A                  ; Save left/right coordinate
                        LD A,B                  ; Get B into A for testing which tube we are in
                        CP 3                    ; Are we in O2 tube?
                        JR C,SKIP_O2_TUBE       ; We are still in H2O tube
                        LD A,C                  ; Restore left/right coordinate
                        ADD E                   ; Move to right test tube by 240 pixels

                        INC HL                  ; Move to HL+2 for left/right coordinate
                        LD (HL),A               ; Update left/right coordinate
                        DEC HL                  ; Move to HL+2 for next bubble data
                        DEC HL                  ;
                        JP SKIP_O2_TUBE2
SKIP_O2_TUBE:
                        INC HL                  ; Move to HL+2
                        LD A,C                  ; Restore left/right coordinate
                        LD (HL),A               ; Update left/right coordinate
                        DEC HL                  ; Move to HL+1
                        DEC HL
SKIP_O2_TUBE2:
                        INC HL                  ; Move to HL+1
                        LD A,(HL)               ; Get up/down coordinate
                        SUB 4
                        LD (HL),A               ; Update up/down coordinate
                        CP 100                  ; Are we at the top of the tube contents?
                        JR NC,SKIP_RESETTING_BUBBLE ; If not then skip resetting bubble
                        LD (HL),175             ; Reset bubble back to bottom
                        DEC HL                  ; Move to HL+0
                        LD (HL),0               ; Disable bubble
                        JP SKIP_RANDOM_BUBBLE_ENABLE

SKIP_RESETTING_BUBBLE:
                        DEC HL                  ; Allign bubble data pointer

SKIP_RANDOM_BUBBLE_ENABLE:

                        INC HL                  ; Move to next bubble data
                        INC HL
                        INC HL
                        DJNZ BUBBLES_LOOP       ; Jump back to update all bubbles


                ;H2O_BUBBLE_ENABLED1:     DEFB 0  ; H2O Bubble1 status 0=off, 1=on
                ;H2O_BUBBLE_UP_DOWN1:     DEFB 0  ; H2O Bubble1 up/down coordinate
                ;H2O_BUBBLE_LEFT_RIGHT1:  DEFB 0  ; H2O Bubble1 left/right coordinate
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display enabled Bubbles in test tubes

                        LD HL,H2O_BUBBLE_ENABLED1 ; Point at bubble data
                        LD C,4                 ; 4 pixels to move bubble up screen
                        LD B,6                  ; 3 bubbles in two test tubes
BUBBLES_LOOP2:
                        PUSH BC                 ; Save loop
                        LD A,(HL)               ; Get current bubble status
                        OR A                    ; CP 0 Is current bubble disabled?
                        JR Z,SKIP_DISPLAYING_BUBBLE ; If enabled then skip trying to enable

                        INC HL                  ; Move to next bubble data
                        LD D,(HL)               ; Get bubble coordinate  up/down 175=bottom
                        INC HL                  ; Move to next bubble data
                        LD E,(HL)               ; Get bubble coordinate  left/right
                        INC HL                  ; Move to next bubble data

                        CALL GET_BUBBLE_ADDRESS ; Get screen address and plot bubble
                        LD A,D                  ; Get up/down bubble coordinate
                        SUB C                   ; Take 4 to move up screen
                        LD D,A                  ; Update up/down bubble coordinate

                        CALL GET_BUBBLE_ADDRESS ; Get screen address and plot bubble
                        JP SKIP_MOVING_TO_NEXT_BUBBLE ;Jump moving to next data, we are already there
SKIP_DISPLAYING_BUBBLE:
                        INC HL                  ; Move to next bubble data
                        INC HL                  ; Move to next bubble data
                        INC HL                  ; Move to next bubble data

SKIP_MOVING_TO_NEXT_BUBBLE:
                        POP BC                  ; Restore loop
                        DJNZ BUBBLES_LOOP2      ; Jump back to update all bubbles

                        RET                     ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Get screen address for pixel
GET_BUBBLE_ADDRESS:

                  PUSH HL
                  LD A,D
                  AND A        ;A holds b7b6b5b4b3b2b1b0,
                  RRA          ;The byte of B. And now 0b7b6b5b4b3b2b1.
                  SCF
                  RRA          ;Now 10b7b6b5b4b3b2.
                  AND A
                  RRA          ;Now 010b7b6b5b4b3.
                  XOR D
                  AND 248      ;Finally 010b7b6b2b1b0, so that
                  XOR D        ;H becomes 64 + 8*INT (B/64) +
                  OR 64        ; Move to visible screen
                  LD H,A       ;B (mod 8), the high byte of the
                  LD A,E       ;pixel address. C contains X.
                  RLCA         ;A starts as c7c6c5c4c3c2c1c0.
                  RLCA
                  RLCA         ;And is now c2c1c0c7c6c5c4c3.
                  XOR D
                  AND 199
                  XOR D        ;Now c2c1b5b4b3c5c4c3.
                  RLCA
                  RLCA         ;Finally b5b4b3c7c6c5c4c3, so
                  LD L,A       ;that L becomes 32*INT (B(mod
               ;   LD A,E       ;64)/8) + INT(x/8), the low byte.
               ;   AND 7        ;A holds x(mod 8): so the pixel
                  LD A,8
                               ;is bit (A - 7) within the byte.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                        LD B,A         ;Then copied to B.
                        LD A,(HL)      ;The pixel-byte is obtained in A.
                        XOR B          ;Over 1

                        LD (HL),A      ;The byte is entered. Its other bits are unchanged in every case.
                        POP HL
                        RET            ;Return


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SCROLL_BOX:

d34516:
                LD HL,16993+2   ; First line of top of scroll area
                LD DE,16481+2   ; Third line of top of scroll area

d34532:
                LD IXL,143    ;

d34535:
                PUSH HL       ;
                PUSH DE       ;

                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;
                LDI           ;

                POP HL        ;
                INC H         ;
                LD A,H        ;
                AND 7         ;
                JP NZ,d34616   ;
                LD A,L        ;
                ADD A,32      ;
                LD L,A        ;
                JP C,d34616    ;
                LD A,H        ;
                SUB 8         ;
                LD H,A        ;
d34616:
                EX DE,HL      ;
                POP HL        ;
                INC H         ;
                LD A,H        ;
                AND 7         ;
                JP NZ,d34636   ;
                LD A,L        ;
                ADD A,32      ;
                LD L,A        ;
                JP C,d34636    ;
                LD A,H        ;
                SUB 8         ;
                LD H,A        ;
d34636:
                DEC IXL       ;
                JP NZ,d34535   ;

                LD BC,800                     ; Set delay time
                CALL DELAY                      ; Delay
                RET           ;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Print the score
DISPLAY_SCORE_FIGURES:

                               LD HL,SCORE              ;Point to Score data
                               LD DE,16388              ;Set screen print location
                               LD C,7                   ;6 digits to print
                               CALL PRMESSAGE           ;Print string


                               RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add 1000 points
ONE_THOUSAND_POINTS:
                              LD B,100                  ; 100x10 points to add
ONE_THOUSAND_POINTS_LOOP:

                              CALL ADD_SCORE            ; Add 10 points

                              DJNZ ONE_THOUSAND_POINTS_LOOP; Jump back to add points
                              RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
ADD_SCORE:
                              ;  PUSH BC
                              ;  PUSH IX
                               ; PUSH DE
                                ;PUSH HL
                                EXX
                                LD HL,SCORE+6
                                LD B,10                        ;Loop B times to increment score
INCREMENT_SCORE_LOOP:
                                CALL INCREMENT_SCORE
                                DJNZ INCREMENT_SCORE_LOOP
                                CALL DISPLAY_SCORE_FIGURES
                                EXX
                              ;  POP HL
                               ; POP DE
                               ; POP IX
                                ;POP BC


                                RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
SC37098:                   LD (HL),48                    ;Roll the digit over from '9' to '0'
                           DEC HL                        ;Point HL at the next digit to the left
                           LD A,L                        ;Is this the 10000s digit?
                           CP 42
                           JR NZ,SC37118                 ;Jump if not
;Player has scored another 10000 points. Give him an extra life.
;Increment the number of lives remaining if less than 9 remain
                           LD A,(LIVES)                  ;Get lives
                           CP 25                          ;Are lives already 9?
                           JR Z,INCREMENT_SCORE          ;Jump if so to skip adding another life.
                           INC A                         ;Increase life
                           LD (LIVES),A                  ;Save new life figure
;The entry point to this routine is here. HL pointing at the digit of the score to be incremented
INCREMENT_SCORE:
SC37118:


INC_SCORE_LOOP:
                           LD A,(HL)                     ;Pick up a digit of the score
                           CP 57                         ;Is it '9'?
                           JR Z,SC37098                  ;Jump if so
                           INC (HL)                      ;Increment the digit

                           RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Decrease Timer
TI37098:                   LD (HL),57                    ;Roll the digit over from '0' to '9'
                           DEC HL                        ;Point HL at the next digit to the left
                         ;  LD A,L                        ;Is this the 10000s digit?

;Player has scored another 10000 points. Give him an extra life.
;The entry point to this routine is here. HL pointing at the digit of the timer to be decreased
DECREASE_TIMER:
TI37118:


DECREASE_TIMER_LOOP:
                           LD A,(HL)                     ;Pick up a digit of the timer
                           CP 48                         ;Is it '0'?
                           JR Z,TI37098                  ;Jump if so
                           DEC (HL)                      ;Decrement the digit

                           RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Add 1 to lives
ADD_1_TO_LIVES:

                                LD HL,LIVES                  ; Get lives
                                LD A,(HL)
                                CP 9                         ; Are lives already 9?
                                JR Z,SC37118                 ; Jump if so to skip adding another life.
                                INC (HL)                     ; Increase life

                                ;JP DISPLAY_LIVES             ; Update lives

                                CALL UPDATE_METERS              ; Update meters
                                LD A,(LIVES)                 ;Get lives

                                LD DE,16385+16               ;Screen address to display lives
                                CALL PRCHAR2                 ;Display lives

                                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Take 1 from lives and explode player
TAKE_1_FROM_LIVES:
                            ;     JP ALIEN_NOT_ENABLED ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                                LD HL,PLAYER_MISSILE_GRAPHIC1   ; Point to Player basic missile graphic
                                LD (PLAYER_MISSILE_GRAPHIC),HL    ; Set player missile graphic pointer to basic missile graphic



                                LD HL,LIVES                     ; Get lives remaining.
                                DEC (HL)                        ; One less life.

                                XOR A                          ; A=0 to reset player hit
                                LD (PLAYER_HIT),A             ; Reset player hit

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Display Lives
DISPLAY_LIVES:
                                CALL UPDATE_METERS              ; Update meters
                                CALL DISPLAY_LIVES_FIGURES    ; Display lives figures
                                LD A,(LIVES)                 ;Get lives
                                CP 16                        ; Is it 0?
                                JP Z,OUT_OF_LIVES            ; Lives are 0 so jump to game over.
                                LD A,40                      ; Set shields
                                LD (SHIELD_BONUS_COUNTDOWN),A ; Set shields on for a short time to give a chance after being hit
                                LD A,168                        ; Player ship starts at line 21 and goes up to line 19 at 152
                                LD (SP1Y_SHIP),A                ; Set bottom up/down
                                JP ALIEN_NOT_ENABLED

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display lives figures
DISPLAY_LIVES_FIGURES:

                               LD A,(LIVES)                 ;Get lives
                                LD DE,16385+16               ;Screen address to display lives
                                CALL PRCHAR2                 ;Display lives
                               RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display Hi Score figures
DISPLAY_HI_SCORE_FIGURES:

                        LD HL,HI_SCORE_1_READING        ; Point to Hi score data
                        LD DE,16400+8                   ; Set screen print location
                        LD C,7                          ; 6 digits to print
                        CALL PRMESSAGE                  ; Print string
                        RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Write a string to the screen
; On entry: HL=>ASCII string
;           DE=>Display address to write to
;           C=String length
PRMESSAGE:
                                LD A,(HL)               ; Get a character
                                CP 255                  ;If string character=255 then return
                                RET Z
                                SUB 32                  ; Subtract 48 from letter in text string
                                CALL PRCHAR2            ; Write to screen at DE
PRRETURN:                       INC HL                  ; Move to next character
                                INC E                   ; Move to next screen cell
                                LD A,D                  ; DE has been left pointing to the
                                SUB 8                   ;  'ninth' pixel line, so adjust
                                LD D,A                  ; D back to line 1
                                DEC C                   ; Decrement string length
                                JR NZ,PRMESSAGE         ; Loop for the string
                                RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Write a character to screen
PRCHAR2:                        PUSH HL
                                PUSH DE
                                CALL GET_FONT           ; Get character from font
;HL=CHARACTER
                                POP DE
                                LD      B,8             ; Eight pixel-lines
PRMATRIX2:
                                LD      A,(HL)          ; Get character line
                                LD      (DE),A          ; Store in screen
                                INC     HL              ; Point to next character line
                                INC     D               ; Point to next pixel line

                                DJNZ    PRMATRIX2       ; Loop for all eight lines
                                POP HL
                                RET

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RND: ;rnd
                                PUSH HL
                                PUSH DE
                                PUSH BC
                                ld hl,LFSRSeed+4
                                ld e,(hl)
                                inc hl
                                ld d,(hl)
                                inc hl
                                ld c,(hl)
                                inc hl
                                ld a,(hl)
                                ld b,a
                                rl e
                                rl d
                                rl c
                                rla
                                rl e
                                rl d
                                rl c
                                rla
                                rl e
                                rl d
                                rl c
                                rla
                                ld h,a
                                rl e
                                rl d
                                rl c
                                rla
                                xor b
                                rl e
                                rl d
                                xor h
                                xor c
                                xor d
                                ld hl,LFSRSeed+6
                                ld de,LFSRSeed+7
                                ld bc,7
                                lddr
                                ld (de),a
                                POP BC
                                POP DE
                                POP HL
                                RET

LFSRSeed:                       DEFB 10,40,80,120,90,160,200,230,250


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Out of lives
OUT_OF_LIVES:
                        CALL FADE_CLEAR_PLAY_AREA       ; Clear play area

                        LD BC,20000                     ; Set delay time
                        CALL DELAY                      ; Delay

                        LD IX,GAME_OVER_TEXT             ;
                        CALL DISPLAY_STRING             ;
                        LD B,8                        ;
SCROLL_NEXT_LEVEL_LOOP2:
                        PUSH BC
                        LD BC,8000                     ; Set delay time
                        CALL DELAY                      ; Delay
                        CALL SCROLL_BOX                 ;
                        POP BC                          ;
                        DJNZ SCROLL_NEXT_LEVEL_LOOP2     ;
                        CALL FADE_CLEAR_PLAY_AREA       ;
                        CALL CHECK_HI_SCORE

                        LD A,71                    ; A=71 for bright white on black
                     LD (ALIEN_BACKGROUND_COLOUR),A ; Set background colour

                        CALL MEMORY_SWITCH_1            ; Switch to memory 0

                        JP NEXT_TELETEXT_1

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
tmp0:                   DB 0,0                          ; Temporary store for sprite routine
tmp1:                   DB 0,0                          ; Temporary store for sprite routine
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Sprite routine by Jonathan Cauldwell
; Chutney.wordpress.com
; This is my main sprite routine and expects coordinates in (dispx,dispy)
; where dispx is the vertical coord from the top of the screen (0-176), and
; dispy is the horizontal coord from the left of the screen (0 to 240).
; Sprite data is stored as you'd expect in its unshifted form as this
; routine takes care of all the shifting itself.  This means that sprite
; handling isn't particularly fast but the graphics only take 1/8th of the
; space they would require in pre-shifted form.

; On entry BC must point to the unshifted sprite data.

sprit7:                 xor 7                           ; complement last 3 bits.
                        inc a                           ; add one for luck!
sprit3:                 rl d                            ; rotate left...
                        rl c                            ; ...into middle byte...
                        rl e                            ; ...and finally into left character cell.
                        dec a                           ; count shifts we've done.
                        jr nz,sprit3                    ; return until all shifts complete.

; Line of sprite image is now in e + c + d, we need it in form c + d + e.

                        ld a,e                          ; left edge of image is currently in e.
                        ld e,d                          ; put right edge there instead.
                        ld d,c                          ; middle bit goes in d.
                        ld c,a                          ; and the left edge back into c.
                        jr sprit0                       ; we've done the switch so transfer to screen.

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Display sprite

dispx:
sprite:                 ld a,0                          ; (dispx)                    ; draws sprite (hl).

                        ld (tmp1),a                     ; store vertical.
                        ; call scadd          ; calculate screen address.
; Calculating a screen address from a pixel coordinate can be tricky!
; The Spectrum screen display is organized into 3 segments of 2048 bytes,
; all containing 8 rows of 32 character squares, each with 8 lines.
; Hence 8 * 32 * 8 * 3 = 6144 bytes.
; Low resolution colour filter = 32 * 8 character squares = 768 bytes.
; Total = 6144 + 768 = 6912 bytes, 16384 to 23295 inclusive.

scadd:                  ld a,(dispx+1)                  ; Returns screen address of coordinates
                       ; AND 127                         ;

                        ld b,a                          ; (dispx, dispy) in de.
                        and 7                           ; Line 0-7 within character square.
                        add a,96                        ; 96 * 256 = 24576 (Start of screen buffer)
                        ld d,a                          ; Line * 256.
                        ld a,b                          ; fetch x coord again.
                        rrca                            ; divide pixel displacement by 8.
                        rrca                            ;
                        rrca                            ;
                        and 24                          ; Segment 0-2 multiplied by 8.
                        add a,d                         ; Add to h (so multiply by 8 * 256 = 2048)
                        ld d,a                          ;
                        ld a,b                          ; 8 character squares per segment.
                        rlca                            ; Divide x by 8 and multiply by 32,
                        rlca                            ; net calculation: multiply by 4.
                        and 224                         ; Mask off bits we don't want.

                        ld e,a                          ; Vertical coordinate calculation done.
dispy:
                        ld a,0                          ; (dispy)                    ; y coordinate.   LEFT/RIGHT
                        ld b,a                          ; remember horizontal position for later.
                        rrca                            ; now need to divide by 8.
                        rrca                            ;
                        rrca                            ;
                        and 31                          ; Squares 0 - 31 across screen.
                        add a,e                         ; Add to total so far.
                        ld e,a                          ; de = address of screen.


nextsp:
                        ld a,16                         ; height of sprite in pixels.
sprit1:                 ex af,af'           ; store loop counter.  Height loop;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

                        push de                         ; store screen address.
                        ld c,(hl)                       ; first sprite graphic data.
                        inc hl                          ; increment pointer to sprite data to right.
                        ld d,(hl)                       ; next part of sprite image.
                        inc hl                          ; point to next row of sprite data.
                        ld (tmp0),hl                    ; store sprite data pointer in tmp0 for later.
                        ld e,0                          ; blank right byte for now.
                        ld a,b                          ; b holds y position.
                        and 7                           ; how are we straddling character cells?
                        jr z,sprit0                     ; we're not straddling them, don't bother shifting.
                        cp 5                            ; 5 or more right shifts needed?
                        jr nc,sprit7                    ; yes, shift from left as it's quicker.
                        and a                           ; oops, carry flag is set so clear it.
sprit2:                 rr c                            ; rotate left byte right...
                        rr d                            ; ...through middle byte...
                        rr e                            ; ...into right byte.
                        dec a                           ; one less shift to do.
                        jr nz,sprit2                    ; return until all shifts complete.
sprit0:                 pop hl                          ; pop screen address from stack.







; Merge with what is already there
MERGE_SPRITE_WITH_BACGROUND:

                        ld a,(hl)                       ; what's there already.
                        or c                            ; merge in image data.
                        ld (hl),a                       ; place onto screen.
                        inc l                           ; next character cell to right please.
                        ld a,(hl)                       ; what's there already.
                        or d                            ; merge with middle bit of image.
                        ld (hl),a                       ; put back onto screen.
                        inc hl                          ; next bit of screen area.
                        ld a,(hl)                       ; what's already there.
                        or e                            ; right edge of sprite image data.
                        ld (hl),a                       ; plonk it on screen.

                        ld a,(tmp1)                     ; temporary vertical coordinate.
                        inc a                           ; next line down.
                        ld (tmp1),a                     ; store new position.
                        and 63                          ; are we moving to next third of screen?
                        jr z,sprit4                     ; yes so find next segment.
                        and 7                           ; moving into character cell below?
                        jr z,sprit5                     ; yes, find next row.
                        dec hl                          ; left 2 bytes.
                        dec l                           ; not straddling 256-byte boundary here.
                        inc h                           ; next row of this character cell.
sprit6:                 ex de,hl                        ; screen address in de.
                        ld hl,(tmp0)                    ; restore graphic address.
                        ex af,af'                       ; restore loop counter.;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
                        dec a                           ; decrement it.
                        jr nz,sprit1                    ; not reached bottom of sprite yet to repeat.

                        CALL COLOUR_SPRITE              ; Colour sprite
                        ret                             ; job done.

sprit4:                 ld de,30                        ; next segment is 30 bytes on.
                        add hl,de                       ; add to screen address.
                        jr sprit6                       ; repeat.
sprit5:                 ld de,63774                     ; minus 1762.
                        add hl,de                       ; subtract 1762 from physical screen address.
                        jp sprit6                       ; rejoin loop.
                        ret                             ;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
RESET_STATUS:
                        LD HL,LIVES                     ; 3 lives to start with
                        LD (HL),19                      ; Set lives
                       ; CALL DISPLAY_LIVES              ; Display lives at top of screen

                        CALL UPDATE_METERS              ; Update meters
                                LD A,(LIVES)                 ;Get lives

                                LD DE,16385+16               ;Screen address to display lives
                                CALL PRCHAR2                 ;Display lives

                        LD HL,SCORE                     ; Initialise the score
                        LD DE,SCORE+1                   ;
                        LD BC,9                         ;
                        LD (HL),48                      ; 48=character 0
                        LDIR                            ; Fill all score figures with 0
                        CALL DISPLAY_SCORE_FIGURES      ; Display Score at top of screen
                        CALL DISPLAY_HI_SCORE_FIGURES   ; Display Hi Score at top of screen
                        RET
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


                defb 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Player ship data
PLAYER_SHIP_GRAPHIC:
        defb 0, 0, 1, 128, 1, 128, 2, 64, 35, 196, 33, 132, 49, 140, 61, 188
          defb 54, 236, 51, 204, 54, 236, 63, 252, 57, 156, 51, 204, 0, 0, 0, 0


PLAYER_SHIP_SHIELD_GRAPHIC:
           defb 3, 192, 13, 176, 17, 136, 34, 68, 99, 198, 97, 134, 177, 141, 189, 189
          defb 182, 237, 179, 205, 118, 238, 127, 254, 57, 156, 51, 204, 12, 48, 3, 192

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Reset Alien head missiles
RESET_ALIEN_HEAD_MISSILES:

;               DEFB 0,0,0 ;Fire missile 1. Enabled 0,1, Up/Down, Left/right

                LD IX,HEAD_FIRE_MISSILE_COUNT   ; Point at alien head missile data
                LD B,10                         ; 10 missiles to reset
RESET_ALIEN_HEAD_MISSILES_LOOP:
                LD (IX+0),0                     ; Set current alien head missile to disabled
                INC IX                          ; Move to next missile data block
                INC IX
                INC IX
                DJNZ RESET_ALIEN_HEAD_MISSILES_LOOP ; Jump back until all 10 missiles are reset
                RET                            ; Return

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Initialize alien head pixels       Portal    120,32     0,0,0,0
RESET_ALIEN_HEAD_DATA:

                        LD HL,ALIEN_HEAD_DATA; Point at alien head data
                        LD BC,413                     ; 998 blocks of data for eack point

SKIP_RESET_ALIEN_HEAD_FINISH:


                        CALL RND
                        AND 8
                        ADD A,126

                        LD (HL),A   ; Set live data x coordinate to portal
                        INC HL

                        CALL RND
                        AND 8
                        ADD A,140

                        LD (HL),A         ; Set live data x coordinate to portal

                        INC HL
                        INC HL
                        INC HL

                        DEC BC
                        LD A,B
                        OR C
                        JR NZ,SKIP_RESET_ALIEN_HEAD_FINISH      ; Jump back until all points are done
                        RET                 ; Return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Alien head pixels
;                            Live data
;                            X Y
;                            | | X Y Default data
;                       DEFB 0,0,5,138
             ;   org 60000
ALIEN_HEAD_DATA:
                 DEFB 0,0,125,117
                 DEFB 0,0,129,117
                 DEFB 0,0,119,116
                 DEFB 0,0,121,116
                 DEFB 0,0,131,116
                 DEFB 0,0,134,116
                 DEFB 0,0,118,115
                 DEFB 0,0,122,115
                 DEFB 0,0,124,115
                 DEFB 0,0,126,115
                 DEFB 0,0,129,115
                 DEFB 0,0,133,115
                 DEFB 0,0,136,115
                 DEFB 0,0,116,114
                 DEFB 0,0,120,114
                 DEFB 0,0,123,114
                 DEFB 0,0,132,114
                 DEFB 0,0,135,114
                 DEFB 0,0,115,113
                 DEFB 0,0,117,113
                 DEFB 0,0,119,113
                 DEFB 0,0,121,113
                 DEFB 0,0,124,113
                 DEFB 0,0,126,113
                 DEFB 0,0,128,113
                 DEFB 0,0,131,113
                 DEFB 0,0,134,113
                 DEFB 0,0,136,113
                 DEFB 0,0,138,113
                 DEFB 0,0,120,112
                 DEFB 0,0,123,112
                 DEFB 0,0,135,112
                 DEFB 0,0,113,111
                 DEFB 0,0,116,111
                 DEFB 0,0,118,111
                 DEFB 0,0,122,111
                 DEFB 0,0,124,111
                 DEFB 0,0,126,111
                 DEFB 0,0,129,111
                 DEFB 0,0,132,111
                 DEFB 0,0,137,111
                 DEFB 0,0,140,111
                 DEFB 0,0,115,110
                 DEFB 0,0,117,110
                 DEFB 0,0,120,110
                 DEFB 0,0,126,110
                 DEFB 0,0,134,110
                 DEFB 0,0,138,110
                 DEFB 0,0,112,109
                 DEFB 0,0,116,109
                 DEFB 0,0,119,109
                 DEFB 0,0,122,109
                 DEFB 0,0,124,109
                 DEFB 0,0,129,109
                 DEFB 0,0,136,109
                 DEFB 0,0,140,109
                 DEFB 0,0,142,109
                 DEFB 0,0,113,108
                 DEFB 0,0,117,108
                 DEFB 0,0,120,108
                 DEFB 0,0,123,108
                 DEFB 0,0,125,108
                 DEFB 0,0,131,108
                 DEFB 0,0,112,107
                 DEFB 0,0,115,107
                 DEFB 0,0,118,107
                 DEFB 0,0,121,107
                 DEFB 0,0,127,107
                 DEFB 0,0,129,107
                 DEFB 0,0,138,107
                 DEFB 0,0,113,106
                 DEFB 0,0,117,106
                 DEFB 0,0,119,106
                 DEFB 0,0,123,106
                 DEFB 0,0,125,106
                 DEFB 0,0,134,106
                 DEFB 0,0,140,106
                 DEFB 0,0,143,106
                 DEFB 0,0,111,105
                 DEFB 0,0,115,105
                 DEFB 0,0,121,105
                 DEFB 0,0,123,105
                 DEFB 0,0,130,105
                 DEFB 0,0,137,105
                 DEFB 0,0,113,104
                 DEFB 0,0,116,104
                 DEFB 0,0,118,104
                 DEFB 0,0,125,104
                 DEFB 0,0,128,104
                 DEFB 0,0,141,104
                 DEFB 0,0,111,103
                 DEFB 0,0,114,103
                 DEFB 0,0,119,103
                 DEFB 0,0,123,103
                 DEFB 0,0,131,103
                 DEFB 0,0,134,103
                 DEFB 0,0,143,103
                 DEFB 0,0,112,102
                 DEFB 0,0,115,102
                 DEFB 0,0,117,102
                 DEFB 0,0,120,102
                 DEFB 0,0,122,102
                 DEFB 0,0,126,102
                 DEFB 0,0,128,102
                 DEFB 0,0,137,102
                 DEFB 0,0,141,102
                 DEFB 0,0,117,101
                 DEFB 0,0,119,101
                 DEFB 0,0,121,101
                 DEFB 0,0,123,101
                 DEFB 0,0,125,101
                 DEFB 0,0,130,101
                 DEFB 0,0,139,101
                 DEFB 0,0,143,101
                 DEFB 0,0,113,100
                 DEFB 0,0,115,100
                 DEFB 0,0,116,100
                 DEFB 0,0,118,100
                 DEFB 0,0,120,100
                 DEFB 0,0,122,100
                 DEFB 0,0,129,100
                 DEFB 0,0,132,100
                 DEFB 0,0,134,100
                 DEFB 0,0,136,100
                 DEFB 0,0,137,100
                 DEFB 0,0,138,100
                 DEFB 0,0,140,100
                 DEFB 0,0,112,99
                 DEFB 0,0,113,99
                 DEFB 0,0,114,99
                 DEFB 0,0,115,99
                 DEFB 0,0,116,99
                 DEFB 0,0,117,99
                 DEFB 0,0,118,99
                 DEFB 0,0,119,99
                 DEFB 0,0,124,99
                 DEFB 0,0,127,99
                 DEFB 0,0,134,99
                 DEFB 0,0,135,99
                 DEFB 0,0,136,99
                 DEFB 0,0,137,99
                 DEFB 0,0,138,99
                 DEFB 0,0,139,99
                 DEFB 0,0,140,99
                 DEFB 0,0,141,99
                 DEFB 0,0,142,99
                 DEFB 0,0,112,98
                 DEFB 0,0,113,98
                 DEFB 0,0,114,98
                 DEFB 0,0,115,98
                 DEFB 0,0,116,98
                 DEFB 0,0,117,98
                 DEFB 0,0,118,98
                 DEFB 0,0,119,98
                 DEFB 0,0,120,98
                 DEFB 0,0,121,98
                 DEFB 0,0,125,98
                 DEFB 0,0,132,98
                 DEFB 0,0,133,98
                 DEFB 0,0,134,98
                 DEFB 0,0,135,98
                 DEFB 0,0,136,98
                 DEFB 0,0,137,98
                 DEFB 0,0,141,98
                 DEFB 0,0,143,98
                 DEFB 0,0,111,97
                 DEFB 0,0,112,97
                 DEFB 0,0,113,97
                 DEFB 0,0,114,97
                 DEFB 0,0,115,97
                 DEFB 0,0,116,97
                 DEFB 0,0,117,97
                 DEFB 0,0,118,97
                 DEFB 0,0,119,97
                 DEFB 0,0,120,97
                 DEFB 0,0,121,97
                 DEFB 0,0,122,97
                 DEFB 0,0,123,97
                 DEFB 0,0,127,97
                 DEFB 0,0,131,97
                 DEFB 0,0,132,97
                 DEFB 0,0,133,97
                 DEFB 0,0,134,97
                 DEFB 0,0,135,97
                 DEFB 0,0,136,97
                 DEFB 0,0,137,97
                 DEFB 0,0,138,97
                 DEFB 0,0,139,97
                 DEFB 0,0,140,97
                 DEFB 0,0,142,97
                 DEFB 0,0,111,96
                 DEFB 0,0,112,96
                 DEFB 0,0,113,96
                 DEFB 0,0,114,96
                 DEFB 0,0,115,96
                 DEFB 0,0,116,96
                 DEFB 0,0,117,96
                 DEFB 0,0,118,96
                 DEFB 0,0,119,96
                 DEFB 0,0,120,96
                 DEFB 0,0,121,96
                 DEFB 0,0,122,96
                 DEFB 0,0,123,96
                 DEFB 0,0,124,96
                 DEFB 0,0,125,96
                 DEFB 0,0,127,96
                 DEFB 0,0,129,96
                 DEFB 0,0,130,96
                 DEFB 0,0,131,96
                 DEFB 0,0,132,96
                 DEFB 0,0,133,96
                 DEFB 0,0,134,96
                 DEFB 0,0,135,96
                 DEFB 0,0,136,96
                 DEFB 0,0,137,96
                 DEFB 0,0,139,96
                 DEFB 0,0,140,96
                 DEFB 0,0,141,96
                 DEFB 0,0,142,96
                 DEFB 0,0,143,96
                 DEFB 0,0,112,95
                 DEFB 0,0,113,95
                 DEFB 0,0,114,95
                 DEFB 0,0,115,95
                 DEFB 0,0,116,95
                 DEFB 0,0,117,95
                 DEFB 0,0,118,95
                 DEFB 0,0,119,95
                 DEFB 0,0,120,95
                 DEFB 0,0,121,95
                 DEFB 0,0,122,95
                 DEFB 0,0,123,95
                 DEFB 0,0,124,95
                 DEFB 0,0,125,95
                 DEFB 0,0,126,95
                 DEFB 0,0,128,95
                 DEFB 0,0,129,95
                 DEFB 0,0,130,95
                 DEFB 0,0,131,95
                 DEFB 0,0,132,95
                 DEFB 0,0,133,95
                 DEFB 0,0,134,95
                 DEFB 0,0,135,95
                 DEFB 0,0,136,95
                 DEFB 0,0,137,95
                 DEFB 0,0,138,95
                 DEFB 0,0,139,95
                 DEFB 0,0,140,95
                 DEFB 0,0,141,95
                 DEFB 0,0,142,95
                 DEFB 0,0,112,94
                 DEFB 0,0,113,94
                 DEFB 0,0,114,94
                 DEFB 0,0,115,94
                 DEFB 0,0,117,94
                 DEFB 0,0,118,94
                 DEFB 0,0,119,94
                 DEFB 0,0,120,94
                 DEFB 0,0,121,94
                 DEFB 0,0,122,94
                 DEFB 0,0,123,94
                 DEFB 0,0,125,94
                 DEFB 0,0,126,94
                 DEFB 0,0,128,94
                 DEFB 0,0,130,94
                 DEFB 0,0,131,94
                 DEFB 0,0,132,94
                 DEFB 0,0,133,94
                 DEFB 0,0,134,94
                 DEFB 0,0,135,94
                 DEFB 0,0,136,94
                 DEFB 0,0,137,94
                 DEFB 0,0,138,94
                 DEFB 0,0,139,94
                 DEFB 0,0,140,94
                 DEFB 0,0,141,94
                 DEFB 0,0,142,94
                 DEFB 0,0,113,93
                 DEFB 0,0,114,93
                 DEFB 0,0,115,93
                 DEFB 0,0,116,93
                 DEFB 0,0,117,93
                 DEFB 0,0,119,93
                 DEFB 0,0,120,93
                 DEFB 0,0,121,93
                 DEFB 0,0,122,93
                 DEFB 0,0,123,93
                 DEFB 0,0,124,93
                 DEFB 0,0,125,93
                 DEFB 0,0,127,93
                 DEFB 0,0,129,93
                 DEFB 0,0,130,93
                 DEFB 0,0,131,93
                 DEFB 0,0,132,93
                 DEFB 0,0,133,93
                 DEFB 0,0,134,93
                 DEFB 0,0,136,93
                 DEFB 0,0,137,93
                 DEFB 0,0,138,93
                 DEFB 0,0,139,93
                 DEFB 0,0,140,93
                 DEFB 0,0,141,93
                 DEFB 0,0,114,92
                 DEFB 0,0,115,92
                 DEFB 0,0,116,92
                 DEFB 0,0,117,92
                 DEFB 0,0,118,92
                 DEFB 0,0,119,92
                 DEFB 0,0,120,92
                 DEFB 0,0,121,92
                 DEFB 0,0,122,92
                 DEFB 0,0,123,92
                 DEFB 0,0,124,92
                 DEFB 0,0,128,92
                 DEFB 0,0,130,92
                 DEFB 0,0,131,92
                 DEFB 0,0,132,92
                 DEFB 0,0,133,92
                 DEFB 0,0,134,92
                 DEFB 0,0,135,92
                 DEFB 0,0,136,92
                 DEFB 0,0,137,92
                 DEFB 0,0,138,92
                 DEFB 0,0,139,92
                 DEFB 0,0,117,91
                 DEFB 0,0,118,91
                 DEFB 0,0,119,91
                 DEFB 0,0,120,91
                 DEFB 0,0,122,91
                 DEFB 0,0,123,91
                 DEFB 0,0,124,91
                 DEFB 0,0,129,91
                 DEFB 0,0,131,91
                 DEFB 0,0,132,91
                 DEFB 0,0,133,91
                 DEFB 0,0,134,91
                 DEFB 0,0,135,91
                 DEFB 0,0,136,91
                 DEFB 0,0,137,91
                 DEFB 0,0,138,91
                 DEFB 0,0,118,90
                 DEFB 0,0,119,90
                 DEFB 0,0,120,90
                 DEFB 0,0,121,90
                 DEFB 0,0,122,90
                 DEFB 0,0,123,90
                 DEFB 0,0,126,90
                 DEFB 0,0,128,90
                 DEFB 0,0,132,90
                 DEFB 0,0,134,90
                 DEFB 0,0,136,90
                 DEFB 0,0,126,89
                 DEFB 0,0,129,89
                 DEFB 0,0,118,88
                 DEFB 0,0,120,88
                 DEFB 0,0,125,88
                 DEFB 0,0,126,88
                 DEFB 0,0,128,88
                 DEFB 0,0,136,88
                 DEFB 0,0,122,87
                 DEFB 0,0,126,87
                 DEFB 0,0,129,87
                 DEFB 0,0,134,87
                 DEFB 0,0,118,86
                 DEFB 0,0,120,86
                 DEFB 0,0,123,86
                 DEFB 0,0,125,86
                 DEFB 0,0,132,86
                 DEFB 0,0,119,85
                 DEFB 0,0,122,85
                 DEFB 0,0,126,85
                 DEFB 0,0,128,85
                 DEFB 0,0,136,85
                 DEFB 0,0,118,84
                 DEFB 0,0,120,84
                 DEFB 0,0,123,84
                 DEFB 0,0,118,83
                 DEFB 0,0,122,83
                 DEFB 0,0,125,83
                 DEFB 0,0,126,83
                 DEFB 0,0,127,83
                 DEFB 0,0,128,83
                 DEFB 0,0,129,83
                 DEFB 0,0,133,83
                 DEFB 0,0,135,83
                 DEFB 0,0,120,82
                 DEFB 0,0,124,82
                 DEFB 0,0,125,82
                 DEFB 0,0,129,82
                 DEFB 0,0,130,82
                 DEFB 0,0,119,81
                 DEFB 0,0,121,81
                 DEFB 0,0,125,81
                 DEFB 0,0,127,81
                 DEFB 0,0,129,81
                 DEFB 0,0,131,81
                 DEFB 0,0,135,81
                 DEFB 0,0,123,80
                 DEFB 0,0,133,80
                 DEFB 0,0,120,79
                 DEFB 0,0,122,79
                 DEFB 0,0,126,79
                 DEFB 0,0,130,79
                 DEFB 0,0,134,79
                 DEFB 0,0,121,78
                 DEFB 0,0,125,78
                 DEFB 0,0,129,78
                 DEFB 0,0,133,78
                 DEFB 0,0,122,77
                 DEFB 0,0,124,77
                 DEFB 0,0,126,77
                 DEFB 0,0,128,77
                 DEFB 0,0,131,77
                 DEFB 255,255,255,255,255                     ; End of data
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;Portal graphic lookup table
PORTAL_GRAPHIC_LOOKUP_TABLE:

                        DEFW PORTAL_GRAPHIC_A4,PORTAL_GRAPHIC_A3,PORTAL_GRAPHIC_A2,PORTAL_GRAPHIC_A1
                        DEFW PORTAL_GRAPHIC_B1,PORTAL_GRAPHIC_B2,PORTAL_GRAPHIC_B3,PORTAL_GRAPHIC_B4
                        DEFW PORTAL_GRAPHIC_B5,PORTAL_GRAPHIC_B6,PORTAL_GRAPHIC_B7,PORTAL_GRAPHIC_B8

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;CIRCLE_MOVE_DATA:
                        DEFB 107,104
                        DEFB 92,104
                        DEFB 76,104
                        DEFB 62,103
                        DEFB 48,102
                        DEFB 37,101
                        DEFB 27,100
                        DEFB 19,99
                        DEFB 13,97
                        DEFB 10,96
                        DEFB 10,94
                        DEFB 12,93
                        DEFB 16,91
                        DEFB 23,90
                        DEFB 32,88
                        DEFB 43,87
                        DEFB 55,86
                        DEFB 69,85
                        DEFB 84,85
                        DEFB 100,85
                        DEFB 116,85
                        DEFB 131,85
                        DEFB 147,85
                        DEFB 161,86
                        DEFB 174,87
                        DEFB 185,88
                        DEFB 195,89
                        DEFB 202,91
                        DEFB 207,92
                        DEFB 210,95
                        DEFB 208,96
                        DEFB 204,98
                        DEFB 198,99
                        DEFB 190,100
                        DEFB 179,102
                        DEFB 167,103
                        DEFB 154,103
                        DEFB 139,104
                        DEFB 123,104





; Circle data 39 coordinates
CIRCLE_MOVE_DATA:




;
                        DEFB 107,104
                        DEFB 92,104
                        DEFB 76,104
                        DEFB 62,103
                        DEFB 48,102
                        DEFB 37,101
                        DEFB 27,100
                        DEFB 19,99
                        DEFB 13,97
                        DEFB 10,96
                        DEFB 10,94
                        DEFB 12,93
                        DEFB 16,91
                        DEFB 23,90
                        DEFB 32,88
                        DEFB 43,87
                        DEFB 55,86
                        DEFB 69,85
                        DEFB 84,85
                        DEFB 100,85
                        DEFB 116,85
                        DEFB 131,85
                        DEFB 147,85
                        DEFB 161,86
                        DEFB 174,87
                        DEFB 185,88
                        DEFB 195,89
                        DEFB 202,91
                        DEFB 207,92
                        DEFB 210,95
                        DEFB 208,96
                        DEFB 204,98
                        DEFB 198,99
                        DEFB 190,100
                        DEFB 179,102
                        DEFB 167,103
                        DEFB 154,103
                        DEFB 139,104
                        DEFB 123,104
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set memory to page 0
MEMORY_SWITCH_0:
                        PUSH AF                         ;
                        XOR A                           ;
                        JP MEMORY_SWITCHER              ; Jump to switch memory
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set memory to page 1
MEMORY_SWITCH_1:
                        PUSH AF                         ;
                        LD A,1                          ;
                        JP MEMORY_SWITCHER              ; Jump to switch memory
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Set memory to page 4
MEMORY_SWITCH_4:
                        PUSH AF                         ;
                        LD A,4                          ;
                        JP MEMORY_SWITCHER              ; Jump to switch memory
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Set memory to page 6
MEMORY_SWITCH_6:
                        PUSH AF                         ;
                        LD A,6                          ;
                        JP MEMORY_SWITCHER              ; Jump to switch memory
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Set memory to page 3
MEMORY_SWITCH_3:
                        PUSH AF                         ;
                        LD A,3                          ;

; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Switches in memory bank at 49152
MEMORY_SWITCHER:
                        PUSH HL                         ;
                        LD (SWITCH_SETTING+1),A         ; Block
                        LD A,(23388)                    ; Previous value of port
                        AND 248                         ;
SWITCH_SETTING:         ;Bank number +1 to switch       ;
                        OR 0                            ; Select bank IN B
                        LD BC,32765                     ;
                        DI                              ;
                        LD (23388),A                    ;
                        OUT (C),A                       ;
                        POP HL                          ;
                        POP AF                          ;
                        EI                              ;
                        RET                             ;
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;   if *> 59000                                     ;
  ;                      zeuserror "out of room"         ;
  ;      endif

        if *> 46151                                       ;
                        zeuserror "out of room"         ;
      endif                                             ;



                       INCLUDE "No FutureAZ14_128_ZEUS_BANK0.asm"
                       INCLUDE "No FutureAZ14_128_ZEUS_BANK1.asm"
                       INCLUDE "No FutureAZ14_128_ZEUS_BANK3.asm"


; Stop planting code after this. (When generating a tape file we save bytes below here)
AppLast                 equ *-1                         ; The last used byte's address

; Generate some useful debugging commands

                        profile AppFirst,AppLast-AppFirst+1 ; Enable profiling for all the code

; Setup the emulation registers, so Zeus can emulate this code correctly

Zeus_PC                 equ AppEntry                    ; Tell the emulator where to start
Zeus_SP                 equ 49152                       ; Tell the emulator where to put the stack



; These generate some output files

                        ; Generate a SZX file
                   ;     output_szx AppFilename+".szx",$0000,AppEntry ; The szx file

                        ; If we want a fancy loader we need to load a loading screen
                        import_bin "No_Future.scr",$4000 ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                        output_tzx_auto AppFilename+".tzx",AppFilename+".tzx",AppFilename+".tzx" ; A tzx file using the loader


                        import_bin "No_Future.scr",$4000 ; Load a loading screen

                        ; Now, also generate a tzx file using the loader
                       ; output_tzx AppFilename+".tzx",AppFilename,"",AppFirst,AppLast-AppFirst,1,AppEntry ; A tzx file using the loader

                          ; Now, also generate a tzx file using the loader
                        output_tap_auto AppFilename+".tap",AppFilename+".tap",AppFilename+".tap"

