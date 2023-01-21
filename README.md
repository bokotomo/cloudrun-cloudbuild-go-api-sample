# cloudrun-cloudbuild-go-api-sample

```
// cloundbuild config
_SERVICE_CLOUDRUN_NAME=
_CLOUDRUN_REGION=
_CLOUDRUN_REPOSITORY=
_CLOUDRUN_IMAGE=
```

## check

```
curl https://CLOUDRUN_URI/v1/item

{"Message":"hello"}
```

## local

```
cd infrastructure/docker/
docker-compose up -d
docker-compose exec go-api-sample ash
go run main.go

curl http://localhost:3333/v1/item

{"Message":"hello"}
```

## Artifact Registry

```
artifactregistry.projectsettings.update、storage.buckets.update
```
