using UnityEngine;

// Object for holding reference to UI clips.

[CreateAssetMenu(fileName = "NewUIAudio", menuName = "ScriptableObjects/UIAudio", order = 1)]
public class UIAudio : ScriptableObject
{
    // Define a list/array to hold references to UI audio clips
    public AudioClip mouseOverClip;
    public AudioClip mouseClickClip;
}