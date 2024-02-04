using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System.Reflection;
public class AudioClipBucket : MonoBehaviour
{
    [SerializeField] AudioClip testDoorUnlock;
    public Dictionary<string, AudioClip> audioClipsDict = new Dictionary<string, AudioClip>();

    void Start()
    {
        // Add the clips here. Bit annoying but I dont see how else to do it.
        AddClip("testDoorUnlock", testDoorUnlock);
    }

    public void AddClip(string clipName, AudioClip clip)
    {
        audioClipsDict.Add(clipName, clip);
    }

}
