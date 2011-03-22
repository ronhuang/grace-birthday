/*
 * Jakefile
 * GraceBirthday
 *
 * Created by Ron Huang on March 22, 2011.
 * Copyright 2011, Ron Huang All rights reserved.
 */

var ENV = require("system").env,
    FILE = require("file"),
    JAKE = require("jake"),
    task = JAKE.task,
    FileList = JAKE.FileList,
    app = require("cappuccino/jake").app,
    configuration = ENV["CONFIG"] || ENV["CONFIGURATION"] || ENV["c"] || "Debug",
    OS = require("os");

app ("GraceBirthday", function(task)
{
    task.setBuildIntermediatesPath(FILE.join("Build", "GraceBirthday.build", configuration));
    task.setBuildPath(FILE.join("Build", configuration));

    task.setProductName("GraceBirthday");
    task.setIdentifier("org.ronhuang.GraceBirthday");
    task.setVersion("1.0");
    task.setAuthor("Ron Huang");
    task.setEmail("ronhuang@gmail.com");
    task.setSummary("GraceBirthday");
    task.setSources((new FileList("**/*.j")).exclude(FILE.join("Build", "**")));
    task.setResources(new FileList("Resources/**"));
    task.setIndexFilePath("index.html");
    task.setInfoPlistPath("Info.plist");

    if (configuration === "Debug")
        task.setCompilerFlags("-DDEBUG -g");
    else
        task.setCompilerFlags("-O");
});

task ("default", ["GraceBirthday"], function()
{
    printResults(configuration);
});

task ("build", ["default"]);

task ("debug", function()
{
    ENV["CONFIGURATION"] = "Debug";
    JAKE.subjake(["."], "build", ENV);
});

task ("release", function()
{
    ENV["CONFIGURATION"] = "Release";
    JAKE.subjake(["."], "build", ENV);
});

task ("run", ["debug"], function()
{
    OS.system(["open", FILE.join("Build", "Debug", "GraceBirthday", "index.html")]);
});

task ("run-release", ["release"], function()
{
    OS.system(["open", FILE.join("Build", "Release", "GraceBirthday", "index.html")]);
});

task ("deploy", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Deployment", "GraceBirthday"));
    OS.system(["press", "-f", FILE.join("Build", "Release", "GraceBirthday"), FILE.join("Build", "Deployment", "GraceBirthday")]);
    printResults("Deployment")
});

task ("desktop", ["release"], function()
{
    FILE.mkdirs(FILE.join("Build", "Desktop", "GraceBirthday"));
    require("cappuccino/nativehost").buildNativeHost(FILE.join("Build", "Release", "GraceBirthday"), FILE.join("Build", "Desktop", "GraceBirthday", "GraceBirthday.app"));
    printResults("Desktop")
});

task ("run-desktop", ["desktop"], function()
{
    OS.system([FILE.join("Build", "Desktop", "GraceBirthday", "GraceBirthday.app", "Contents", "MacOS", "NativeHost"), "-i"]);
});

function printResults(configuration)
{
    print("----------------------------");
    print(configuration+" app built at path: "+FILE.join("Build", configuration, "GraceBirthday"));
    print("----------------------------");
}
