#
# First, list the files to parse. Build a file list.
#

if [[ -n "$1" && -n "$2"  && -n "$3" ]];then
  SRC_DIR=$1 
  DB_DIR=$2
  DB=$3
else
  echo "Usage: $0 SRC_DIR DB_DIR DBNAME"
  exit 1
fi

if [[ ! -d "$DB_DIR" ]];then

echo "$DB_DIR doesn't exist,"
echo "should I create it for you?[y] or exit[n]?"
read nas

if [ "$nas" != "Y" ] && [ "$nas" != "y" ];then
exit 0;
fi

echo "Create new db folder $DB_DIR"
mkdir "$DB_DIR" 
fi

echo "This will generate list file: $DB_DIR/$DB.files"
echo "Build files list."
echo "SRC_DIR: $SRC_DIR, DB: $DB_DIR/$DB.files"
echo "Building...."

if [[ -d "$SRC_DIR" ]];then
time find $SRC_DIR ! -path "$SRC_DIR/out*" ! -path "$SRC_DIR/src/openssl/app*" ! -path "$SRC_DIR/src/uClibc*" ! -path "$SRC_DIR/src/openssl/include*" ! -path "$SRC_DIR/src/openssl/test*" ! -path "$SRC_DIR/src/kernel/linux-2.6.21.5/arch*" ! -path "$SRC_DIR/mipsel-bcm/SOURCES*"  ! -path "$SRC_DIR/src/kernel/linux-2.6.21.5/drivers*" ! -path "$SRC_DIR/src/kernel/linux-2.6.21.5/include*" ! -path "$SRC_DIR/src/kernel/linux/arch*" ! -path "$SRC_DIR/src/kernel/linux/include*" ! -path "$SRC_DIR/src/kernel/linux/drivers*" -name "*.[ch]" -o -name "*.cli" > $DB_DIR/$DB.files
else
  echo "Dir doesn't exist."
fi

echo "Build files list done. Next, build cscope db."


#
# Second, parse files to build cscope db
#

  FILELIST="$DB.files"
  CSCOPENAME="$DB"

if [[ -n "$DB_DIR" && -n "$FILELIST" && -n "$CSCOPENAME" ]];then
  echo "Build cscope db. "
  echo "This will generate cscope file: $DB_DIR/$CSCOPENAME.cscope"
  echo "Building...."
else
  echo "Usage: $0 DB_DIR FILE_LIST_NAME DESIRED_CSCOPE_NAME"
  exit 1
fi

if [ -d $DB_DIR ];then
#  echo "cscope -bqk -i $DB_DIR/$FILELIST -f $DB_DIR/$CSCOPENAME.cscope"
  echo "cscope -bk -i $DB_DIR/$FILELIST -f $DB_DIR/$CSCOPENAME.cscope"
 
  time cscope -bk -i $DB_DIR/$FILELIST -f $DB_DIR/$CSCOPENAME.cscope
else
  echo "Invalid directory: $DB_DIR"
fi

#
# Build cscope db done. Next, build ctag db.
#

  CTAGSNAME="$DB"

if [[ -n "$DB_DIR" && -n "$FILELIST" && -n "$CTAGSNAME" ]];then
  echo "Build cscope db done. Next, build ctag db."
  echo "This will generate tag file: $DB_DIR/$CTAGSNAME.taglist"
else
  echo "Usage: $0 DB_DIR FILE_LIST_NAME CTAGSNAMES"
  exit 1
fi

  echo "ctags -L $DB_DIR/$FILELIST -f $DB_DIR/$CTAGSNAME.taglist"

  time ctags -L $DB_DIR/$FILELIST -f $DB_DIR/$CTAGSNAME.taglist 

  echo "Build ctag list done."

  echo "Set vim cscope db now."
