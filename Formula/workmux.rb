class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.218"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.218/workmux-darwin-arm64.tar.gz"
      sha256 "8e80438706900cb5ff85d53fa5ca27ab45bb45078c31812243b21fc3c06eeb92"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.218/workmux-darwin-amd64.tar.gz"
      sha256 "7d9a893be2fc442971d88c5596093ca5dd08936bccb6ba73ec8acf3691dc6704"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.218/workmux-linux-arm64.tar.gz"
      sha256 "7e1c867054b8cdc51ae70e9a634e9c7aa90e55d4e0e2ebf68562719e23b7e49e"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.218/workmux-linux-amd64.tar.gz"
      sha256 "7c29cc9806c0a638f5db155f440605a7a6584962b95e74a2768e7f97725dd60e"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
