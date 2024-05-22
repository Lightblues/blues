# ========================================================
#                       MinIO Client
brew install minio/stable/mc
mc --help

# set alias
mc alias set ${MINIO_ALIAS} ${MINIO_HOST} ${MINIO_ACCESS_KEY} ${MINIO_ACCESS_KEY_SECRET}
# test
mc admin info ${MINIO_ALIAS}
# set public
mc anonymous set public ${MINIO_ALIAS}/img
# test get file
wget http://cloud.easonsi.site/img/_meta/about.jpg
