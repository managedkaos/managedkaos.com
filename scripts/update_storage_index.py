"""
This script lists the contents of a Google Cloud Storage (GCS)
bucket and generates a simple HTML page
"""
import os
from google.cloud import storage

# Constants
DEFAULT_BUCKET_NAME = "g.managedkaos.com"
DEFAULT_PUBLIC_URL = "https://storage.googleapis.com"


def list_bucket_contents(bucket_name):
    """
    List the contents of a GCS bucket.
    """

    client = storage.Client()
    bucket = client.get_bucket(bucket_name)
    blobs = bucket.list_blobs()

    return [blob.name for blob in blobs]


def generate_html_page(bucket_name, file_names):
    """
    Generate a simple HTML page listing the contents of the bucket.
    """

    html_content = f"""
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>{bucket_name}</title>
    </head>
    <body>
        <h1>Contents of {bucket_name}</h1>
        <ul>
    """

    for file_name in file_names:
        public_url = f"{DEFAULT_PUBLIC_URL}/{bucket_name}/{file_name}"
        html_content += f'<li><a href="{public_url}">{file_name}</a></li>\n'

    html_content += """
        </ul>
    </body>
    </html>
    """

    return html_content


def write_html_to_bucket(bucket_name, html_content):
    """
    Upload the generated HTML page back to the GCS bucket as index.html.
    """

    client = storage.Client()
    bucket = client.get_bucket(bucket_name)
    blob = bucket.blob("index.html")

    # Write the HTML content as index.html to the bucket
    blob.upload_from_string(html_content, content_type="text/html")
    print(f"index.html has been written to {bucket_name}")


def main():
    """
    Main entry point of the script.
    """

    # Get the bucket name from the environment variable or use a default
    bucket_name = os.getenv("BUCKET_NAME", DEFAULT_BUCKET_NAME)

    # List the contents of the bucket
    file_names = list_bucket_contents(bucket_name)

    # Generate the HTML page
    html_content = generate_html_page(bucket_name, file_names)

    # Write the HTML page back to the bucket as index.html
    write_html_to_bucket(bucket_name, html_content)


if __name__ == "__main__":
    main()
