d1 <- read.csv('Tabla de Bancas de Loterias y  Deportivas.csv', sep = ';', encoding = 'latin1', check.names = F)
d1_sf <- st_as_sf(d1, coords = c('LONGITUD', 'LATITUD'))
plot(d1_sf)


d1_sf_utm <- d1_sf %>% st_transform(crs = 32619)



tmap_mode(mode = 'view')

tm_shape(d1_sf_utm) +
  tm_dots(col = 'NUMERO DE EMPLEADOS', size = 'NUMERO DE EMPLEADOS') +
  tm_text(text = 'NOMBRE', size = 0.8) +
  tm_basemap(server = 'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png')
