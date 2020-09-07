# Reverse-Engineering



Testing for Encryption vs Compression

1. Check for Entropy 
        Binwalk
        binvis.io
        
2. Use ent tool to check Chi Square Distribution and Pi Approximation Error
   
     Algorithm  CHI         Pi Approx error
        None	15048.60	    .920%
         AES	351.68	      .022%
        3DES	357.50	      .029%
        LZMA	253.54	      .032%
        Gzip	11814.28	    .765%
        
      Command - ent -c Firmware.BIN  
   
   As you can see, gzip has extreme differences between expected and observed data randomness, making it easy to identify. LZMA is much closer to the AES and 3DES encryption results, but still shows significant variations, particularly on the chi square distribution.
   
   Using these tests, we can usually determine if an unknown block of data is encrypted or compressed and proceed with any further analysis accordingly
