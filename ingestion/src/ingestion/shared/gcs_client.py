from pathlib import Path

import structlog
from google.cloud import storage

logger = structlog.get_logger()


def upload_to_gcs(bucket_name: str, source_path: Path, destination_blob: str) -> None:
    """Idempotent upload — overwrites existing blob if present."""
    client = storage.Client()
    bucket = client.bucket(bucket_name)
    blob = bucket.blob(destination_blob)
    blob.upload_from_filename(source_path)
    logger.info(
        "gcs_upload_complete",
        bucket=bucket_name,
        blob=destination_blob,
        size_bytes=source_path.stat().st_size,
    )
