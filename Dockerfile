FROM ghcr.io/graalvm/native-image-community:21-muslib as build

WORKDIR /var

COPY gradle/ /var/gradle
COPY src/ /var/src
COPY build.gradle /var
COPY gradlew /var
COPY settings.gradle /var

RUN mkdir -p /var/build/native/nativecompile

RUN microdnf install findutils
RUN cd /var
RUN chmod +x gradlew
RUN /var/gradlew nativeBuild

#ENTRYPOINT ["/var/build/native/nativeCompile/demo-vm"]

FROM alpine:3.19

COPY --from=build /var/build/native/nativeCompile/demo-vm /demo-vm

EXPOSE 8080

ENTRYPOINT ["/demo-vm"]