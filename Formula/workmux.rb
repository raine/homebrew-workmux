class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.77"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.77/workmux-darwin-arm64.tar.gz"
      sha256 "c57c17bfe8be5bb09d3aea86ae45ab2ee59eaf44d571b6646f1d7ee2ad67f858"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.77/workmux-darwin-amd64.tar.gz"
      sha256 "6a919b626a5e9ccffaf7e2dfb6a74c2352efacbd06acb08391382d6e526d7e9b"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.77/workmux-linux-arm64.tar.gz"
      sha256 "4cfd73eb6821ca2997d2482d1ed43d33a4cb5a9cc9d30533b874947d8e506af1"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.77/workmux-linux-amd64.tar.gz"
      sha256 "36f24cfa99653b13402136640006d2ec24afdb450639ab0622057ef8ff9cc3de"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
