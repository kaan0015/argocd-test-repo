[1mdiff --git a/argo_cd_yaml_files/github.yaml b/argo_cd_yaml_files/github.yaml[m
[1mindex 3aa6111..915b990 100644[m
[1m--- a/argo_cd_yaml_files/github.yaml[m
[1m+++ b/argo_cd_yaml_files/github.yaml[m
[36m@@ -1,15 +1,17 @@[m
 apiVersion: argoproj.io/v1alpha1[m
 kind: Sensor[m
 metadata:[m
[31m-  name: mr-undeploy[m
[32m+[m[32m  name: mr-undeploy[m[41m [m
 spec:[m
[32m+[m[32m  template:[m
[32m+[m[32m    serviceAccountName: argo-events-sa[m
   dependencies:[m
[31m-  - name: mr-close[m
[32m+[m[32m  - name: payload[m
     eventSourceName: github[m
     eventName: example[m
   triggers:[m
   - template:[m
[31m-      name: mr-close[m
[32m+[m[32m      name: payload[m
       k8s:[m
         group: ""[m
         version: v1[m
[36m@@ -20,9 +22,9 @@[m [mspec:[m
             apiVersion: v1[m
             kind: Pod[m
             metadata:[m
[31m-              generateName: mr-close-[m
[32m+[m[32m              generateName: payload-[m
               labels:[m
[31m-                app: mr-close[m
[32m+[m[32m                app: payload[m
             spec:[m
               containers:[m
               - name: hello[m
[36m@@ -31,8 +33,7 @@[m [mspec:[m
                 args: ["This is the message you sent me:\n", ""][m
               restartPolicy: Never[m
         parameters:[m
[31m-        - src:[m
[31m-            dependencyName: mr-close[m
[31m-            dataKey: body.message[m
[31m-          dest: metadata.name[m
[31m-          [m
\ No newline at end of file[m
[32m+[m[32m          - src:[m
[32m+[m[32m              dependencyName: payload[m
[32m+[m[32m              dataKey: body.message[m
[32m+[m[32m            dest: spec.containers.0.args.1[m
\ No newline at end of file[m
