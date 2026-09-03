class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.254"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.254/workmux-darwin-arm64.tar.gz"
      sha256 "a366e29ef1ffb58a1b3a28f61768870267ff2923d1c9c0b8c4cf0c77d92bd063"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.254/workmux-darwin-amd64.tar.gz"
      sha256 "32fffb60e94fa7150c1f4413d8350240e9312d46cbccfb474d5eac60241c1259"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.254/workmux-linux-arm64.tar.gz"
      sha256 "847b2696e3d2daf832efeea1265f98a04b4a0b9250b8d873b9f428a6fb129536"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.254/workmux-linux-amd64.tar.gz"
      sha256 "ed4a4a514f1eef32a26e832149acc56aefff722d6eb9fb146194f4bb2eb4ac46"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
