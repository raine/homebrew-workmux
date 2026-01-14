class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.92"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.92/workmux-darwin-arm64.tar.gz"
      sha256 "075447b9edef44dbc93eaa473af02474c3e102cedf0eb270b6b19162d64b6981"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.92/workmux-darwin-amd64.tar.gz"
      sha256 "d1aa680ffece309f5750c3a90a2ed50427b0e40bf5a4b3e420927249a9676cfe"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.92/workmux-linux-arm64.tar.gz"
      sha256 "bd37c0d972f695a5cc71faebc1a0215fefc9ef15cbbf4fddd691642d719f4e03"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.92/workmux-linux-amd64.tar.gz"
      sha256 "05d1798684fcec6bcb3db6f63426434a3810887cbc2cb8e868799ace1ed248bd"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
