# Welcome to WiLDr!

The WiLDr package is a compilation of R functions useful for working with the WiLD Toolkit.

The WiLD Toolkit is the core product of www.WiLDToolkit.com and is a tool-based leadership development process, built on decades of research from Industrial-Organizational Psychology.

This package is intended to be used by members of Dr. McKenna's research team at Seattle Pacific University.

There are several functions within WiLDr:
* _getSex_ returns a dataframe of participants' sex (Male/Female/NA)
* _getAge_ returns a dataframe of participant's age (in years)
* _profPersonality_ returns a dataframe of participants' Big Five personality scores
* _pullWiLD_ returns a dataframe with all items from the specified WiLD tools

WiLDr is not hosted on the CRAN and must be installed directly through GitHub.
The easiest way to do this is with the _devtools_ package and the following code:
**install_github("Unperterbed/WiLDr")**