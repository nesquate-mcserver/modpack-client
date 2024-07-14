MINECRAFT_VERSION="1.21"
#PUBLISH_DIRECTORY="./publish/$MINECRAFT_VERSION"
PUBLISH_DIRECTORY="./publish/edge"
BASE_DIRECTORY="./base"
FO_BASE_DIRECTORY="./base-fo/Packwiz/$MINECRAFT_VERSION"

# Refresh base before merging
PREVIOUS=$(pwd)
cd $BASE_DIRECTORY
packwiz refresh
cd $PREVIOUS

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
