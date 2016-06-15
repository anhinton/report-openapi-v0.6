### create some warnVersion examples, dog
library(conduit)

listOfThings <- module(
    name = "listOfThings",
    language = moduleLanguage("R", version = "2.14.1"),
    sources = list(moduleSource(scriptVessel(
        readLines(file.path("warnVersion", "listOfThings.R"))))),
    outputs = list(
        moduleOutput(name = "listOfThings",
                     internalVessel("listOfThings"),
                     ioFormat("R list object"))))

saveModule(module = listOfThings, targetDirectory = "warnVersion")
