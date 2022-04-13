aws s3 sync ./build/static "s3://$BUCKET_NAME/static" --cache-control max-age=3156000
aws s3 sync ./build/ "s3://$BUCKET_NAME" --exclude "static/*" --cache-control no-cache
aws cloudfront create-invalidation \
	--distribution-id "$DISTRIBUTION_ID" \
	--paths '/*' \
	--query Invalidation.Id \
	--output text
