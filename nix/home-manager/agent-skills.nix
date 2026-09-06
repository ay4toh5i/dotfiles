{ ... }:
{
  programs.agent-skills = {
    enable = true;
    sources.anthropic = {
      input = "anthropic-skills";
      subdir = "skills";
    };
    sources.herdr = {
      input = "herdr-skills";
      subdir = "skills";
    };
    sources.mattpocock = {
      input = "mattpocock-skills";
      subdir = "skills";
    };
    skills.enable = [
      "frontend-design"
      "herdr"
      "skill-creator"
    ];
    skills.enableAll = [ "mattpocock" ];
    targets.claude = {
      enable = true;
      structure = "link";
    };
    targets.codex = {
      enable = true;
      structure = "link";
    };
  };
}
