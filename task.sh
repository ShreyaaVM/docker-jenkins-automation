echo 'public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello DevOps");
    }
}' > Hello.java

javac Hello.java

echo 'FROM openjdk:8-jdk-alpine
COPY . /usr/src/myapp
WORKDIR /usr/src/myapp
RUN javac Hello.java
CMD ["java", "Hello"]' > Dockerfile

docker build -t devops .

docker run --name java devops

docker commit java devops-snapshot

docker tag devops-snapshot shreyaavm/devops-snapshot

docker login

docker push shreyaavm/devops-snapshot

