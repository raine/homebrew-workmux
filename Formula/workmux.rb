class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.97"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.97/workmux-darwin-arm64.tar.gz"
      sha256 "53ca873502428058730bada8e4645aa699c955565652e12bc623b57cdaaaf3f7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.97/workmux-darwin-amd64.tar.gz"
      sha256 "0fdb2a62e6d99553d9209d74ac8b50b8d4fdf513bb45e626330ae5fb8505daa8"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.97/workmux-linux-arm64.tar.gz"
      sha256 "a4e5e40a0eec1c417f84185088667705b93ea5620ca37f805151b0dd56b3af00"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.97/workmux-linux-amd64.tar.gz"
      sha256 "70b13561924c413f97d45e44514ce81e2dbcaff636943bed1afd2ce667110b82"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
