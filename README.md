ThetaData ThetaTerm Docker Image
================================

A Docker image for the ThetaData Terminal (v3), which serves the
ThetaData REST API and MCP server on port 25503.

Adapted and updated from: https://gist.github.com/dvush/c6851902ffe585c5fbebf5503bc3908b

Logging in
----------

`entrypoint.sh` picks the login from the environment:

- `THETADATA_API_KEY_FILE`: a file holding an API key, generated in the
  [ThetaData portal](https://www.thetadata.net/portal/api_key). The
  entrypoint passes it to the terminal as `THETADATA_API_KEY` in the
  terminal's own environment, so the key stays out of the container's
  configuration (`docker inspect`). API keys need Theta Bootstrap and
  Theta Terminal `20260615` or later.
- `THETADATA_CREDS_FILE`: a file with your ThetaData email address on
  the first line and password on the second.
- Neither: the terminal looks for `THETADATA_API_KEY`, then a `.env`
  file, then `creds.txt` itself.

Mount the file as a Docker secret, as `docker-compose.yaml` does.

Running it
----------

1. Save your API key in `thetadata-api-key.txt` (ignored by git).
2. `docker compose up --build thetaterm`
