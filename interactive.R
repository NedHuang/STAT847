library(loon.data)
data(igg1)
names(igg1)

igg1_3d <- with(igg1,
                l_plot3D(x, y, z,
                         linkingGroup = "igg1",
                         itemLabel =
                           paste0("Residue: ", residueName, " (",
                                  residue, ")","\n",
                                  "Group: ", group),
                         showItemLabels = TRUE)
)
