//********************************************************************************************************************//
//
// Copyright (C) 2018 - 2022 J&J Ideenschmiede GmbH <info@jj-ideenschmiede.de>
//
// This file is part of goten-cli.
// All code may be used. Feel free and maybe code something better.
//
// Author: Jonas Kwiedor (aka gowizzard)
//
//********************************************************************************************************************//

package main

import (
	"fmt"
	"github.com/gowizzard/goten"
	"os"
	"strconv"
)

func main() {

	// Check arguments
	if len(os.Args) == 2 {

		// Format to number
		length, err := strconv.Atoi(os.Args[1])
		if err != nil {

			// Log error
			fmt.Println("Sorry your argument is not a number.")

			// Exit
			os.Exit(1)

		}

		// Generate the password
		password := goten.New(length)

		// Print the password
		fmt.Println("Here is your token/password:")
		fmt.Println(password)

		// Exit
		os.Exit(0)

	} else {

		// Log error
		fmt.Println("Usage: goten <length>")

		// Exit with error code
		os.Exit(1)

	}

}
