class Workmux < Formula
  desc "Opinionated workflow tool that orchestrates git worktrees and tmux"
  homepage "https://github.com/raine/workmux"
  version "0.1.237"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/raine/workmux/releases/download/v0.1.237/workmux-darwin-arm64.tar.gz"
      sha256 "e108d76cca3d6efd5284409e7cede02f7dd9d0c7a9d5b5ba7117f3c34dde76e5"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.237/workmux-darwin-amd64.tar.gz"
      sha256 "47c33258a7b231145eda40bc50e460fa285945c29c85530be061e571b9260163"
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/raine/workmux/releases/download/v0.1.237/workmux-linux-arm64.tar.gz"
      sha256 "a9d09a58cfd87501b626d8accec1bfa4fc59495209f51cfd8cbda490bbede2a7"
    else
      url "https://github.com/raine/workmux/releases/download/v0.1.237/workmux-linux-amd64.tar.gz"
      sha256 "416802369566523ea9ca63ad741c29947799a9b069ef48701778a30095f88bdc"
    end
  end

  def install
    bin.install "workmux"
  end

  test do
    assert_match version.to_s, shell_output("\#{bin}/workmux --version")
  end
end
