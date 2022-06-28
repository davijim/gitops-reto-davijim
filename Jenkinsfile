pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('aws_key_davijim')
        AWS_SECRET_ACCESS_KEY = credentials('aws_pass_davijim')
    }
    stages {
        stage ('Terraform init') {
            steps {
                sh 'terraform init'
            }
        }
        stage ('Terraform plan') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                sh 'terraform plan'
            }
        }
        stage ('Terraform apply') {
            when {
                branch 'main'
            }
            steps {
                sh 'terraform apply --auto-approve'
            }
        }
        stage ('Ansible otras ramas') {
            when {
                not {
                    branch 'main'
                }
            }
            steps {
                sh 'ansible-playbook ansible_reto.yml --check'
            }
        }
        stage ('Ansible rama Main') {
            when {
                branch 'main'
            }
            steps {
                sh 'ansible-playbook ansible_reto.yml'
            }  
        }
    } 
}