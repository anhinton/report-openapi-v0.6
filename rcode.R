library(conduit)

## simpleInputHost_pipeline_xml, echo = FALSE, comment = NA
cat(readLines(file.path("examples",
                        "simpleInputHost",
                        "pipeline.xml")), sep = "\n")

## createVagrant_xml, echo = FALSE, comment = NA
cat(readLines(file.path("examples",
                        "simpleInputHost",
                        "createVagrant.xml")), sep = "\n")

## normalList_xml, echo = FALSE, comment = NA
cat(readLines(file.path("examples",
                        "simpleInputHost",
                        "normalList.xml")), sep = "\n")

## run_simpleInputHost
simpleInputHost <- loadPipeline(
    name = "simpleInputHost",
    ref = file.path("examples", "simpleInputHost", "pipeline.xml"))

result1 <- runPipeline(pipeline = simpleInputHost)
result1Tarball <- export(result1)

## listOfThings_module, echo = FALSE, comment = NA
cat(readLines(file.path("examples",
                        "warnVersion",
                        "listOfThings.xml")), sep = "\n")

## warnVersionTrue
listOfThings <- loadModule(
    name = "listOfThings",
    ref = file.path("examples", "warnVersion", "listOfThings.xml"))
result2 <- runModule(module = listOfThings, targetDirectory = tempdir(),
                     warnVersion = TRUE)
result2tarball <- export(result2)

## execLanguageVersion
cat(paste0("Language: '", result2$component$language$language, "'"),
    paste0("Version: '", result2$component$language$version, "'"), sep = "\n")
