using System.Collections;
using System.Collections.Generic;
using UnityEngine;

[RequireComponent(typeof(AudioClipBucket),typeof(AudioSource))]
public class AudioManager : MonoBehaviour
{
    [SerializeField] string sfxFolder;
    public float masterVolume = 0.5f;
    AudioClipBucket audioClipBucket;

    public UIAudio uiAudioClips;

    public static AudioManager instance;
    void Awake()
    {
		if (instance != null && instance != this)
		{
			Destroy(gameObject);
		}
		else
		{
			instance = this;
		}
    }

    void Start()
    {
        audioClipBucket = GetComponent<AudioClipBucket>();
    }

    public void TryPlaySoundEffect(string clipName)
    {
        Debug.Log("Trying to play audio clip " + clipName);
        AudioClip tAudioClip;
        if (audioClipBucket.audioClipsDict.TryGetValue(clipName, out tAudioClip))
        {
            // Create a new GameObject to host the AudioSource
            GameObject audioObject = new GameObject("AudioSource_" + clipName);
            AudioSource audioSource = audioObject.AddComponent<AudioSource>();

            // Set the volume of the AudioSource
            audioSource.volume = masterVolume;

            // Play the audio clip
            audioSource.PlayOneShot(tAudioClip);
        }
        else
        {
            Debug.Log("Audio clip not found!");
        }
    }
}