FROM openjdk:8

RUN mkdir -p /whatap   
COPY --from=whatap/kube_mon /data/agent/micro/whatap.agent.kube.jar /whatap
COPY whatap-virtual-2.2.3.jar /data/
COPY ./whatap.conf /whatap/

ENTRYPOINT  ["/usr/local/openjdk-8/bin/java", "-javaagent:/whatap/whatap.agent.kube.jar", "-Dwhatap.micro.enabled=true","-cp", "/data/whatap-virtual-2.2.3.jar", "com.virtual.App" ]