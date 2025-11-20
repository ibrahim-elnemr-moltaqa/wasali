part of 'popular_sites_utils.dart';

enum PopularLinksSitesEnum {
  facebook,
  messenger,
  x,
  youtube,
  youtubeMusic,
  instagram,
  tikTok,
  soundCloud,
  amazonMusic,
  appleMusic,
  spotify,
  pandora,
  amazon,
  clubhouse,
  discord,
  gitHup,
  gmail,
  googleDrive,
  google,
  googleMeet,
  googlePlay,
  microsoft,
  microsoftTeams,
  microsoftOneDrive,
  microsoftSkype,
  microsoftOutlook,
  microsoftOneNote,
  microsoftExcel,
  microsoftWord,
  microsoftPowerPoint,
  linkedIn,
  pinterest,
  reddit,
  snapChat,
  telegram,
  threads,
  utorrent,
  whatsApp,
  zoom,
  apple,
  unKnown
}

extension PopularLinksSitesEnumExtension on PopularLinksSitesEnum {
  String get svgPath {
    switch (this) {
      case PopularLinksSitesEnum.facebook:
        return _PopularLinksSitesSvgPaths.facebook;
      case PopularLinksSitesEnum.x:
        return _PopularLinksSitesSvgPaths.x;
      case PopularLinksSitesEnum.youtube:
        return _PopularLinksSitesSvgPaths.youtube;
      case PopularLinksSitesEnum.youtubeMusic:
        return _PopularLinksSitesSvgPaths.youtubeMusic;
      case PopularLinksSitesEnum.instagram:
        return _PopularLinksSitesSvgPaths.instagram;
      case PopularLinksSitesEnum.tikTok:
        return _PopularLinksSitesSvgPaths.tikTok;
      case PopularLinksSitesEnum.soundCloud:
        return _PopularLinksSitesSvgPaths.soundCloud;
      case PopularLinksSitesEnum.amazonMusic:
        return _PopularLinksSitesSvgPaths.amazonMusic;
      case PopularLinksSitesEnum.appleMusic:
        return _PopularLinksSitesSvgPaths.appleMusic;
      case PopularLinksSitesEnum.spotify:
        return _PopularLinksSitesSvgPaths.spotify;
      case PopularLinksSitesEnum.pandora:
        return _PopularLinksSitesSvgPaths.pandora;
      case PopularLinksSitesEnum.amazon:
        return _PopularLinksSitesSvgPaths.amazon;
      case PopularLinksSitesEnum.clubhouse:
        return _PopularLinksSitesSvgPaths.clubhouse;
      case PopularLinksSitesEnum.discord:
        return _PopularLinksSitesSvgPaths.discord;
      case PopularLinksSitesEnum.gitHup:
        return _PopularLinksSitesSvgPaths.gitHup;
      case PopularLinksSitesEnum.gmail:
        return _PopularLinksSitesSvgPaths.gmail;
      case PopularLinksSitesEnum.googleDrive:
        return _PopularLinksSitesSvgPaths.googleDrive;
      case PopularLinksSitesEnum.google:
        return _PopularLinksSitesSvgPaths.google;
      case PopularLinksSitesEnum.microsoft:
        return _PopularLinksSitesSvgPaths.microsoft;
      case PopularLinksSitesEnum.googleMeet:
        return _PopularLinksSitesSvgPaths.googleMeet;
      case PopularLinksSitesEnum.googlePlay:
        return _PopularLinksSitesSvgPaths.googlePlay;
      case PopularLinksSitesEnum.microsoftTeams:
        return _PopularLinksSitesSvgPaths.microsoftTeams;
      case PopularLinksSitesEnum.linkedIn:
        return _PopularLinksSitesSvgPaths.linkedIn;
      case PopularLinksSitesEnum.microsoftOneDrive:
        return _PopularLinksSitesSvgPaths.oneDrive;
      case PopularLinksSitesEnum.pinterest:
        return _PopularLinksSitesSvgPaths.pinterest;
      case PopularLinksSitesEnum.reddit:
        return _PopularLinksSitesSvgPaths.reddit;
      case PopularLinksSitesEnum.microsoftSkype:
        return _PopularLinksSitesSvgPaths.skype;
      case PopularLinksSitesEnum.snapChat:
        return _PopularLinksSitesSvgPaths.snapShat;
      case PopularLinksSitesEnum.telegram:
        return _PopularLinksSitesSvgPaths.telegram;
      case PopularLinksSitesEnum.threads:
        return _PopularLinksSitesSvgPaths.threads;
      case PopularLinksSitesEnum.utorrent:
        return _PopularLinksSitesSvgPaths.utorrent;
      case PopularLinksSitesEnum.whatsApp:
        return _PopularLinksSitesSvgPaths.whatsApp;
      case PopularLinksSitesEnum.zoom:
        return _PopularLinksSitesSvgPaths.zoom;
      case PopularLinksSitesEnum.microsoftOutlook:
        return _PopularLinksSitesSvgPaths.outlook;
      case PopularLinksSitesEnum.microsoftOneNote:
        return _PopularLinksSitesSvgPaths.oneNote;
      case PopularLinksSitesEnum.microsoftExcel:
        return _PopularLinksSitesSvgPaths.excel;
      case PopularLinksSitesEnum.microsoftWord:
        return _PopularLinksSitesSvgPaths.word;
      case PopularLinksSitesEnum.microsoftPowerPoint:
        return _PopularLinksSitesSvgPaths.powerPoint;
      case PopularLinksSitesEnum.messenger:
        return _PopularLinksSitesSvgPaths.messenger;
      case PopularLinksSitesEnum.apple:
        return _PopularLinksSitesSvgPaths.apple;

      case PopularLinksSitesEnum.unKnown:
        return _PopularLinksSitesSvgPaths.unKnown;
    }
  }

  // get social media name
  String get name {
    switch (this) {
      case PopularLinksSitesEnum.facebook:
        return appLocalizer.facebook;
      case PopularLinksSitesEnum.x:
        return appLocalizer.x;
      case PopularLinksSitesEnum.youtube:
        return appLocalizer.youtube;
      case PopularLinksSitesEnum.youtubeMusic:
        return appLocalizer.youtubeMusic;
      case PopularLinksSitesEnum.instagram:
        return appLocalizer.instagram;
      case PopularLinksSitesEnum.tikTok:
        return appLocalizer.tikTok;
      case PopularLinksSitesEnum.soundCloud:
        return appLocalizer.soundCloud;
      case PopularLinksSitesEnum.amazonMusic:
        return appLocalizer.amazonMusic;
      case PopularLinksSitesEnum.appleMusic:
        return appLocalizer.appleMusic;
      case PopularLinksSitesEnum.spotify:
        return appLocalizer.spotify;
      case PopularLinksSitesEnum.pandora:
        return appLocalizer.pandora;
      case PopularLinksSitesEnum.amazon:
        return appLocalizer.amazon;
      case PopularLinksSitesEnum.clubhouse:
        return appLocalizer.clubhouse;
      case PopularLinksSitesEnum.discord:
        return appLocalizer.discord;
      case PopularLinksSitesEnum.gitHup:
        return appLocalizer.gitHub;
      case PopularLinksSitesEnum.gmail:
        return appLocalizer.gmail;
      case PopularLinksSitesEnum.googleDrive:
        return appLocalizer.googleDrive;
      case PopularLinksSitesEnum.google:
        return appLocalizer.google;
      case PopularLinksSitesEnum.microsoft:
        return appLocalizer.microsoft;
      case PopularLinksSitesEnum.googleMeet:
        return appLocalizer.googleMeet;
      case PopularLinksSitesEnum.googlePlay:
        return appLocalizer.googlePlay;
      case PopularLinksSitesEnum.microsoftTeams:
        return appLocalizer.microsoftTeams;
      case PopularLinksSitesEnum.linkedIn:
        return appLocalizer.linkedIn;
      case PopularLinksSitesEnum.microsoftOneDrive:
        return appLocalizer.oneDrive;
      case PopularLinksSitesEnum.pinterest:
        return appLocalizer.pinterest;
      case PopularLinksSitesEnum.reddit:
        return appLocalizer.reddit;
      case PopularLinksSitesEnum.microsoftSkype:
        return appLocalizer.skype;
      case PopularLinksSitesEnum.snapChat:
        return appLocalizer.snapChat;
      case PopularLinksSitesEnum.telegram:
        return appLocalizer.telegram;
      case PopularLinksSitesEnum.threads:
        return appLocalizer.threads;
      case PopularLinksSitesEnum.utorrent:
        return appLocalizer.uTorrent;
      case PopularLinksSitesEnum.whatsApp:
        return appLocalizer.whatsApp;
      case PopularLinksSitesEnum.zoom:
        return appLocalizer.zoom;
      case PopularLinksSitesEnum.microsoftOutlook:
        return appLocalizer.outlook;
      case PopularLinksSitesEnum.microsoftOneNote:
        return appLocalizer.oneNote;
      case PopularLinksSitesEnum.microsoftExcel:
        return appLocalizer.excel;
      case PopularLinksSitesEnum.microsoftWord:
        return appLocalizer.word;
      case PopularLinksSitesEnum.microsoftPowerPoint:
        return appLocalizer.powerPoint;
      case PopularLinksSitesEnum.messenger:
        return appLocalizer.messenger;
      case PopularLinksSitesEnum.apple:
        return appLocalizer.apple;
      case PopularLinksSitesEnum.unKnown:
        return appLocalizer.unknown;
    }
  }

  // get base social media url
  String get baseUrl {
    switch (this) {
      case PopularLinksSitesEnum.facebook:
        return "https://www.facebook.com";
      case PopularLinksSitesEnum.x:
        return "https://www.twitter.com"; // X is Twitter's new name
      case PopularLinksSitesEnum.youtube:
        return "https://www.youtube.com";
      case PopularLinksSitesEnum.youtubeMusic:
        return "https://music.youtube.com";
      case PopularLinksSitesEnum.instagram:
        return "https://www.instagram.com";
      case PopularLinksSitesEnum.tikTok:
        return "https://www.tiktok.com";
      case PopularLinksSitesEnum.soundCloud:
        return "https://soundcloud.com";
      case PopularLinksSitesEnum.amazonMusic:
        return "https://music.amazon.com";
      case PopularLinksSitesEnum.appleMusic:
        return "https://music.apple.com";
      case PopularLinksSitesEnum.spotify:
        return "https://www.spotify.com";
      case PopularLinksSitesEnum.pandora:
        return "https://www.pandora.com";
      case PopularLinksSitesEnum.amazon:
        return "https://www.amazon.com";
      case PopularLinksSitesEnum.clubhouse:
        return "https://www.clubhouse.com";
      case PopularLinksSitesEnum.discord:
        return "https://discord.com";
      case PopularLinksSitesEnum.gitHup:
        return "https://github.com";
      case PopularLinksSitesEnum.gmail:
        return "https://mail.google.com";
      case PopularLinksSitesEnum.googleDrive:
        return "https://drive.google.com";
      case PopularLinksSitesEnum.google:
        return "https://www.google.com";
      case PopularLinksSitesEnum.microsoft:
        return "https://www.microsoft.com";
      case PopularLinksSitesEnum.googleMeet:
        return "https://meet.google.com";
      case PopularLinksSitesEnum.googlePlay:
        return "https://play.google.com";
      case PopularLinksSitesEnum.microsoftTeams:
        return "https://teams.microsoft.com";
      case PopularLinksSitesEnum.linkedIn:
        return "https://www.linkedin.com";
      case PopularLinksSitesEnum.microsoftOneDrive:
        return "https://onedrive.live.com";
      case PopularLinksSitesEnum.pinterest:
        return "https://www.pinterest.com";
      case PopularLinksSitesEnum.reddit:
        return "https://www.reddit.com";
      case PopularLinksSitesEnum.microsoftSkype:
        return "https://www.skype.com";
      case PopularLinksSitesEnum.snapChat:
        return "https://www.snapchat.com";
      case PopularLinksSitesEnum.telegram:
        return "https://telegram.org";
      case PopularLinksSitesEnum.threads:
        return "https://www.threads.net";
      case PopularLinksSitesEnum.utorrent:
        return "https://www.utorrent.com";
      case PopularLinksSitesEnum.whatsApp:
        return "https://www.whatsapp.com";
      case PopularLinksSitesEnum.zoom:
        return "https://zoom.us";
      case PopularLinksSitesEnum.microsoftOutlook:
        return "https://outlook.live.com";
      case PopularLinksSitesEnum.microsoftOneNote:
        return "https://www.onenote.com";
      case PopularLinksSitesEnum.microsoftExcel:
        return "https://office.com/excel";
      case PopularLinksSitesEnum.microsoftWord:
        return "https://office.com/word";
      case PopularLinksSitesEnum.microsoftPowerPoint:
        return "https://office.com/powerpoint";
      case PopularLinksSitesEnum.messenger:
        return "https://www.messenger.com";
      case PopularLinksSitesEnum.apple:
        return "https://www.apple.com";
      case PopularLinksSitesEnum.unKnown:
        return "";
    }
  }

  Widget iconWidget({double? size, Color? color}) {
    return AppSvgIcon(
      path: svgPath,
      size: size,
      color: color,
      placholder: const AppSvgIcon(
        path: _PopularLinksSitesSvgPaths.unKnown,
      ),
    );
  }
}
