FROM rivernet/java:8

ENV MAX_JAVA_HEAP_SIZE -Xmx512M
ENV MIN_JAVA_HEAP_SIZE -Xms128M
ENV JAVA_STACK_SIZE -Xss256K

COPY mycat /usr/local/mycat

CMD ["/bin/sh", "-c", "/usr/local/mycat/bin/mycat console"]

EXPOSE 8066 9066
