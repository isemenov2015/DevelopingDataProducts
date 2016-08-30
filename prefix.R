
prefix <- function(i) {
  switch (i,
          'No of bedrooms',
          'Total No of rooms',
          'No of bathrooms (0.5 for no shower/tub)',
          'House age',
          'Living area',
          'Heating type',
          'Fuel type',
          'Sewer type',
          'No of fireplaces',
          'Waterfront?',
          'New construction?',
          'Central air',
          'College grads %',
          'Lot size',
          'Land value'
  )
}

fieldname <- function(i) {
  switch (i,
          'bedrooms',   #1
          'rooms',      #2
          'bathrooms',  #3
          'age',        #4
          'livingArea', #5
          'heating',    #6
          'fuel',       #7
          'sewer',      #8
          'fireplaces', #9
          'waterfront', #10
          'newConstruction', #11
          'centralAir', #12
          'pctCollege', #13
          'lotSize',    #14
          'landValue'   #15
  )
}