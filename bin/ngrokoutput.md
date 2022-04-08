Ideas:

```
# grabs the PID for the current running ngrok
ngrok_pid=$(pgrep ngrok)
echo "Current ngrok PID = ${ngrok_pid}"

# kills ngrok
kill_ngrok_pid=$(kill -9 $ngrok_pid)

# get exit status code for last command
check=$?

# check if the exit status returned success
if [ $check -eq 0 ]; then
    # re-start ngrok
    $(./ngrok http 5000 &)
    # do more checks below...
else
    echo "NO ngrok PID found"
fi
```


* Use Screen


https://stackoverflow.com/questions/51772794/kill-and-restart-ngrok-within-a-shell-script



Python method:


https://stackoverflow.com/questions/63492743/how-to-pipe-the-result-of-ngrok-http-8000-to-another-file


