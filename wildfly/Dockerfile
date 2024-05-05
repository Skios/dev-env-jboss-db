# Wildfly 10.1.0.Final on Alpine Linux
FROM alpine:3.14

# Add labels for metadata
LABEL maintainer="MrCid <mattecama95@gmail.com>" \
      description="WildFly 10.1.0.Final on Alpine Linux"

USER root
# Arguments
ARG WILDFLY_MODE=standalone

# Set the WILDFLY environment variables
ENV JBOSS_VERSION=26.1.3.Final \
    JBOSS_USER_HOME=/opt/jboss \
    JBOSS_HOME=/opt/jboss/wildfly \
    JAVA_VERSION=11 \
    POSTGRESQL_JDBC_VERSION=42.2.27 \
    POSTGRESQL_JDBC_URL=https://jdbc.postgresql.org/download/postgresql-$POSTGRESQL_JDBC_VERSION.jar \
    WILDFLY_MODE=$WILDFLY_MODE

# Install dependencies
RUN apk --no-cache add openjdk${JAVA_VERSION} curl shadow bash

# Download and set up WildFly
RUN mkdir -p $JBOSS_USER_HOME /tmp/jdbc-driver \
    && curl -L -o /tmp/wildfly.tar.gz https://github.com/wildfly/wildfly/releases/download/$JBOSS_VERSION/wildfly-$JBOSS_VERSION.tar.gz \
    && tar xfv /tmp/wildfly.tar.gz -C /tmp \
    && mv /tmp/wildfly-$JBOSS_VERSION $JBOSS_HOME \
    && rm /tmp/wildfly.tar.gz \
    && $JBOSS_HOME/bin/add-user.sh -m -u admin -p admin --silent

# Create necessary directories and user
RUN groupadd -r jboss -g 1000 \
    && useradd -u 1000 -r -g jboss -m -d $JBOSS_USER_HOME -s /sbin/nologin jboss \
    && chmod 755 $JBOSS_USER_HOME \
    && chown -RH jboss:jboss $JBOSS_USER_HOME

# Create necessaries directories for modules
RUN mkdir -p $JBOSS_HOME/modules/system/layers/base/org/postgresql/main

WORKDIR ${JBOSS_HOME}/modules/system/layers/base/org/postgresql/main/
RUN curl -L "https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRESQL_JDBC_VERSION}/postgresql-${POSTGRESQL_JDBC_VERSION}.jar" -o "postgresql-${POSTGRESQL_JDBC_VERSION}.jar"
ADD jdbc-driver/postgresql/module.xml ${JBOSS_HOME}/modules/system/layers/base/org/postgresql/main/
# Expose the HTTP and management port
EXPOSE 8080 9990

RUN echo BUILDING WILDFLY: Selected mode is: $WILDFLY_MODE
    
# Copy the entrypoint script into the image
COPY entrypoint.sh /opt/jboss/wildfly/entrypoint.sh
    
# Make the entrypoint script executable
RUN chmod +x /opt/jboss/wildfly/entrypoint.sh
    
USER jboss
    
#Start WildFly
# Set the entrypoint to the custom entrypoint script
ENTRYPOINT ["/opt/jboss/wildfly/entrypoint.sh"]