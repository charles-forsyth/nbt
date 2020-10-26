#!/bin/sh

name="blast$1"

cat <<EOF | kubectl apply -f -
apiVersion: batch/v1
kind: Job
metadata:
  name: $name
spec:
  template:
    spec:
      containers:
      - name: blast
        image: gitlab-registry.nautilus.optiputer.net/prp/jupyterlab
        command:
        - sh
        - -c
        - "/opt/repo/nbt/blast/install.sh && /opt/repo/nbt/blast/blast.sh"
        volumeMounts:
        - mountPath: /sharedvol
          name: sharedvol
        - name: git-repo
          mountPath: /opt/repo
        resources:
          limits:
            memory: 4Gi
            cpu: "4"
          requests:
            memory: 2.5Gi
            cpu: "4"
      initContainers:
      - name: init-clone-repo
        image: alpine/git
        args:
          - clone
          - --single-branch
          - https://github.com/charles-forsyth/nbt.git
          - /opt/repo/nbt
        volumeMounts:
          - name: git-repo
            mountPath: /opt/repo
      volumes:
      - name: sharedvol
        persistentVolumeClaim:
          claimName: master-vol
      - name: git-repo
        emptyDir: {}
      restartPolicy: Never
  backoffLimit: 2
EOF
