library(grid) 
library(VennDiagram)


dr=scan("dr_Pfam.txt")
mr=scan("mr_Pfam.txt")
mh=scan("mh_Pfam.txt")
op=scan("op_Pfam.txt")

venn.plot <- venn.diagram(
  x = list(
    Dr = dr,
    Mr = mr,
    Mh = mh,
    Op = op
  ),
  filename = "Venn_result.tiff",
  col = "transparent",
  fill = c("cornflowerblue", "green", "yellow", "darkorchid1"),
  alpha = 0.5,
  label.col = c("orange", "white", "darkorchid4", "white",
                "white", "white", "white", "white", "darkblue", "white",
                "white", "white", "white", "darkgreen", "white"),
  cex = 1.5,
  fontfamily = "serif",
  fontface = "bold",
  cat.col = c("darkblue", "darkgreen", "orange", "darkorchid4"),
  cat.cex = 1.5,
  cat.pos = 0,
  cat.dist = 0.06,
  cat.fontfamily = "serif",
  rotation.degree = 90,
  margin = 0.2,
);