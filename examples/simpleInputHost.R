### create simpleInputHost pipeline
library(conduit)

## createVagrant module
createVagrant <- module(
    name = "createVagrant", language = moduleLanguage("bash"),
    description = "create a vagrant machine and spin it up",
    sources = list(moduleSource(scriptVessel(readLines(
        file.path("simpleInputHost", "createVagrant.sh"))))),
    outputs = list(
        moduleOutput(name = "vagrantMachine.xml",
                     vessel = fileVessel("vagrantMachine.xml"),
                     format = ioFormat("XML File"))))

## res1 <- runModule(module = createVagrant, targetDirectory = tempdir())

normalList <- module(
    name = "normalList", language = moduleLanguage("python2"),
    description = "generate list of 10 numbers from norm(0,1)",
    host = moduleInputHost(name = "vagrantMachine.xml"),
    inputs = list(
        moduleInput(name = "vagrantMachine.xml",
                    vessel = fileVessel("vagrantMachine.xml"),
                    format = ioFormat("XML file"))),
    sources = list(
        moduleSource(scriptVessel(readLines(file.path(
            "simpleInputHost", "normalList.py"))))),
    outputs = list(
        moduleOutput(name = "x",
                     vessel = internalVessel("x"),
                     format = ioFormat("python list"))))

## res2 <- runModule(module = normalList, targetDirectory = tempdir(),
##                   inputObjects = list(
##                       `vagrantMachine.xml` =
##                           res1$outputList$vagrantMachine.xml$ref))

simpleInputHost <- pipeline(
    name = "simpleInputHost",
    description = "demonstrate use of <host><moduleInput/></host>",
    components = list(createVagrant, normalList),
    pipes = list(
        pipe("createVagrant", "vagrantMachine.xml", "normalList",
             "vagrantMachine.xml")))

## res3 <- runPipeline(pipeline = simpleInputHost,
##                     targetDirectory = tempdir())

exportPipeline(pipeline = simpleInputHost, targetDirectory = ".")
