function get-datestamp {
    Param
    (
        [Parameter(Mandatory=$false,
                   Position=0)]
        $type="datestamp"
    )
    $UTC = (Get-Date).ToUniversalTime()
    switch ($type){
        "datestamp"{get-date $UTC -Format "yyyy-MM-dd"}
        "timestamp"{get-date $UTC -Format "yyyy-MM-ddTHH:mm:ssK"}
        "cat"      {get-date $UTC -Format "yyyy-MM-dd" -OutVariable datestamp | Out-Null
            $a=@"
                         .-.
                          \ \
                           \ \
                            | |
                            | |
          /\---/\   _,---._ | |
         /^   ^  \,'       `. ;
        ( O   O   )           ;
         `.=o=__,'  $datestamp \
           /         _,--.__   \
          /  _ )   ,'   `-. `-.   \
         / ,' /  ,'        \ \ \ \
        / /  / ,'          (,_)(,_)
       (,;  (,,)
"@
            $a
        }
    }
}
