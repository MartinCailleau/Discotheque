using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraRotateAuto : MonoBehaviour {

    public float frequence;
    public float amplitude;
    private float x = 0;
	// Use this for initialization
	void Start () {
		
	}
	
	// Update is called once per frame
	void Update () {
        transform.Rotate(Vector3.up, (Mathf.Cos(x)* frequence) * amplitude, Space.World);
        x += 0.1f * Time.deltaTime;
	}
}
