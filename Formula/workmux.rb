class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.179"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.179/workmux-darwin-arm64.tar.gz"
      sha256 "3a7fdd3323c40817f14484f992496623755aa2b97ac09adca82340b66f0f7864"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.179/workmux-darwin-amd64.tar.gz"
      sha256 "04aa042b0d9a16eedef7ba99ec0ce055a913927cc6b6c84d19dc231871f21299"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.179/workmux-linux-arm64.tar.gz"
      sha256 "1a87683b0e22d826e36e42d65703de117e8f4f3ceb0401531775e8b81016bee9"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.179/workmux-linux-amd64.tar.gz"
      sha256 "2f1a7930f69e3f86e78dc107c7ac6c84c5cf09b12a05971ed9d38ae2022c3dc3"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
