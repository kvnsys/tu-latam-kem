from diagrams import Cluster, Diagram
from diagrams.aws.compute import Lambda
from diagrams.aws.database import Redshift
from diagrams.aws.analytics import ManagedStreamingForKafka
from diagrams.aws.analytics import Glue
from diagrams.aws.database import DB
from diagrams.aws.network import APIGateway
from diagrams.aws.network import VPC
from diagrams.aws.management import Cloudwatch
from diagrams.aws.management import CloudwatchAlarm
from diagrams.onprem.iac import Terraform
from diagrams.aws.storage import S3


with Diagram("Advanced Analytics", show=False):
    
    with Cluster("Source of Data"):
      datasrc = [DB("DataSource"),
                 DB("DataSource"),
                 DB("DataSource")]

    with Cluster("Consumers and Ingestion"):
      dbredshift = Redshift("Redshift")
  
      with Cluster("Ingest into DB"):
        kafka = ManagedStreamingForKafka("Kafka stream")
        translation = Glue("AWS Glue Translations") 

      with Cluster("Consumers"):
        apigw = APIGateway("API Gateway")
        httpend = Lambda("HTTP Endpoint")

    with Cluster("Observability"):
      cloudw = Cloudwatch("AWS Cloudwatch")

    with Cluster("Deploy"):
      tf = Terraform("tf deploy")
      tfstate = S3("S3 tfstate")
        
    consumers = apigw - httpend
    consumers >> dbredshift
    analytics = [consumers, kafka, dbredshift]
    translation >> dbredshift
    kafka >> translation
    datasrc >> kafka
#    [kafka, dbredshift, httpend] >> cloudw
    cloudw
    deploy = tf - tfstate

