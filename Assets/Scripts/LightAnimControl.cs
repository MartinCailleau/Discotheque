using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightAnimControl : MonoBehaviour {

    Animation[] anims;
    int i = 0;
	// Use this for initialization
	void Start () {
        anims = GetComponentsInChildren<Animation>();
        InvokeRepeating("launchAnimWithDelay", 0, 0.1f);
	}


    void launchAnimWithDelay() {
        if (i < anims.Length)
        {
            anims[i].Play();
            ++i;
        }
        
        if (i>anims.Length)
        {
            CancelInvoke("launchAnimWithDelay");
        }
    }
	
	// Update is called once per frame
	void Update () {
		
	}
}
