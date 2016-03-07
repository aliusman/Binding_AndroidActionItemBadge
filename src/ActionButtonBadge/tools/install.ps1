# Runs every time a package is installed in a project

param($installPath, $toolsPath, $package, $project)

# $installPath is the path to the folder where the package is installed.
# $toolsPath is the path to the tools directory in the folder where the package is installed.
# $package is a reference to the package object.
# $project is a reference to the project the package was installed to.

$deployLayoutTarget = "$project\Resources\layout\"
$deployDrawableTarget = "$project\Resources\drawable"

$deployLayoutSource = join-path $installPath 'content/layout'
$deployDrawableSource = join-path $installPath 'content/drawable'


if (!(test-path $deployLayoutTarget)) {
	mkdir $deployLayoutTarget
}

if (!(test-path $deployDrawableTarget)) {
	mkdir $deployDrawableTarget
}

Copy-Item "$deployLayoutSource/*" $deployLayoutTarget -Recurse -Force
Copy-Item "$deployDrawableSource/*" $deployDrawableTarget -Recurse -Force

