rm(list=ls())

if (!require("GOplot")) install_github('wencke/wencke.github.io')

require(data.table)

data <- read.csv("proteinToProcess.csv", row.names = 1, header= TRUE)

circ <- circle_dat(EC$david, EC$genelist)

GOBar(subset(circ, category == 'BP'))

chord <- chord_dat(data = circ, genes = EC$genes, process = EC$process)
GOChord(data, space=0.02,  gene.space=0.175, gene.size=3, lfc.min=min(data$FC), lfc.max=max(data$FC),lfc.col=c('red','black','cyan'))
GOChord