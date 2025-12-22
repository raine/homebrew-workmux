class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.57"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.57/aarch64-apple-darwin.tar.gz"
      sha256 "bbf78985e9854282120ac441f5ae3102e9f4849fe61834b4e43ac47b0cbd4df8"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.57/x86_64-apple-darwin.tar.gz"
      sha256 "cfe9e20d4883b4784c2bb6120d641146baf31fccbbe0da0298ccfcbfb8ef575f"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.57/aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d253aef5bb842bcd4ed80065c315e831d5ea2a8fcb9474760c1f5d587e2d9ff"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.57/x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ee6c6ac191ba5f709406ef1bb877e14d7c085b67252970c6f2a2f577f169fe2f"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
