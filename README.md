# bz-docker-replay
An experimental Docker container to run Boozang with Replay.io

## Usage

- Run without recording

docker run --rm -e "RECORD_REPLAY_API_KEY=___YOUR_REPLAY_IO_API_KEY___" styrman/boozang-runner-replay "___Boozang-test-url___"

- Run with recording enabled

docker run --rm -e "RECORD_ALL_CONTENT=1" -e "RECORD_REPLAY_API_KEY=___YOUR_REPLAY_IO_API_KEY___" styrman/boozang-runner-replay "___Boozang-test-url___"

