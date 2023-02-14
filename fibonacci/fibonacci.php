<?php

    $numterms = $_GET['numterms'];
    if ($numterms == null) {
        $numterms = 10;
    }
    elseif ($numterms > 20) {
        echo "Max. number of terms (for demo purpose) is capped at 20<br>";
        $numterms = 20;
    }

    echo "Number of terms in the sequence: $numterms <br>";

    // PHP code to get the Fibonacci series
    // Recursive function for fibonacci series.
    function Fibonacci($number){
             // if and else if to generate first two numbers
        if ($number == 0) {
            return 0;
        }        
        else if ($number == 1){
            return 1;
        }   
        // Recursive Call to get the upcoming numbers
        else {
            return (Fibonacci($number-1) + Fibonacci($number-2));        
        }
                
    }

    echo "Fibonacci sequence: ";
    // Driver Code
    for ($counter = 0; $counter < $numterms; $counter++){  
        echo Fibonacci($counter),', ';
    }
?> 