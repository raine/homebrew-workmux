class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.282"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.282/workmux-darwin-arm64.tar.gz"
      sha256 "47a5e1fea7e150c3fc24cb713fe444077b44272ca0c4033fe7cc3e3a3e236b2f"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.282/workmux-darwin-amd64.tar.gz"
      sha256 "dd4b9206ff0a47dea2a82a4a31536ea18a08c3802bb012d327d33080824fb007"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.282/workmux-linux-arm64.tar.gz"
      sha256 "80e2f99589fd1078aa62ee578b698a7fe8f24996254bd3576b10ab472c892100"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.282/workmux-linux-amd64.tar.gz"
      sha256 "f8e304f457a1e0b47c6c3317113d6eb1fcd44df46f233cc836e2615279bb94ee"
    end
  end

  def install
    bin.install "workmux"
    generate_completions_from_executable(bin/"workmux", "completions")
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
