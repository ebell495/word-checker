FROM maven:3-openjdk-11 as builder
COPY . /word-checker
WORKDIR /word-checker
# Build the library jar and download the dependencies
RUN mvn clean package && mvn dependency:copy-dependencies
# Copy the jar to the fuzz folder and copy the dependencies to the fuzz folder
RUN mkdir ./fuzz/deps && find ./target -name "word-checker*.jar" -exec cp {} "./fuzz/deps/word-checker.jar" \; && cp ./target/dependency/* ./fuzz/deps && python3 fuzz/generate_classpath.py > fuzz/src/Manifest.txt
WORKDIR /word-checker/fuzz/src
# Build the fuzz target
RUN javac -cp "../deps/*" fuzz.java && jar cfme fuzz.jar Manifest.txt fuzz fuzz.class && chmod u+x fuzz.jar && cp fuzz.jar /word-checker/fuzz/deps
WORKDIR /word-checker/fuzz/deps