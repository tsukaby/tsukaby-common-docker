### Packaging

zip tsukaby-common-docker-`date +"%Y-%m-%d-%H:%M:%S"` -r \
  ./eb/.* \
  ./eb/*

### Deploy

eb create prod-tsukaby-common --cfg prod-tsukaby-common-sc --region ap-northeast-1 --cname tsukaby-common
