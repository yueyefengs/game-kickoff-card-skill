# 游戏立项卡 Skill · Game Kickoff Card

把一个模糊的游戏想法，整理成**可以动手制作、可以交给 AI** 的清晰方向。

这是一个 [Agent Skill](https://www.anthropic.com/news/skills)，一次编写、**三端通用**：可安装到 **Claude**（Claude Code / Claude Desktop）、**Hermes Agent** 和 **Codex**。

> 方法论来源：游戏策划「机明」的短视频《AI做游戏焚诀之｜游戏立项卡》。
> 核心主张：别上来就对 AI 说"帮我做个什么游戏"——那样只会停在能跑的 Demo。
> 先填一张立项卡把方向定下来，再一步步做出来。策划案之于研发，正如提示词/文档之于 AI Agent。

---

## 它能做什么

当你说"我想做个游戏但不知从何下手"或"帮我填立项卡"时，这个 skill 会：

1. **逐项引导你填完 5 项立项卡**（而不是一股脑丢给你 5 个问题）：
   1. 一句话说清这是什么游戏（玩家扮演谁、主要做什么）
   2. 核心循环 + 你最想做好的那段体验
   3. 参考游戏（具体到"参考它的什么"）
   4. 资源 / 平台 / 时间限制与取舍
   5. 第一版范围 + 完成标准（最小闭环）
2. **帮你挑刺**：填完后主动指出哪些地方还模糊、矛盾、范围过大，给你选项让你拍板。
3. **产出可交付物**：一张干净的立项卡 + 可直接复制给 AI 编程 Agent 的启动提示词。

还附带：立项卡模板、AI 启动提示词、免费美术资源清单。

---

## 一键安装

```bash
git clone https://github.com/yueyefengs/game-kickoff-card-skill.git
cd game-kickoff-card-skill
./install.sh            # 交互选择安装到 Claude / Hermes / Codex
```

或指定目标：

```bash
./install.sh claude     # 装到 ~/.claude/skills/
./install.sh hermes     # 装到 ~/.hermes/skills/
./install.sh codex      # 装到 ~/.codex/skills/
./install.sh all        # 三端都装
```

安装脚本只是把 `game-kickoff-card/` 目录复制到对应工具的 skills 目录。你也可以手动复制。

---

## 手动安装

把 `game-kickoff-card/` 整个目录复制到对应位置：

| 工具 | 目标目录 |
| --- | --- |
| Claude Code / Desktop | `~/.claude/skills/game-kickoff-card/` |
| Hermes Agent | `~/.hermes/skills/game-kickoff-card/` |
| Codex | `~/.codex/skills/game-kickoff-card/` |

安装后在对话里说「我想做个游戏，帮我填立项卡」即可触发。

---

## 目录结构

```
game-kickoff-card/
├── SKILL.md                          # 主文件：触发条件 + 交互流程 + 原则
└── references/
    ├── kickoff-card-template.md       # 立项卡模板（可直接复制填写）
    ├── ai-handoff-prompt.md           # 交给 AI 的启动提示词（挑刺 / 开发两用）
    └── art-resources.md               # 免费 / 低成本 美术 & 音效资源站
```

---

## License

MIT — 方法论归原作者「机明」，本仓库为其游戏立项卡方法的 Agent Skill 实现。
