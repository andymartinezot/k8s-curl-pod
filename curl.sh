for from in "testapp1"; do 
    for to in "testapp2"; do 
        POD_NAME=$(kubectl get pod -l app=sleep -n ${from} -o jsonpath='{.items[0].metadata.name}')
        echo "POD_NAME: $POD_NAME"
        echo "Curling http://httpbin.${to}:8000/ip from namespace ${from}"
        kubectl exec "$POD_NAME" -c sleep -n ${from} -- \
            curl "http://httpbin.${to}:8000/ip" -s -o /dev/null -w "sleep.${from} to httpbin.${to}: %{http_code}\n"
    done 
done