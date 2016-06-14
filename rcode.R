library(conduit)

## simpleInputHost_pipeline_xml, echo = FALSE, comment = NA
cat(readLines("examples/simpleInputHost/pipeline.xml"), sep = "\n")

## createVagrant_xml, echo = FALSE, comment = NA
cat(readLines("examples/simpleInputHost/createVagrant.xml"), sep = "\n")

## normalList_xml, echo = FALSE, comment = NA
cat(readLines("examples/simpleInputHost/normalList.xml"), sep = "\n")

## run_simpleInputHost
simpleInputHost <- loadPipeline(
    name = "simpleInputHost",
    ref = file.path("examples", "simpleInputHost", "pipeline.xml"))

result1 <- runPipeline(pipeline = simpleInputHost)
result1Tarball <- export(result1)

