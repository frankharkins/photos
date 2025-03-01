module Data exposing (image_groups)

import ImageUtils exposing (ImageGroup)

image_groups: List ImageGroup
-- Insert new files here, along with their description
image_groups = [
  { name = "Durdle Door",
    description = "Photos taken from around Durdle Door",
    images = [
      { filename = "durdle",
        title = "Durdle Door from Swyre Head",
        description = "After ~15 miles of trekking through fog, the sky cleared as we reached Bat's Head to reveal Durdle door"
      },
      { filename = "man-o-war",
        title = "Man O' War Cove",
        description = "I returned at blue hour to take this photo of Man O' War Cove, the other side of Durdle Door."
      },
      { filename = "bats-head",
        title = "Beach from Bat's Head",
        description = "Featuring red sand and a chalky sea"
      },
      { filename = "butter-rock",
        title = "Butter Rock",
        description = "Taken from Bat's Head"
      },
      { filename = "durdle-coastline",
        title = "Coastline around Durdle Door",
        description = "Shot from further up the hill"
      }
    ]
  },
  { name = "Sand reflections",
    description = "Sunset reflected in a thin film of water over the sand on Combsegate Beach",
    images = [
      { filename = "sand-reflection-silhouette",
        title = "Photographer on Combesgate Beach",
        description = "Silhouette of a photographer reflected in a thin film of water on Combesgate Beach"
      },
      { filename = "sand-reflection",
        title = "Sunset from Combesgate Beach",
        description = "Sunset reflected in a thin film of water on Combesgate Beach"
      }
    ]
  },
  { name = "Bypass",
    description = "Long exposures of Poynton bypass in the fog",
    images = [
      { filename = "bypass-1",
        title = "#1",
        description = ""
      },
      { filename = "bypass-2",
        title = "#2",
        description = ""
      },
      { filename = "bypass-3",
        title = "#3",
        description = ""
      }
    ]
  },
  { name = "Rocks reflecting",
    description = "Rocks reflected in water in the Lake District",
    images = [
      { filename = "rocks-reflecting-1",
        title = "#1",
        description = "Grasmere, Lake District"
      },
      { filename = "rocks-reflecting-2",
        title = "#2",
        description = "Grasmere, Lake District"
      },
      { filename = "rocks-reflecting-3",
        title = "#3",
        description = "Rydal Water, Lake District"
      }
    ]
  },
  { name = "South West Coast Path",
    description = "Snaps from various holiday along the South West Coast Path",
    images = [
      { filename = "combesgate-beach",
        title = "Sand ripples on Combesgate Beach",
        description = "Near Woolacombe"
      },
      { filename = "coastline-houns-tout",
        title = "Green and grey coastline",
        description = "Looking west from near Houns Tout"
      },
      { filename = "black-rock-beach",
        title = "Black rock beach",
        description = "East along the coast from Kimmeridge Bay"
      },
      { filename = "lonely-seal",
        title = "Lonely seal",
        description = "Chillin' off the Isle of Portland"
      },
      { filename = "telescope",
        title = "Telescope in Ilfracombe",
        description = "Overlooking Lantern Hill Lighthouse"
      }
    ]
  },
  { name = "Beachy Head",
    description = "Photos around Beachy Head, Eastbourne",
    images = [
      { filename = "beachy-head-1",
        title = "Lighthouse",
        description = "Lighthouse at blue hour"
      },
      { filename = "beachy-head-2",
        title = "Grass",
        description = "Golden grass against a grey sea"
      },
      { filename = "beachy-head-3",
        title = "Eastbourne",
        description = "Eastbourne from the path to Beachy Head"
      }
    ]
  },
  { name = "Blue lines",
    description = "Experiments with computer-generated patterns and slide film",
    images = [
      { filename = "waves-1",
        title = "#1",
        description = ""
      },
      { filename = "waves-2",
        title = "#2",
        description = ""
      },
      { filename = "waves-3",
        title = "#3",
        description = ""
      }
    ]
  },
  { name = "Macro",
    description = "Using a home-made bellows system, inspired by Karl Blossfeldt. This stuff if hard.",
    images = [
      { filename = "mushroom-1",
        title = "Mushroom #1",
        description = ""
      },
      { filename = "mushroom-2",
        title = "Mushroom #2",
        description = ""
      },
      { filename = "mushroom-3",
        title = "Mushroom #3",
        description = ""
      }
    ]
  },
  { name = "Aquarium",
    description = "Trip to Sea Life aquarium, London",
    images = [
      { filename = "clownfish",
        title = "Clownfish",
        description = "The clownfish were beautiful, would recommend"
      },
      { filename = "otherfish",
        title = "Blue fish",
        description = "No idea what kind of fish these are"
      },
      { filename = "jellyfish",
        title = "Jellyfish",
        description = "Japanese Sea Nettle"
      }
    ]
  },
  { name = "London brutalism",
    description = "From a tour of brutalist architecture in London",
    images = [
      { filename = "alexandra-road-estate",
        title = "Alexandra Road Estate",
        description = ""
      },
      { filename = "alexandra-road-estate-2",
        title = "Stairs",
        description = "Also at Alexandra Road Estate"
      },
      { filename = "royal-college-physicians",
        title = "Royal College of Physicians",
        description = ""
      },
      { filename = "southbank-centre",
        title = "Southbank Centre",
        description = "Featuring light leaks"
      }
    ]
  },
  { name = "Lagos",
    description = "Snapshots from a holiday to Portugal",
    images = [
      { filename = "lagos-1",
        title = "#1",
        description = ""
      },
      { filename = "lagos-2",
        title = "#2",
        description = ""
      },
      { filename = "lagos-3",
        title = "#3",
        description = ""
      },
      { filename = "lagos-4",
        title = "#4",
        description = ""
      },
      { filename = "lagos-5",
        title = "#5",
        description = ""
      },
      { filename = "lagos-6",
        title = "#6",
        description = ""
      },
      { filename = "lagos-7",
        title = "#7",
        description = ""
      },
      { filename = "lagos-8",
        title = "#8",
        description = ""
      }
    ]
  },
  { name = "Cyanotypes",
    description = "Scans of small prints made using the cyanotype technique",
    images = [
      { filename = "cyanotype-1",
        title = "Autumn willow",
        description = "Near Poynton Pool. A red filter renders yellow leaves white and others dark."
      },
      { filename = "cyanotype-2",
        title = "Tree on Wandsworth common",
        description = "In the fog"
      }
    ]
  }]
