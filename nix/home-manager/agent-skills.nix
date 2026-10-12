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
    sources.natural-japanese = {
      input = "natural-japanese-skills";
      subdir = "skills";
    };
    sources.crit = {
      input = "crit-skills";
      subdir = "integrations/codex/skills";
    };
    skills.enable = [
      "crit"
      "crit-cli"
      "frontend-design"
      "herdr"
      "natural-japanese"
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
