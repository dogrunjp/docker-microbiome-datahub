# Docker Microbiome Datahub

## Setup
```
git clone git@github.com:microbiomedatahub/docker-microbiome-datahub.git
cd docker-microbiome-datahub
git clone -b develop git@github.com:microbiomedatahub/microbiome-datahub.git
git clone https://github.com/ddbj/ddbj-ld-proxy.git
docker compose up
# ES setup
git clone git@github.com:microbiomedatahub/dataflow_prototype.git
bash setup.sh
```


### setup.sh

```
# index templateファイルによる個々のインデックス設定
curl -H "Content-Type: application/json" -XPUT localhost:9200/_template/mdatahub_project -d @dataflow_prototype/bin/index_template/mdatahub_project.json 
curl -H "Content-Type: application/json" -XPUT localhost:9200/_template/mdatahub_genome -d @dataflow_prototype/bin/index_template/mdatahub_genome.json

# インデックスがすでに存在していた場合一度indexを捨てる
#curl -XDELETE http://localhost:9200/bioproject  
#curl -XDELETE http://localhost:9200/genome

# bulk import
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/_bulk?pretty' --data-binary @microbiome-data/test/mdatahub_index_project.jsonl_part_000
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/_bulk?pretty' --data-binary @microbiome-data/test/mdatahub_index_genome.jsonl_part_000
```

### ElasticSearchへの系統組成比較データのインポート
* TODO: 動作確認
```
cd data
curl -H 'Content-Type: application/x-ndjson' -XPOST 'localhost:9200/_bulk?pretty' --data-binary @taxonomic_comparison.jsonl
```


You open `localhost:8080` in your host browser.
