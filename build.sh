baseDirForScriptSelf=$(cd "$(dirname "$0")"; pwd)
dotnet publish "${baseDirForScriptSelf}/testdotnet.csproj" -c Release -p:PublishProfile=osx-x64 -p:DeployOnBuild=true -p:ExtraDefineConstants=osx-x64 --nologo

dotnet publish "${baseDirForScriptSelf}/testdotnet.csproj" -c Release -p:PublishProfile=osx-arm64 -p:DeployOnBuild=true -p:ExtraDefineConstants=osx-arm64 --nologo

lipo -create "${baseDirForScriptSelf}/bin/Release/Publish/osx-x64/testdotnet" "${baseDirForScriptSelf}/bin/Release/Publish/osx-arm64/testdotnet" -output "${baseDirForScriptSelf}/bin/Release/Publish/testdotnet"