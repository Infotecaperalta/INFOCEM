DO SETS		
clear
@ 16,35 prompt " CODIGO "
@ 16,50 prompt " NOMBRE "
menu to w
do case
      case w=1
        use f_clie index fclie1,fclie2
        set order to 1
        brow
        set order to 0
        close database
        clear
        do logo        
        return
      case w=2
        use f_clie index fclie1,fclie2
        set order to 2
        brow 
        set order to 0
        close database
        clear
        do logo        
        return
endcase
