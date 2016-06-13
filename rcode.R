library(conduit)

## simpleInputHost
simpleInputHost <- loadPipeline(
    name = "simpleInputHost",
    ref = file.path("examples", "simpleInputHost", "pipeline.xml"))

result1 <- runPipeline(pipeline = simpleInputHost)
export(result1)
