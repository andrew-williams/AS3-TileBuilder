package media  
{
	/**
	 *
	 * @author Andrew Williams
	 * 
	 * Class:		 SoundManager
	 * Description:	 To handle all sounds being processed by the program. Comes with base SFX and BGM channel.
	 * 				 My to-do list only involves making custom channels for future use that may require additional channels.
	 * Built for:  	 All My AS3 Related Projects
	 * Modified for: N/A
	 * 
	 */
	
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.media.SoundTransform;

	public class SoundManager 
	{
		// Variables
		private var SFXChannel:SoundChannel;	// Channel where all SFX will be played.
		private var BGMChannel:SoundChannel;	// Channel where all BGM will be played.
		private var SFXVolume:SoundTransform;	// Volume control for SFX.
		private var BGMVolume:SoundTransform;	// Volume control for BGM.
		private var BGMSample:Sound;			// BGM Sample that is currently loaded. There is only one BGM playing at one time.
		private var isMute:Boolean = false;		// Mute Control.
		private var BGMLoopback:Number;			// Position to begin loop playback  for BGM.
												// (Like how theres the beginning part of music, then when it loops,
												//  it starts at a different location, seamless transition loop.)
		
		/*
		 * Functions (All functions are sorted in alphabetical order for easy searching (excluding the constructor).
		 * Function List: 	SoundManager
		 * 					AdjustBGMVolume
		 * 					AdjustSFXVolume
		 * 					BGMComplete
		 * 					GetMute
		 * 					LoopBGM (private)
		 * 					Mute (private)
		 * 					PlayBGM
		 * 					PlaySFX
		 * 					StopBGMChannel
		 * 					StopSFXChannel
		 * 					ToggleMute
		 * 
		 */
		
												
		// Constructor: The sound manager should only be loaded once.
		//				Initialize all sound channels and volume controls.
		public function SoundManager():void
		{
			SFXVolume = new SoundTransform();
			BGMVolume = new SoundTransform();
			SFXChannel = new SoundChannel();
			BGMChannel = new SoundChannel();
		}
		
		// Function: AdjustBGMVolume
		//			 This function takes a new BGM value, then
		//			 applies the new volume to the BGM sound channel.
		public function AdjustBGMVolume(value:Number) :void {
			BGMVolume.volume = value;
			BGMChannel.soundTransform = BGMVolume;
		}
		
		// Function: AdjustSFXVolume
		//			 This function takes a new SFX value, then
		//			 applies the new volume to the SFX sound channel.
		public function AdjustSFXVolume(value:Number) :void {
			SFXVolume.volume = value;
			SFXChannel.soundTransform = SFXVolume;
		}
		
		// Function: BGMComplete
		//			 This function listens when the BGM sample is complete.
		//			 When the original sample is complete, remove listener and begin to play BGM at custom start location.
		private function BGMComplete(e:Event):void {
			BGMChannel.removeEventListener(Event.SOUND_COMPLETE, BGMComplete);
			PlayBGM(BGMSample, BGMLoopback);
		}
		
		// Function: GetMute
		//			 This function gets the value of isMute.
		//			 If sound is muted, return true, else, return false.
		public function GetMute():Boolean {
			return isMute;
		}
		
		// Function: LoopBGM (private)
		//			 This private function plays a BGM sample from a set custom location (if any). This will only ever be
		//			 accessed when the original sample is completed, loop is set as high as possible.
		private function LoopBGM():void {
			StopBGMChannel();
			BGMChannel = BGMSample.play(BGMLoopback, 32767, BGMVolume);
		}
		
		// Function: Mute (private)
		//			 This function mutes all sounds. The volume control is
		//			 forced set to 0.
		private function Mute():void {
			BGMVolume.volume = 0;
			BGMChannel.soundTransform = BGMVolume;
			SFXVolume.volume = 0;
			SFXChannel.soundTransform = SFXVolume;
		}
		
		// Function: PlayBGM
		//			 This function plays a BGM sample. It takes a loopback start number for custom loop start.
		//			 Sample is stored for reference, only one BGM will ever be played.
		public function PlayBGM(sound:Sound, loopbackStart:Number = 0, disableLoop:Boolean = false):void {
			StopBGMChannel();												// Playing a new BGM, stop all sound from channel.
			BGMSample = sound;												// Keep sample in memory, only one is loaded at a time.
			BGMLoopback = loopbackStart;									// Set BGM loopback position.
			BGMChannel = BGMSample.play(0, 0, BGMVolume);					// Play BGM starting at beginning. 
			if (!disableLoop)												// If looping is not disabled, add listener.
			BGMChannel.addEventListener(Event.SOUND_COMPLETE, BGMComplete); // Add listener that when BGM is done, loop BGM.
		}
		
		// Function: PlaySFX
		//			 This function plays a SFX sample through the SFX Channel. Multiple sounds may be played at once,
		//			 therfore the channel is not cleared before a new sample is played.
		public function PlaySFX(sound:Sound):void {
			SFXChannel = sound.play(0, 0, SFXVolume);
		}
		
		// Function: StopBGMChannel
		//			 This function stops all sounds coming from the BGM channel.
		public function StopBGMChannel():void {
			BGMChannel.stop();
		}
		
		// Function: StopSFXChannel
		//			 This function stops all sounds coming from the SFX channel.
		public function StopSFXChannel():void {
			SFXChannel.stop();
		}
		
		// Function: ToggleMute
		//			 This function requires the SFX and BGM volumes. If not muted,
		//			 calls the Mute function to mute all sounds. If muted, unmute,
		//			 takes the SFX and BGM volumes and reapply to volume controls.
		public function ToggleMute(sfxVol:Number,bgmVol:Number):void {
			if (!isMute) {
				isMute = true;
				Mute();
			}
			else {
				isMute = false;
				AdjustSFXVolume(sfxVol);
				AdjustBGMVolume(bgmVol);
			}
		}
		
	}

}