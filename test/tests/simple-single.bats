# source docker helpers
. util/docker.sh

setup() {
	start_container "simple-single" "192.168.0.2"
}

teardown() {
	stop_container "simple-single"
}

@test "simple-single-configure-start" {
  run run_hook "simple-single" "default-configure" "$(payload simple-single)"

  run run_hook "simple-single" "default-start" "$(payload simple-single)"

  run docker exec simple-single bash -c "ps aux | grep [u]nfs"

  [ "$status" -eq 0 ] 
}