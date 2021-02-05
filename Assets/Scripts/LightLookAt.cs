using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class LightLookAt : MonoBehaviour {
    Transform lookTarget;
    Transform light;
	// Use this for initialization
	void Start () {
        lookTarget = transform.Find("Light_control");
        light = transform.Find("Spotlight");
	}
	
	// Update is called once per frame
	void Update () {
        light.LookAt(lookTarget);
	}
}
