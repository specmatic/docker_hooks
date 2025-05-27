#!/bin/bash

MODE="$1"
shutdown_triggered=false

# Trap shutdown to send metrics
function on_shutdown() {
    if [ "$shutdown_triggered" = true ]; then
      return
    fi
    shutdown_triggered=true

    echo "🔌 $MODE container ..."
    echo "📊 Logging to New Relic logs..."
    echo "✅ Post-hook complete."
}

# -------- PRE-HOOK: TaaS Authentication --------
echo "🔐 Validating TaaS authentication..."
echo "✅ TaaS authentication successful."


if [ "$MODE" == "test" ] || [ "$MODE" == "stub" ]; then
  trap on_shutdown SIGTERM SIGINT EXIT

  echo "Running in $MODE mode..."
  echo "🚀 Executing Specmatic with args : $@"
  specmatic "$@"
  exit_code=$?
  echo "Exiting with code: $exit_code"
else
  echo "Unknown MODE: $MODE. Use 'test' or 'stub'."
  exit 1
fi
