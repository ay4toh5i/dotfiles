{ ... }:
{
  programs.agent-skills = {
    enable = true;
    sources.anthropic = {
      input = "anthropic-skills";
      subdir = "skills";
    };
    skills.enable = [
      "frontend-design"
      "skill-creator"
    ];
    targets.claude.enable = true;
  };
}
