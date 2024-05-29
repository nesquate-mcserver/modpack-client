MINECRAFT_VERSION="1.20.4"
PUBLISH_DIRECTORY="./publish/$MINECRAFT_VERSION"
BASE_DIRECTORY="./base"
FO_BASE_DIRECTORY="./base-fo/Packwiz/$MINECRAFT_VERSION"

if [ -d $PUBLISH_DIRECTORY ]; then
    rm -rf $PUBLISH_DIRECTORY
fi

mkdir -p $PUBLISH_DIRECTORY

for file in $FO_BASE_DIRECTORY/*; do
    cp -R $file $PUBLISH_DIRECTORY
done

for file in $BASE_DIRECTORY/*; do
    cp -Rf $file $PUBLISH_DIRECTORY
done

PREVIOUS=$(pwd)
cd $PUBLISH_DIRECTORY
packwiz modrinth export
cd $PREVIOUS