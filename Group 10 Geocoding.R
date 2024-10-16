stanbic_branches <- read.csv("C:\\Users\\HP\\Documents\\Sail Group 10\\Stanbic_Ibtc_Branches.csv")
View(stanbic_branches)

usethis::edit_r_environ()
Sys.setenv(GOOGLEGEOCODE_API_KEY = "")

geo_code_tbl <- stanbic_branches %>% 
  tidygeocoder::geocode(
    address = BRANCH.UPDATED,
    method = "google",
  )

View(geo_code_tbl)

geo_code_tbl2 <- geo_code_tbl %>% 
  drop_na(long, lat)

View(geo_code_tbl2)

dim(geo_code_tbl2)

stanbic_branches_sf <- geo_code_tbl2 %>% 
  st_as_sf(
    coords = c("long", "lat"), # if its one you use select(-x)
    crs = 4326
  )
mapview(stanbic_branches_sf)


stanbic_branches_sf %>% 
  leaflet() %>% 
  addProviderTiles(providers$Esri.WorldImagery, group = "World Imagery") %>% 
  addProviderTiles(providers$Stadia.StamenTonerLite, group = "Toner Lite") %>% 
  addLayersControl(baseGroups = c("Toner Lite", "World Imagery")) %>% 
  addMarkers(label = stanbic_branches_sf$BRANCH.UPDATED,
             clusterOptions = markerClusterOptions(),
             popup = ifelse(stanbic_branches_sf$State != NA,
                            stanbic_branches_sf$State,
                            "Not sure of the bank's location"))
