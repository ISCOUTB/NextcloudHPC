#!/usr/bin/env python
import pika, json, subprocess

connection = pika.BlockingConnection(
    pika.ConnectionParameters(host='rabbitmq'))
channel = connection.channel()

channel.queue_declare(queue='nextcloud')

def callback(ch, method, properties, body):
    body = json.loads(body)
    file = body['file'].replace("/var/www/html/", "/home/nextcloud/")
    split = file.split("/")
    count = len(split)
    path = ""
    for x in range (count - 1):
        path += split[x] + "/"

    p = subprocess.Popen(["condor_submit", split[count - 1]], cwd=path,
                                 stdout=subprocess.PIPE,
                                 stderr=subprocess.PIPE,
                                 stdin=subprocess.PIPE)
    out, err = p.communicate()
    print(file)


channel.basic_consume(
    queue='nextcloud', on_message_callback=callback, auto_ack=True)

print(' [*] Waiting for messages. To exit press CTRL+C')
channel.start_consuming()